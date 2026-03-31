//CARDINAL CPU WITHOUT FORWARDING
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

wire        branch_taken;


//REG FILE WIRES
wire        [0:4] rdAddr1_mux;
wire        [0:4] rdAddr2_mux;
wire        [0:63] reg_rA_out, reg_rB_out;

//ALU WIRES
wire [0:63] alu_results;

//SFU WIRES
wire [0:63] sfu_results;

//alu or sfu results depending on SFU flag
wire [0:63] ex_results;

//WRITEBACK WIRE
wire [0:63] wb_data;

//======================
//PIPELINE REGISTERS
//======================

//IF/ID PIPELINE REGISTER
reg         [0:31] IF_ID_reg;

//ID/EX PIPELINE REGISTER
reg [0:63] ID_EX_rA;
reg [0:63] ID_EX_rB;
reg [0:5]  ID_EX_alu_op;    // ALU operation
reg [0:1]  ID_EX_ww;        // word width
reg        ID_EX_SFU;       // SFU select
reg        ID_EX_reg_wr_en; // register write enable
reg [0:4]  ID_EX_rD_addr;   // destination register address for writeback
reg        ID_EX_memEn;     // memory read enable (VLD)
reg        ID_EX_memWrEn;   // memory write enable (VSD)
reg [0:15] ID_EX_imm_addr;  // immediate address for VLD/VSD
reg        ID_EX_nop;       // no operation

//EX/WB PIPELINE REGISTER
reg [0:63] EX_WB_result;
reg [0:4]  EX_WB_rD_addr;   // so writeback knows which register to write to
reg        EX_WB_reg_wr_en; // so writeback knows whether to write
reg        EX_WB_memEn;     // for VLD - need to write d_in to register

assign branch_taken = (IDout_branch_ez && (reg_rB_out == 64'b0)) || 
                      (IDout_branch_nez && (reg_rB_out != 64'b0)); 

//======================
//4 STAGE PIPELINE
//======================

//PROGRAM COUNTER
always @(posedge clk) begin
    if (reset)
        pc_out <= 32'b0;
    else if (branch_taken)
        pc_out <= {14'b0, IDout_imm_addr, 2'b00}; //imm_addr FROM INSTR_DECODE
    else 
        pc_out <= pc_out + 32'd4;
end

//IF/ID PIPELINE REGISTER
always @(posedge clk) begin
    if (reset) 
        IF_ID_reg <= 32'b0;
    else if (branch_taken)
        IF_ID_reg <= 32'b0;
    else
        IF_ID_reg <= inst_in;
end

//INSTRUCTION DECODE INSTANTIATION
instr_decode ID (
    //input
    .inst_in(IF_ID_reg),
    //output
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

//REG FILE INSTANTIATION 
assign rdAddr1_mux = IDout_memWrEn ? IDout_rD_addr : IDout_rA_addr;
assign rdAddr2_mux = (IDout_branch_ez || IDout_branch_nez) ? IDout_rD_addr : IDout_rB_addr;

reg_file REG_FILE (
    //input
    .clk(clk),
    .reset(reset),
    .rdAddr1(rdAddr1_mux),
    .rdAddr2(rdAddr2_mux),
    .wrAddr(EX_WB_rD_addr), //from from EX/WB reg
    .wrData(wb_data), //from writeback
    .wrEn(EX_WB_reg_wr_en),   //control signal from EX/WB reg
    //output
    .rdData1(reg_rA_out),
    .rdData2(reg_rB_out)
);

//ID/EX PIPELINE REGISTER
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
    end
    else begin
        ID_EX_rA        <= reg_rA_out;
        ID_EX_rB        <= reg_rB_out;
        ID_EX_alu_op    <= IDout_alu_op;
        ID_EX_ww        <= IDout_ww;
        ID_EX_SFU       <= IDout_SFU;
        ID_EX_reg_wr_en <= IDout_reg_wr_en;
        ID_EX_rD_addr   <= IDout_rD_addr;
        ID_EX_memEn     <= IDout_memEn;
        ID_EX_memWrEn   <= IDout_memWrEn;
        ID_EX_imm_addr  <= IDout_imm_addr;
        ID_EX_nop       <= IDout_nop;
    end
end

// EX stage - drive top-level memory control outputs
assign memEn   = ID_EX_memEn;
assign memWrEn = ID_EX_memWrEn;
assign addr_out = {16'b0, ID_EX_imm_addr};

//ALU INSTANTIATION
alu u_alu (
    //input
    .operandA(ID_EX_rA), 
    .operandB(ID_EX_rB),
    .ww(ID_EX_ww),
    .alu_op(ID_EX_alu_op),
    //output
    .computed_results(alu_results)
);

//SFU INSTANTIATION HERE
sfu u_sfu (
    //input
    .rA(ID_EX_rA),
    .rB(ID_EX_rB),
    .ww(ID_EX_ww),
    .sfu_op(ID_EX_alu_op),
    //output
    .result(sfu_results)
);

assign d_out = ID_EX_rA; // for VSD, ID_EX_rA holds rD contents

//Based on ID_EX_SFU value, select sfu results or alu results
assign ex_results = ID_EX_SFU ? sfu_results : alu_results;

//EX/WB PIPELINE REGISTER
always @(posedge clk) begin
    if (reset) begin
        EX_WB_result     <= 64'b0;
        EX_WB_rD_addr    <= 5'b0;
        EX_WB_reg_wr_en  <= 1'b0;
        EX_WB_memEn      <= 1'b0;
    end
    /*else if (branch_taken) begin
        EX_WB_result     <= 64'b0;
        EX_WB_rD_addr    <= 5'b0;
        EX_WB_reg_wr_en  <= 1'b0;
        EX_WB_memEn      <= 1'b0;
    end*/
    else begin
        EX_WB_result     <= ex_results;
        EX_WB_rD_addr    <= ID_EX_rD_addr;
        EX_WB_reg_wr_en  <= ID_EX_reg_wr_en;
        EX_WB_memEn      <= ID_EX_memEn;
    end
end

//WRITEBACK
assign wb_data = EX_WB_memEn ? d_in : EX_WB_result;

endmodule