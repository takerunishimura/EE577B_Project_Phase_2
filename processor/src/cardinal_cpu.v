//CARDINAL CPU WITH FORWARDING
module cardinal_cpu (
    clk, reset,
    inst_in, d_in, pc_out, addr_out, memEn, memWrEn, d_out
);

input       clk, reset;
input       [0:63] d_in;
input       [0:31] inst_in;

output      [0:63] d_out;
output reg  [0:31] pc_out;
output      [0:31] addr_out;
output      memEn, memWrEn;

// FROM INSTR_DECODE
wire        [0:5] IDout_opcode, IDout_func, IDout_alu_op;
wire        [0:4] IDout_rD_addr, IDout_rA_addr, IDout_rB_addr;
wire        [0:1] IDout_ww;
wire        [0:15] IDout_imm_addr;
wire        IDout_memEn, IDout_memWrEn, IDout_SFU, IDout_reg_wr_en, IDout_branch_ez, IDout_branch_nez, IDout_nop;

// ----------------------
// IF/ID PIPELINE REG
// ----------------------
reg [0:31] IF_ID_reg;

// ----------------------
// ID/EX PIPELINE REG
// ----------------------
reg [0:63] ID_EX_rA;
reg [0:63] ID_EX_rB;
reg [0:5]  ID_EX_alu_op;
reg [0:1]  ID_EX_ww;
reg        ID_EX_SFU;
reg        ID_EX_reg_wr_en;
reg [0:4]  ID_EX_rD_addr;
reg        ID_EX_memEn;
reg        ID_EX_memWrEn;
reg [0:15] ID_EX_imm_addr;
reg        ID_EX_nop;

// For forwarding: keep the original read addresses used to fetch operands
reg [0:4]  ID_EX_srcA_addr;
reg [0:4]  ID_EX_srcB_addr;

// ----------------------
// EX/WB PIPELINE REG
// ----------------------
reg [0:63] EX_WB_result;
reg [0:4]  EX_WB_rD_addr;
reg        EX_WB_reg_wr_en;
reg        EX_WB_memEn;

// ============================================================
// Instruction Decode
// ============================================================
instr_decode ID (
    .inst_in(IF_ID_reg),
    .opcode(IDout_opcode),
    .rD(IDout_rD_addr),
    .rA(IDout_rA_addr),
    .rB(IDout_rB_addr),
    .ww(IDout_ww),
    .func(IDout_func),
    .imm_addr(IDout_imm_addr),
    .alu_op(IDout_alu_op),
    .SFU(IDout_SFU),
    .memEn(IDout_memEn),
    .memWrEn(IDout_memWrEn),
    .reg_wr_en(IDout_reg_wr_en),
    .branch_ez(IDout_branch_ez),
    .branch_nez(IDout_branch_nez),
    .nop(IDout_nop)
);

// ============================================================
// Register File read address selection
// ============================================================
wire        [0:4]  rdAddr1_mux;
wire        [0:4]  rdAddr2_mux;
wire        [0:63] reg_rA_out, reg_rB_out;

assign rdAddr1_mux = IDout_memWrEn ? IDout_rD_addr : IDout_rA_addr;
assign rdAddr2_mux = (IDout_branch_ez || IDout_branch_nez) ? IDout_rD_addr : IDout_rB_addr;

// ============================================================
// Writeback value
// ============================================================
wire [0:63] wb_data;
assign wb_data = EX_WB_memEn ? d_in : EX_WB_result;

// ============================================================
// Load use stall --need to give VLD one extra cycle to get the 
//                  data from memory before the dependent 
//                  instruction enters EX
// ============================================================
wire load_use_stall;
assign load_use_stall = ID_EX_memEn && !ID_EX_memWrEn &&
    ((ID_EX_rD_addr == rdAddr1_mux) || 
     (ID_EX_rD_addr == rdAddr2_mux));

// ============================================================
// WB -> ID forwarding mux (between reg file and ID/EX register)
// Prevents race condition when WB writes same cycle ID reads
// ============================================================
wire [0:63] id_srcA_fwd;
wire [0:63] id_srcB_fwd;

assign id_srcA_fwd =
    (EX_WB_reg_wr_en && (EX_WB_rD_addr != 5'd0) && (EX_WB_rD_addr == rdAddr1_mux))
        ? wb_data
        : reg_rA_out;

assign id_srcB_fwd =
    (EX_WB_reg_wr_en && (EX_WB_rD_addr != 5'd0) && (EX_WB_rD_addr == rdAddr2_mux))
        ? wb_data
        : reg_rB_out;

// ============================================================
// WB -> EX forwarding unit
// ============================================================
wire [0:63] ex_srcA_fwd;
wire [0:63] ex_srcB_fwd;

forwarding_unit_ex FWD_EX (
    .srcA_addr   (ID_EX_srcA_addr),
    .srcB_addr   (ID_EX_srcB_addr),
    .wb_dest_addr(EX_WB_rD_addr),
    .wb_reg_wr_en(EX_WB_reg_wr_en),
    .wb_value    (wb_data),
    .srcA_value  (ID_EX_rA),
    .srcB_value  (ID_EX_rB),
    .fwdA_value  (ex_srcA_fwd),
    .fwdB_value  (ex_srcB_fwd)
);

// ============================================================
// Forwarding for branch compare in ID stage
// Uses id_srcB_fwd as base (already has WB->ID forwarding)
// Then checks if EX stage result is needed instead
// ============================================================
wire [0:63] ex_results; // declared early for branch forwarding use
wire [0:63] branch_cmp_value;

assign branch_cmp_value =
    (IDout_branch_ez || IDout_branch_nez) &&
    ID_EX_reg_wr_en &&
    !ID_EX_memEn &&
    (ID_EX_rD_addr != 5'd0) &&
    (ID_EX_rD_addr == rdAddr2_mux)
        ? ex_results       // forward from EX stage
        : id_srcB_fwd;     // use WB->ID forwarded value (covers WB->ID case)

// ============================================================
// Branch decision
// ============================================================
wire branch_taken;
assign branch_taken =
    (IDout_branch_ez  && (branch_cmp_value == 64'b0)) ||
    (IDout_branch_nez && (branch_cmp_value != 64'b0));

// ============================================================
// 4 STAGE PIPELINE
// ============================================================

// PROGRAM COUNTER
always @(posedge clk) begin
    if (reset)
        pc_out <= 32'b0;
    else if (branch_taken)
        pc_out <= {14'b0, IDout_imm_addr, 2'b00};
    else if (!load_use_stall)
        pc_out <= pc_out + 32'd4;
end

// IF/ID PIPELINE REGISTER
always @(posedge clk) begin
    if (reset)
        IF_ID_reg <= 32'b0;
    else if (branch_taken)
        IF_ID_reg <= 32'b0;
    else if (!load_use_stall)
        IF_ID_reg <= inst_in;
end

// REG FILE INSTANTIATION
reg_file REG_FILE (
    .clk     (clk),
    .reset   (reset),
    .rdAddr1 (rdAddr1_mux),
    .rdAddr2 (rdAddr2_mux),
    .wrAddr  (EX_WB_rD_addr),
    .wrData  (wb_data),
    .wrEn    (EX_WB_reg_wr_en),
    .rdData1 (reg_rA_out),
    .rdData2 (reg_rB_out)
);

// ID/EX PIPELINE REGISTER
// Now latches forwarded values (id_srcA_fwd, id_srcB_fwd)
// instead of raw reg file outputs
always @(posedge clk) begin
    if (reset) begin
        ID_EX_rA        <= 64'b0;
        ID_EX_rB        <= 64'b0;
        ID_EX_alu_op    <= 6'b0;
        ID_EX_ww        <= 2'b0;
        ID_EX_SFU       <= 1'b0;
        ID_EX_reg_wr_en <= 1'b0;
        ID_EX_rD_addr   <= 5'b0;
        ID_EX_memEn     <= 1'b0;
        ID_EX_memWrEn   <= 1'b0;
        ID_EX_imm_addr  <= 16'b0;
        ID_EX_nop       <= 1'b0;
        ID_EX_srcA_addr <= 5'b0;
        ID_EX_srcB_addr <= 5'b0;
    end
    else if (branch_taken) begin
        ID_EX_rA        <= 64'b0;
        ID_EX_rB        <= 64'b0;
        ID_EX_alu_op    <= 6'b0;
        ID_EX_ww        <= 2'b0;
        ID_EX_SFU       <= 1'b0;
        ID_EX_reg_wr_en <= 1'b0;
        ID_EX_rD_addr   <= 5'b0;
        ID_EX_memEn     <= 1'b0;
        ID_EX_memWrEn   <= 1'b0;
        ID_EX_imm_addr  <= 16'b0;
        ID_EX_nop       <= 1'b0;
        ID_EX_srcA_addr <= 5'b0;
        ID_EX_srcB_addr <= 5'b0;
    end
    else if (load_use_stall) begin
        ID_EX_rA        <= 64'b0;
        ID_EX_rB        <= 64'b0;
        ID_EX_alu_op    <= 6'b0;
        ID_EX_ww        <= 2'b0;
        ID_EX_SFU       <= 1'b0;
        ID_EX_reg_wr_en <= 1'b0;
        ID_EX_rD_addr   <= 5'b0;
        ID_EX_memEn     <= 1'b0;
        ID_EX_memWrEn   <= 1'b0;
        ID_EX_imm_addr  <= 16'b0;
        ID_EX_nop       <= 1'b0;
        ID_EX_srcA_addr <= 5'b0;
        ID_EX_srcB_addr <= 5'b0;
    end
    else begin
        ID_EX_rA        <= id_srcA_fwd; // WB->ID forwarded value
        ID_EX_rB        <= id_srcB_fwd; // WB->ID forwarded value
        ID_EX_alu_op    <= IDout_alu_op;
        ID_EX_ww        <= IDout_ww;
        ID_EX_SFU       <= IDout_SFU;
        ID_EX_reg_wr_en <= IDout_reg_wr_en;
        ID_EX_rD_addr   <= IDout_rD_addr;
        ID_EX_memEn     <= IDout_memEn;
        ID_EX_memWrEn   <= IDout_memWrEn;
        ID_EX_imm_addr  <= IDout_imm_addr;
        ID_EX_nop       <= IDout_nop;
        ID_EX_srcA_addr <= rdAddr1_mux;
        ID_EX_srcB_addr <= rdAddr2_mux;
    end
end

// EX stage - drive top-level memory control outputs
assign memEn    = ID_EX_memEn;
assign memWrEn  = ID_EX_memWrEn;
assign addr_out = {16'b0, ID_EX_imm_addr};

// ALU INSTANTIATION
wire [0:63] alu_results;
alu u_alu (
    .operandA         (ex_srcA_fwd),
    .operandB         (ex_srcB_fwd),
    .ww               (ID_EX_ww),
    .alu_op           (ID_EX_alu_op),
    .computed_results (alu_results)
);

// SFU INSTANTIATION
wire [0:63] sfu_results;
sfu u_sfu (
    .rA      (ex_srcA_fwd),
    .rB      (ex_srcB_fwd),
    .ww      (ID_EX_ww),
    .sfu_op  (ID_EX_alu_op),
    .result  (sfu_results)
);

// for VSD, ex_srcA_fwd holds the (possibly forwarded) store data
assign d_out = ex_srcA_fwd;

// Based on ID_EX_SFU value, select SFU results or ALU results
assign ex_results = ID_EX_SFU ? sfu_results : alu_results;

// EX/WB PIPELINE REGISTER
always @(posedge clk) begin
    if (reset) begin
        EX_WB_result    <= 64'b0;
        EX_WB_rD_addr   <= 5'b0;
        EX_WB_reg_wr_en <= 1'b0;
        EX_WB_memEn     <= 1'b0;
    end
    /*else if (branch_taken) begin
        EX_WB_result    <= 64'b0;
        EX_WB_rD_addr   <= 5'b0;
        EX_WB_reg_wr_en <= 1'b0;
        EX_WB_memEn     <= 1'b0; //REMOVED, instructions that are already here should complete normally
    end*/
    else begin
        EX_WB_result    <= ex_results;
        EX_WB_rD_addr   <= ID_EX_rD_addr;
        EX_WB_reg_wr_en <= ID_EX_reg_wr_en;
        EX_WB_memEn     <= ID_EX_memEn;
    end
end

endmodule


// ============================================================
// EX-stage forwarding unit
// ============================================================
module forwarding_unit_ex (
    input      [0:4]   srcA_addr,
    input      [0:4]   srcB_addr,
    input      [0:4]   wb_dest_addr,
    input              wb_reg_wr_en,
    input      [0:63]  wb_value,
    input      [0:63]  srcA_value,
    input      [0:63]  srcB_value,
    output     [0:63]  fwdA_value,
    output     [0:63]  fwdB_value
);

    assign fwdA_value =
        (wb_reg_wr_en && (wb_dest_addr != 5'd0) && (wb_dest_addr == srcA_addr))
            ? wb_value
            : srcA_value;

    assign fwdB_value =
        (wb_reg_wr_en && (wb_dest_addr != 5'd0) && (wb_dest_addr == srcB_addr))
            ? wb_value
            : srcB_value;

endmodule