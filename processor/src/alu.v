module alu (operandA, operandB, alu_op, ww, computed_results);

input       [0:63] operandA, operandB;
input       [0:5] alu_op;
input       [0:1] ww; // ww: 00=8b, 01=16b, 10=32b, 11=64b
output reg  [0:63] computed_results;

localparam  VAND   = 6'b000001;
localparam  VOR    = 6'b000010;
localparam  VXOR   = 6'b000011;
localparam  VNOT   = 6'b000100;
localparam  VMOV   = 6'b000101;
localparam  VADD   = 6'b000110;
localparam  VSUB   = 6'b000111;
localparam  VMULEU = 6'b001000;
localparam  VMULOU = 6'b001001;
localparam  VSLL   = 6'b001010;
localparam  VSRL   = 6'b001011;
localparam  VSRA   = 6'b001100;
localparam  VRTTH  = 6'b001101;

integer     i; //used in for loop
integer     s; //used in shift operation

always @(*) begin
    i = 0;
    computed_results = 64'b0; //default

    case (alu_op)
    VAND : begin 
        case (ww)
        2'b00 : begin
            for (i = 0; i < 64 ; i = i + 8)
                computed_results[i +: 8] = operandA[i +: 8] & operandB[i +: 8];
        end
        2'b01 : begin
            for (i = 0; i < 64 ; i = i + 16)
                computed_results[i +: 16] = operandA[i +: 16] & operandB[i +: 16];
        end
        2'b10 : begin
            for (i = 0; i < 64 ; i = i + 32)
                computed_results[i +: 32] = operandA[i +: 32] & operandB[i +: 32];
        end 
        2'b11 : computed_results = operandA & operandB;
        endcase
        end
    
    VOR : begin 
        case (ww)
        2'b00 : begin
            for (i = 0; i < 64 ; i = i + 8)
                computed_results[i +: 8] = operandA[i +: 8] | operandB[i +: 8];
        end
        2'b01 : begin
            for (i = 0; i < 64 ; i = i + 16)
                computed_results[i +: 16] = operandA[i +: 16] | operandB[i +: 16];
        end
        2'b10 : begin
            for (i = 0; i < 64 ; i = i + 32)
                computed_results[i +: 32] = operandA[i +: 32] | operandB[i +: 32];
        end 
        2'b11 : computed_results = operandA | operandB;
        endcase
        end

    VXOR : begin 
        case (ww)
        2'b00 : begin
            for (i = 0; i < 64 ; i = i + 8)
                computed_results[i +: 8] = operandA[i +: 8] ^ operandB[i +: 8];
        end
        2'b01 : begin
            for (i = 0; i < 64 ; i = i + 16)
                computed_results[i +: 16] = operandA[i +: 16] ^ operandB[i +: 16];
        end
        2'b10 : begin
            for (i = 0; i < 64 ; i = i + 32)
                computed_results[i +: 32] = operandA[i +: 32] ^ operandB[i +: 32];
        end 
        2'b11 : computed_results = operandA ^ operandB;
        endcase
        end

    VNOT : begin 
        case (ww)
        2'b00 : begin
            for (i = 0; i < 64 ; i = i + 8)
                computed_results[i +: 8] = ~operandA[i +: 8];
        end
        2'b01 : begin
            for (i = 0; i < 64 ; i = i + 16)
                computed_results[i +: 16] = ~operandA[i +: 16];
        end
        2'b10 : begin
            for (i = 0; i < 64 ; i = i + 32)
                computed_results[i +: 32] = ~operandA[i +: 32];
        end 
        2'b11 : computed_results = ~operandA;
        endcase
        end
        
    VMOV : begin 
        case (ww)
        2'b00 : begin
            for (i = 0; i < 64 ; i = i + 8)
                computed_results[i +: 8] = operandA[i +: 8];
        end
        2'b01 : begin
            for (i = 0; i < 64 ; i = i + 16)
                computed_results[i +: 16] = operandA[i +: 16];
        end
        2'b10 : begin
            for (i = 0; i < 64 ; i = i + 32)
                computed_results[i +: 32] = operandA[i +: 32];
        end 
        2'b11 : computed_results = operandA;
        endcase
        end
        
    VADD : begin 
        case (ww)
        2'b00 : begin
            for (i = 0; i < 64 ; i = i + 8)
                computed_results[i +: 8] = operandA[i +: 8] + operandB[i +: 8];
        end
        2'b01 : begin
            for (i = 0; i < 64 ; i = i + 16)
                computed_results[i +: 16] = operandA[i +: 16] + operandB[i +: 16];
        end
        2'b10 : begin
            for (i = 0; i < 64 ; i = i + 32)
                computed_results[i +: 32] = operandA[i +: 32] + operandB[i +: 32];
        end 
        2'b11 : computed_results = operandA + operandB;
        endcase
        end

    VSUB : begin 
        case (ww)
        2'b00 : begin
            for (i = 0; i < 64 ; i = i + 8)
                computed_results[i +: 8] = operandA[i +: 8] - operandB[i +: 8];
        end
        2'b01 : begin
            for (i = 0; i < 64 ; i = i + 16)
                computed_results[i +: 16] = operandA[i +: 16] - operandB[i +: 16];
        end
        2'b10 : begin
            for (i = 0; i < 64 ; i = i + 32)
                computed_results[i +: 32] = operandA[i +: 32] - operandB[i +: 32];
        end 
        2'b11 : computed_results = operandA - operandB;
        endcase
        end

    //MULTIPLY EVEN UNSIGNED
    VMULEU : begin 
        case (ww)
        2'b00 : begin
            for (i = 0; i < 64 ; i = i + 16)
                computed_results[i +: 16] = operandA[i +: 8] * operandB[i +: 8];
        end
        2'b01 : begin
            for (i = 0; i < 64 ; i = i + 32)
                computed_results[i +: 32] = operandA[i +: 16] * operandB[i +: 16];
        end
        2'b10 : begin
                computed_results = operandA[0 +: 32] * operandB[0 +: 32];
        end 
        2'b11 : computed_results = 64'b0;
       
        endcase
        end

    //MULTIPLY ODD UNSIGNED
    VMULOU : begin 
        case (ww)
        2'b00 : begin
            for (i = 0; i < 64 ; i = i + 16)
                computed_results[i +: 16] = operandA[(i + 8) +: 8] * operandB[(i + 8) +: 8];
        end
        2'b01 : begin
            for (i = 0; i < 64 ; i = i + 32)
                computed_results[i +: 32] = operandA[(i + 16) +: 16] * operandB[(i + 16) +: 16];
        end
        2'b10 : begin
                computed_results = operandA[32 +: 32] * operandB[32 +: 32];
        end 
        2'b11 : computed_results = 64'b0;
       
        endcase
        end
    
    //SHIFT LEFT LOGICAL
    VSLL : begin 
        case (ww)
        2'b00 : begin
            for (i = 0; i < 64 ; i = i + 8) begin
                s = operandB[(i + 5) +: 3];
                computed_results[i +: 8] = operandA[i +: 8] << s;
            end
        end
        2'b01 : begin
            for (i = 0; i < 64 ; i = i + 16) begin
                s = operandB[(i + 12) +: 4];
                computed_results[i +: 16] = operandA[i +: 16] << s;
            end
        end
        2'b10 : begin
            for (i = 0; i < 64 ; i = i + 32) begin
                s = operandB[(i + 27) +: 5];
                computed_results[i +: 32] = operandA[i +: 32] << s;
            end
        end 
        2'b11 : begin
            s = operandB[58 +: 6];
            computed_results = operandA << s;
        end
        endcase
        end

    //SHIFT RIGHT LOGICAL
    VSRL : begin 
        case (ww)
        2'b00 : begin
            for (i = 0; i < 64 ; i = i + 8) begin
                s = operandB[(i + 5) +: 3];
                computed_results[i +: 8] = operandA[i +: 8] >> s;
            end
        end
        2'b01 : begin
            for (i = 0; i < 64 ; i = i + 16) begin
                s = operandB[(i + 12) +: 4];
                computed_results[i +: 16] = operandA[i +: 16] >> s;
            end
        end
        2'b10 : begin
            for (i = 0; i < 64 ; i = i + 32) begin
                s = operandB[(i + 27) +: 5];
                computed_results[i +: 32] = operandA[i +: 32] >> s;
            end
        end 
        2'b11 : begin
            s = operandB[58 +: 6];
            computed_results = operandA >> s;
        end
        endcase
        end

    //SHIFT RIGHT ARITHMATIC, implies signed operation
    VSRA : begin 
        case (ww)
        2'b00 : begin
            for (i = 0; i < 64 ; i = i + 8) begin
                s = operandB[(i + 5) +: 3];
                computed_results[i +: 8] = $signed(operandA[i +: 8]) >>> s;
            end
        end
        2'b01 : begin
            for (i = 0; i < 64 ; i = i + 16) begin
                s = operandB[(i + 12) +: 4];
                computed_results[i +: 16] = $signed(operandA[i +: 16]) >>> s;
            end
        end
        2'b10 : begin
            for (i = 0; i < 64 ; i = i + 32) begin
                s = operandB[(i + 27) +: 5];
                computed_results[i +: 32] = $signed(operandA[i +: 32]) >>> s;
            end
        end 
        2'b11 : begin
            s = operandB[58 +: 6];
            computed_results = $signed(operandA) >>> s;
        end
        endcase
        end

    //ROTATE BY HALF
    VRTTH : begin 
        case (ww)
        2'b00 : begin
            for (i = 0; i < 64 ; i = i + 8) begin
                computed_results[i +: 8] = {operandA[(i + 4) +: 4], operandA[i +: 4]};
            end
        end
        2'b01 : begin
            for (i = 0; i < 64 ; i = i + 16) begin
                computed_results[i +: 16] = {operandA[(i + 8) +: 8], operandA[i +: 8]};
            end
        end
        2'b10 : begin
            for (i = 0; i < 64 ; i = i + 32) begin
                computed_results[i +: 32] = {operandA[(i + 16) +: 16], operandA[i +: 16]};
            end
        end 
        2'b11 : begin
            computed_results = {operandA[32 +: 32], operandA[0 +: 32]};
        end
        endcase
        end

    endcase

end

endmodule