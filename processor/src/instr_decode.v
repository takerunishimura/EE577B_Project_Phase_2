module instr_decode (
    inst_in,
    opcode, rD, rA, rB, ww, func, imm_addr,
    alu_op, SFU,
    memEn, memWrEn,
    reg_wr_en,
    branch_ez, branch_nez,
    nop
);
//instruction
input       [0:31] inst_in; //big endian

//instruction fields
output      [0:5] opcode; //R-type = 101010, VLD = 100000, VSD = 100001, VBEZ = 100010, VBNEZ = 100011, VNOP = 111100
output      [0:4] rD, rA, rB;
output      [0:1] ww; // ww: 00=8b, 01=16b, 10=32b, 11=64b
output      [0:5] func; // which R-type instruction
output      [0:15] imm_addr;

//ALU control
output      [0:5] alu_op; //which R-type instr
output reg  SFU; //if SFU=1 use sfu, if SFU=0 use ALU

//Mem control
output reg  memEn; //for load
output reg  memWrEn; //for store

//Register file control
output reg  reg_wr_en; //reg write enable

//Branch control
output reg  branch_ez; //if content of rD is zero, execute branch
output reg  branch_nez; //if content of rD is not zero, execute branch

//no op
output reg  nop; //VOP=1

assign opcode   = inst_in[0:5];
assign rD       = inst_in[6:10];
assign rA       = inst_in[11:15];
assign rB       = inst_in[16:20];
assign ww       = inst_in[24:25];
assign func     = inst_in[26:31];
assign imm_addr = inst_in[16:31]; // for VLD, VSD, VBEZ, VBNEZ
assign alu_op   = func;

localparam R_TYPE = 6'b101010;
localparam VLD    = 6'b100000;
localparam VSD    = 6'b100001;
localparam VBEZ   = 6'b100010;
localparam VBNEZ  = 6'b100011;
localparam VNOP   = 6'b111100;

localparam VDIV  = 6'b001110;
localparam VMOD  = 6'b001111;
localparam VSQEU = 6'b010000;
localparam VSQOU = 6'b010001;
localparam VSQRT = 6'b010010;

always @(*) begin
    SFU = 0;
    memEn = 0;
    memWrEn = 0;
    branch_ez = 0; 
    branch_nez = 0;
    nop = 0;
    reg_wr_en = 1;
    
    case (opcode)
    R_TYPE : SFU = (func == VDIV || func == VMOD || func == VSQEU || func == VSQOU || func == VSQRT);
    VLD : memEn = 1;
    VSD : begin
        memEn   = 1; // FIX: assert memEn for VSD too
        memWrEn = 1;
        reg_wr_en = 0;
    end
    VBEZ : begin 
        branch_ez = 1; 
        reg_wr_en = 0;
    end
    VBNEZ : begin
        branch_nez = 1;
        reg_wr_en = 0;
    end
    VNOP : begin
        nop = 1;
        reg_wr_en = 0;
    end
    endcase
end


endmodule