module input_ctrl (clk, reset, 
                   send_in, ready_in, data_in, data_out, 
                   polarity, 
                   grant_N, grant_S, grant_E, grant_W, grant_PE, 
                   forward_N, forward_S, forward_E, forward_W, forward_PE);
input clk, reset;
input send_in; //handshaking signal, neighbor is ready to send a packet to you
input [63:0] data_in; //data input
input polarity; //0=even or 1=odd
input grant_N, grant_S, grant_E, grant_W, grant_PE; //grants from output_ctrl

output forward_N, forward_S, forward_E, forward_W, forward_PE; //requests to output_ctrl
output ready_in; //handshaking signal, you are ready to accept packet
output [63:0] data_out;

reg [63:0] even_buffer;
reg [63:0] odd_buffer;
reg even_buffer_full, odd_buffer_full;

wire [3:0] hopX, hopY;
wire dirX, dirY;
/*
dirX = 1(East), 0(West)
dirY = 1(North), 0(South)
*/
wire [63:0] current_buffer;
wire buffer_has_data;

assign current_buffer = polarity ? odd_buffer : even_buffer;
//assign data_out = {current_buffer[63:56], current_buffer[55:52] >> 1, current_buffer[51:48] >> 1, current_buffer[47:0]};
assign data_out = (hopX[0] == 1) ? {current_buffer[63:56], current_buffer[55:52] >> 1, current_buffer[51:48], current_buffer[47:0]} : {current_buffer[63:56], current_buffer[55:52], current_buffer[51:48] >> 1, current_buffer[47:0]};
//hop count is unary coded, header processing at each hop is a right shift operation
assign hopX = current_buffer[55:52];
assign hopY = current_buffer[51:48];
assign dirX = current_buffer[62];
assign dirY = current_buffer[61];

assign ready_in = polarity ? ~odd_buffer_full : ~even_buffer_full;

assign buffer_has_data = polarity ? odd_buffer_full : even_buffer_full;

assign forward_E = ((hopX[0] == 1) && (dirX == 1) && buffer_has_data);
assign forward_W = ((hopX[0] == 1) && (dirX == 0) && buffer_has_data);
assign forward_N = ((hopX[0] == 0) && (hopY[0] == 1) && (dirY == 1) && buffer_has_data);
assign forward_S = ((hopX[0] == 0) && (hopY[0] == 1) && (dirY == 0) && buffer_has_data);
assign forward_PE = ((hopX[0] == 0) && (hopY[0] == 0) && buffer_has_data);

always @(posedge clk) begin
    if (reset) begin
        even_buffer <= 64'd0;
        odd_buffer <= 64'd0;
        even_buffer_full <= 0;
        odd_buffer_full <= 0;
    end
    else begin
        if ((polarity == 0) && !even_buffer_full && send_in) begin
            even_buffer <= data_in;
            even_buffer_full <= 1'b1;
        end
        if ((polarity == 1) && !odd_buffer_full && send_in) begin
            odd_buffer <= data_in;
            odd_buffer_full <= 1'b1;
        end
        // if there are any grant signals, that indicates data from input_ctrl is sent to output_ctrl, so the buffer in input_ctrl side is empty
        if (polarity == 0 && (grant_N || grant_E || grant_S || grant_W || grant_PE)) 
            even_buffer_full <= 0;
        if (polarity == 1 && (grant_N || grant_E || grant_S || grant_W || grant_PE))
            odd_buffer_full <= 0;
    end
end
endmodule