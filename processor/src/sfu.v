//// SFU.v //////

module sfu (
    input  [0:63] rA,        // BIG ENDIAN FIX: [63:0] -> [0:63]
    input  [0:63] rB,        // BIG ENDIAN FIX: [63:0] -> [0:63]
    input  [0:1]  ww,        // BIG ENDIAN FIX: [1:0] -> [0:1]
    input  [0:5]  sfu_op,    // ENCODING FIX: [2:0] 3-bit custom -> [0:5] 6-bit ISA func code
    output reg [0:63] result // BIG ENDIAN FIX: [63:0] -> [0:63]
);

    // ------------------------------------------------------------
    // ISA func code encoding (matches instr_decode.v)
    // ------------------------------------------------------------
    localparam VDIV  = 6'b001110;  // ENCODING FIX: was SFU_VDIV  = 3'b001
    localparam VMOD  = 6'b001111;  // ENCODING FIX: was SFU_VMOD  = 3'b010
    localparam VSQEU = 6'b010000;  // ENCODING FIX: was SFU_VSQEU = 3'b011
    localparam VSQOU = 6'b010001;  // ENCODING FIX: was SFU_VSQOU = 3'b100
    localparam VSQRT = 6'b010010;  // ENCODING FIX: was SFU_VSQRT = 3'b101

    // ------------------------------------------------------------
    // 8-bit lane results (WW = 00)
    // ------------------------------------------------------------
    wire [0:63] div8_result;   // BIG ENDIAN FIX: [63:0] -> [0:63]
    wire [0:63] mod8_result;   // BIG ENDIAN FIX: [63:0] -> [0:63]
    wire [0:63] sqrt8_result;  // BIG ENDIAN FIX: [63:0] -> [0:63]

    genvar i8;
    generate
        for (i8 = 0; i8 < 8; i8 = i8 + 1) begin : G_WW8
            wire [0:7] div_q;   // BIG ENDIAN FIX: [7:0] -> [0:7]
            wire [0:7] mod_r;   // BIG ENDIAN FIX: [7:0] -> [0:7]
            wire [0:7] sqrt_q;  // BIG ENDIAN FIX: [7:0] -> [0:7]

            sfu_divu_lane  #(8) U_DIV8  (
                .a (rA[(i8*8) +: 8]),   // BIG ENDIAN FIX: [63-(i8*8) -: 8] -> [(i8*8) +: 8]
                .b (rB[(i8*8) +: 8]),   // BIG ENDIAN FIX: [63-(i8*8) -: 8] -> [(i8*8) +: 8]
                .q (div_q)
            );

            sfu_modu_lane  #(8) U_MOD8  (
                .a (rA[(i8*8) +: 8]),   // BIG ENDIAN FIX: [63-(i8*8) -: 8] -> [(i8*8) +: 8]
                .b (rB[(i8*8) +: 8]),   // BIG ENDIAN FIX: [63-(i8*8) -: 8] -> [(i8*8) +: 8]
                .r (mod_r)
            );

            sfu_sqrtu_lane #(8) U_SQRT8 (
                .a (rA[(i8*8) +: 8]),   // BIG ENDIAN FIX: [63-(i8*8) -: 8] -> [(i8*8) +: 8]
                .q (sqrt_q)
            );

            assign div8_result [(i8*8) +: 8]  = div_q;   // BIG ENDIAN FIX
            assign mod8_result [(i8*8) +: 8]  = mod_r;   // BIG ENDIAN FIX
            assign sqrt8_result[(i8*8) +: 8]  = sqrt_q;  // BIG ENDIAN FIX
        end
    endgenerate

    wire [0:15] sqeu8_p0, sqeu8_p1, sqeu8_p2, sqeu8_p3;  // BIG ENDIAN FIX: [15:0] -> [0:15]
    wire [0:15] sqou8_p0, sqou8_p1, sqou8_p2, sqou8_p3;  // BIG ENDIAN FIX: [15:0] -> [0:15]

    // BIG ENDIAN FIX: bit indices flipped for all square lane instantiations
    sfu_square_lane #(8) U_SQEU8_0 (.a(rA[0:7  ]), .p(sqeu8_p0)); // even byte 0
    sfu_square_lane #(8) U_SQEU8_1 (.a(rA[16:23]), .p(sqeu8_p1)); // even byte 2
    sfu_square_lane #(8) U_SQEU8_2 (.a(rA[32:39]), .p(sqeu8_p2)); // even byte 4
    sfu_square_lane #(8) U_SQEU8_3 (.a(rA[48:55]), .p(sqeu8_p3)); // even byte 6

    sfu_square_lane #(8) U_SQOU8_0 (.a(rA[8:15 ]), .p(sqou8_p0)); // odd byte 1
    sfu_square_lane #(8) U_SQOU8_1 (.a(rA[24:31]), .p(sqou8_p1)); // odd byte 3
    sfu_square_lane #(8) U_SQOU8_2 (.a(rA[40:47]), .p(sqou8_p2)); // odd byte 5
    sfu_square_lane #(8) U_SQOU8_3 (.a(rA[56:63]), .p(sqou8_p3)); // odd byte 7

    wire [0:63] sqeu8_result = {sqeu8_p0, sqeu8_p1, sqeu8_p2, sqeu8_p3};  // BIG ENDIAN FIX: [63:0] -> [0:63]
    wire [0:63] sqou8_result = {sqou8_p0, sqou8_p1, sqou8_p2, sqou8_p3};  // BIG ENDIAN FIX: [63:0] -> [0:63]

    // ------------------------------------------------------------
    // 16-bit lane results (WW = 01)
    // ------------------------------------------------------------
    wire [0:63] div16_result;   // BIG ENDIAN FIX: [63:0] -> [0:63]
    wire [0:63] mod16_result;   // BIG ENDIAN FIX: [63:0] -> [0:63]
    wire [0:63] sqrt16_result;  // BIG ENDIAN FIX: [63:0] -> [0:63]

    genvar i16;
    generate
        for (i16 = 0; i16 < 4; i16 = i16 + 1) begin : G_WW16
            wire [0:15] div_q;   // BIG ENDIAN FIX: [15:0] -> [0:15]
            wire [0:15] mod_r;   // BIG ENDIAN FIX: [15:0] -> [0:15]
            wire [0:15] sqrt_q;  // BIG ENDIAN FIX: [15:0] -> [0:15]

            sfu_divu_lane  #(16) U_DIV16  (
                .a (rA[(i16*16) +: 16]),  // BIG ENDIAN FIX: [63-(i16*16) -: 16] -> [(i16*16) +: 16]
                .b (rB[(i16*16) +: 16]),  // BIG ENDIAN FIX: [63-(i16*16) -: 16] -> [(i16*16) +: 16]
                .q (div_q)
            );

            sfu_modu_lane  #(16) U_MOD16  (
                .a (rA[(i16*16) +: 16]),  // BIG ENDIAN FIX: [63-(i16*16) -: 16] -> [(i16*16) +: 16]
                .b (rB[(i16*16) +: 16]),  // BIG ENDIAN FIX: [63-(i16*16) -: 16] -> [(i16*16) +: 16]
                .r (mod_r)
            );

            sfu_sqrtu_lane #(16) U_SQRT16 (
                .a (rA[(i16*16) +: 16]),  // BIG ENDIAN FIX: [63-(i16*16) -: 16] -> [(i16*16) +: 16]
                .q (sqrt_q)
            );

            assign div16_result [(i16*16) +: 16]  = div_q;   // BIG ENDIAN FIX
            assign mod16_result [(i16*16) +: 16]  = mod_r;   // BIG ENDIAN FIX
            assign sqrt16_result[(i16*16) +: 16]  = sqrt_q;  // BIG ENDIAN FIX
        end
    endgenerate

    wire [0:31] sqeu16_p0, sqeu16_p1;  // BIG ENDIAN FIX: [31:0] -> [0:31]
    wire [0:31] sqou16_p0, sqou16_p1;  // BIG ENDIAN FIX: [31:0] -> [0:31]

    // BIG ENDIAN FIX: bit indices flipped
    sfu_square_lane #(16) U_SQEU16_0 (.a(rA[0:15 ]), .p(sqeu16_p0)); // even half 0
    sfu_square_lane #(16) U_SQEU16_1 (.a(rA[32:47]), .p(sqeu16_p1)); // even half 2

    sfu_square_lane #(16) U_SQOU16_0 (.a(rA[16:31]), .p(sqou16_p0)); // odd half 1
    sfu_square_lane #(16) U_SQOU16_1 (.a(rA[48:63]), .p(sqou16_p1)); // odd half 3

    wire [0:63] sqeu16_result = {sqeu16_p0, sqeu16_p1};  // BIG ENDIAN FIX: [63:0] -> [0:63]
    wire [0:63] sqou16_result = {sqou16_p0, sqou16_p1};  // BIG ENDIAN FIX: [63:0] -> [0:63]

    // ------------------------------------------------------------
    // 32-bit lane results (WW = 10)
    // ------------------------------------------------------------
    wire [0:63] div32_result;   // BIG ENDIAN FIX: [63:0] -> [0:63]
    wire [0:63] mod32_result;   // BIG ENDIAN FIX: [63:0] -> [0:63]
    wire [0:63] sqrt32_result;  // BIG ENDIAN FIX: [63:0] -> [0:63]

    genvar i32;
    generate
        for (i32 = 0; i32 < 2; i32 = i32 + 1) begin : G_WW32
            wire [0:31] div_q;   // BIG ENDIAN FIX: [31:0] -> [0:31]
            wire [0:31] mod_r;   // BIG ENDIAN FIX: [31:0] -> [0:31]
            wire [0:31] sqrt_q;  // BIG ENDIAN FIX: [31:0] -> [0:31]

            sfu_divu_lane  #(32) U_DIV32  (
                .a (rA[(i32*32) +: 32]),  // BIG ENDIAN FIX: [63-(i32*32) -: 32] -> [(i32*32) +: 32]
                .b (rB[(i32*32) +: 32]),  // BIG ENDIAN FIX: [63-(i32*32) -: 32] -> [(i32*32) +: 32]
                .q (div_q)
            );

            sfu_modu_lane  #(32) U_MOD32  (
                .a (rA[(i32*32) +: 32]),  // BIG ENDIAN FIX: [63-(i32*32) -: 32] -> [(i32*32) +: 32]
                .b (rB[(i32*32) +: 32]),  // BIG ENDIAN FIX: [63-(i32*32) -: 32] -> [(i32*32) +: 32]
                .r (mod_r)
            );

            sfu_sqrtu_lane #(32) U_SQRT32 (
                .a (rA[(i32*32) +: 32]),  // BIG ENDIAN FIX: [63-(i32*32) -: 32] -> [(i32*32) +: 32]
                .q (sqrt_q)
            );

            assign div32_result [(i32*32) +: 32]  = div_q;   // BIG ENDIAN FIX
            assign mod32_result [(i32*32) +: 32]  = mod_r;   // BIG ENDIAN FIX
            assign sqrt32_result[(i32*32) +: 32]  = sqrt_q;  // BIG ENDIAN FIX
        end
    endgenerate

    wire [0:63] sqeu32_p0;  // BIG ENDIAN FIX: [63:0] -> [0:63]
    wire [0:63] sqou32_p0;  // BIG ENDIAN FIX: [63:0] -> [0:63]

    // BIG ENDIAN FIX: bit indices flipped
    sfu_square_lane #(32) U_SQEU32_0 (.a(rA[0:31 ]), .p(sqeu32_p0)); // even word 0
    sfu_square_lane #(32) U_SQOU32_0 (.a(rA[32:63]), .p(sqou32_p0)); // odd  word 1

    wire [0:63] sqeu32_result = sqeu32_p0;  // BIG ENDIAN FIX: [63:0] -> [0:63]
    wire [0:63] sqou32_result = sqou32_p0;  // BIG ENDIAN FIX: [63:0] -> [0:63]

    // ------------------------------------------------------------
    // 64-bit lane results (WW = 11)
    // ------------------------------------------------------------
    wire [0:63] div64_result;   // BIG ENDIAN FIX: [63:0] -> [0:63]
    wire [0:63] mod64_result;   // BIG ENDIAN FIX: [63:0] -> [0:63]
    wire [0:63] sqrt64_result;  // BIG ENDIAN FIX: [63:0] -> [0:63]

    sfu_divu_lane  #(64) U_DIV64  (
        .a (rA),
        .b (rB),
        .q (div64_result)
    );

    sfu_modu_lane  #(64) U_MOD64  (
        .a (rA),
        .b (rB),
        .r (mod64_result)
    );

    sfu_sqrtu_lane #(64) U_SQRT64 (
        .a (rA),
        .q (sqrt64_result)
    );

    // ------------------------------------------------------------
    // Final select
    // ------------------------------------------------------------
    always @(*) begin
        result = 64'd0;

        case (sfu_op)
            VDIV: begin
                case (ww)
                    2'b00: result = div8_result;
                    2'b01: result = div16_result;
                    2'b10: result = div32_result;
                    2'b11: result = div64_result;
                    default: result = 64'd0;
                endcase
            end

            VMOD: begin
                case (ww)
                    2'b00: result = mod8_result;
                    2'b01: result = mod16_result;
                    2'b10: result = mod32_result;
                    2'b11: result = mod64_result;
                    default: result = 64'd0;
                endcase
            end

            VSQRT: begin
                case (ww)
                    2'b00: result = sqrt8_result;
                    2'b01: result = sqrt16_result;
                    2'b10: result = sqrt32_result;
                    2'b11: result = sqrt64_result;
                    default: result = 64'd0;
                endcase
            end

            VSQEU: begin
                case (ww)
                    2'b00: result = sqeu8_result;
                    2'b01: result = sqeu16_result;
                    2'b10: result = sqeu32_result;
                    2'b11: result = 64'd0;
                    default: result = 64'd0;
                endcase
            end

            VSQOU: begin
                case (ww)
                    2'b00: result = sqou8_result;
                    2'b01: result = sqou16_result;
                    2'b10: result = sqou32_result;
                    2'b11: result = 64'd0;
                    default: result = 64'd0;
                endcase
            end

            default: begin
                result = 64'd0;
            end
        endcase
    end

endmodule


// ================================================================
// Unsigned divide lane: q = a / b
// If b == 0, output 0
// ================================================================
module sfu_divu_lane #(parameter W = 8) (
    input  [0:W-1] a,  // BIG ENDIAN FIX: [W-1:0] -> [0:W-1]
    input  [0:W-1] b,  // BIG ENDIAN FIX: [W-1:0] -> [0:W-1]
    output [0:W-1] q   // BIG ENDIAN FIX: [W-1:0] -> [0:W-1]
);
    wire [0:W-1] quot_int;    // BIG ENDIAN FIX: [W-1:0] -> [0:W-1]
    wire [0:W-1] rem_unused;  // BIG ENDIAN FIX: [W-1:0] -> [0:W-1]

    DW_div #(W, W) U_DW_DIV (
        .a    (a),
        .b    (b),
        .quotient (quot_int),
        .remainder  (rem_unused),
        .divide_by_0()
    );

    assign q = (b == {W{1'b0}}) ? {W{1'b0}} : quot_int;
endmodule


// ================================================================
// Unsigned modulo lane: r = a % b
// If b == 0, output 0
// ================================================================
module sfu_modu_lane #(parameter W = 8) (
    input  [0:W-1] a,  // BIG ENDIAN FIX: [W-1:0] -> [0:W-1]
    input  [0:W-1] b,  // BIG ENDIAN FIX: [W-1:0] -> [0:W-1]
    output [0:W-1] r   // BIG ENDIAN FIX: [W-1:0] -> [0:W-1]
);
    wire [0:W-1] quot_unused;  // BIG ENDIAN FIX: [W-1:0] -> [0:W-1]
    wire [0:W-1] rem_int;      // BIG ENDIAN FIX: [W-1:0] -> [0:W-1]

    DW_div #(W, W) U_DW_MOD (
        .a    (a),
        .b    (b),
        .quotient (quot_unused),
        .remainder  (rem_int),
        .divide_by_0()
    );

    assign r = (b == {W{1'b0}}) ? {W{1'b0}} : rem_int;
endmodule


// ================================================================
// Unsigned sqrt lane: q = floor(sqrt(a))
// ================================================================
module sfu_sqrtu_lane #(parameter W = 8) (
    input  [0:W-1] a,  // BIG ENDIAN FIX: [W-1:0] -> [0:W-1]
    output [0:W-1] q   // BIG ENDIAN FIX: [W-1:0] -> [0:W-1]
);
    localparam RW = (W + 1) / 2;

    wire [0:RW-1] root_int;  // BIG ENDIAN FIX: [RW-1:0] -> [0:RW-1]

    DW_sqrt #(W) U_DW_SQRT (
        .a    (a),
        .root (root_int)
    );

    assign q = {{(W-RW){1'b0}}, root_int};
endmodule


// ================================================================
// Unsigned square lane: p = a * a
// Output width = 2W
// ================================================================
module sfu_square_lane #(parameter W = 8) (
    input  [0:W-1]     a,  // BIG ENDIAN FIX: [W-1:0] -> [0:W-1]
    output [0:(2*W)-1] p   // BIG ENDIAN FIX: [(2*W)-1:0] -> [0:(2*W)-1]
);
    assign p = a * a;
endmodule