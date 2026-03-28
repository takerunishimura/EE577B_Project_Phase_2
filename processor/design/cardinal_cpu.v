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

//wire [0:63] rD_Data; //FROM REG FILE, THIS IS TEMPORARY WIRE DECLARATION

wire        branch_taken;

// FROM INSTR_DECODE
wire        [0:5] opcode, func, alu_op;
wire        [0:4] rD_addr, rA_addr, rB_addr;
wire        [0:1] ww;
wire        [0:15] imm_addr;
wire        SFU, reg_wr_en, branch_ez, branch_nez, nop;

//IF/ID PIPELINE REGISTER
reg         [0:31] IF_ID_reg;

//ID/EX PIPELINE REGISTER


//EX/WB PIPELINE REGISTER


//assign branch_taken = (branch_ez && (rD_Data == 64'b0)) || (branch_nez && (rD_Data != 64'b0)); 
//DONT FORGET CORRECT WIRE DECLARATION NEEDED FOR THIS ^

//PROGRAM COUNTER
always @(posedge clk) begin
    if (reset)
        pc_out <= 32'b0;
    else if (branch_taken)
        pc_out <= {16'b0, imm_addr}; //imm_addr FROM INSTR_DECODE
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

instr_decode ID (
    .inst_in(IF_ID_reg),
    .opcode(opcode),
    .rD(rD_addr),
    .rA(rA_addr),
    .rB(rB_addr),
    .ww(ww),
    .func(func),
    .imm_addr(imm_addr),
    .alu_op(alu_op),
    .SFU(SFU),
    .memEn(memEn),
    .memWrEn(memWrEn),
    .reg_wr_en(reg_wr_en),
    .branch_ez(branch_ez),
    .branch_nez(branch_nez),
    .nop(nop)
);

//REG FILE INSTANTIATION HERE

//ID/EX PIPELINE REGISTER

alu ALU (
    .operandA(), 
    .operandB(),
    .alu_op(),
    .ww(),
    .computed_results()
);

//SFU INSTANTIATION HERE

//EX/WB PIPELINE REGISTER

//WRITEBACK

endmodule