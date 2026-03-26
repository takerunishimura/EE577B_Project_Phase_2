module tb_input_ctrl;

reg clk, reset;
reg send_in;
reg [63:0] data_in;
reg polarity;
reg grant_N, grant_S, grant_E, grant_W, grant_PE;

wire ready_in;
wire [63:0] data_out;
wire forward_N, forward_S, forward_E, forward_W, forward_PE;

// instantiate input_ctrl
input_ctrl uut (
    .clk(clk),
    .reset(reset),
    .send_in(send_in),
    .ready_in(ready_in),
    .data_in(data_in),
    .data_out(data_out),
    .polarity(polarity),
    .grant_N(grant_N),
    .grant_S(grant_S),
    .grant_E(grant_E),
    .grant_W(grant_W),
    .grant_PE(grant_PE),
    .forward_N(forward_N),
    .forward_S(forward_S),
    .forward_E(forward_E),
    .forward_W(forward_W),
    .forward_PE(forward_PE)
);

// clock generation
always #2 clk = ~clk;

/* packet format 
[63]    = vc
[62]    = dirX
[61]    = dirY
[60:56] = reserved
[55:52] = hopX
[51:48] = hopY
[47:40] = sourceX
[39:32] = sourceY
[31:0]  = payload */

task send_packet;
    input [63:0] pkt;
    begin
        data_in = pkt;
        send_in = 1;
        @(posedge clk);
        #1;
        send_in = 0;
    end
endtask

initial begin
    // initialize
    clk = 0;
    reset = 1;
    send_in = 0;
    data_in = 64'd0;
    polarity = 0;
    grant_N = 0;
    grant_S = 0;
    grant_E = 0;
    grant_W = 0;
    grant_PE = 0;

    // apply reset for 2 cycles
    @(posedge clk); @(posedge clk);
    reset = 0;
    #1;

    $display("=== TEST 1: Reset behavior ===");
    $display("ready_in=%b (expect 1)", ready_in);
    $display("forward_N=%b forward_S=%b forward_E=%b forward_W=%b forward_PE=%b (expect all 0)",
             forward_N, forward_S, forward_E, forward_W, forward_PE);

    // TEST 2: Route East (hopX=4'hF, dirX=1, hopY=0)
    $display("\n=== TEST 2: Route East - even polarity ===");
    polarity = 0;
    // vc=0, dirX=1, dirY=0, reserved=0, hopX=4'hF, hopY=4'h0, srcX=0, srcY=0, payload=0
    send_packet({1'b0, 1'b1, 1'b0, 5'b0, 4'hF, 4'h0, 8'h0, 8'h0, 32'hDEADBEEF});
    @(posedge clk); #1;
    $display("forward_E=%b (expect 1)", forward_E);
    $display("forward_N=%b forward_S=%b forward_W=%b forward_PE=%b (expect 0)",
             forward_N, forward_S, forward_W, forward_PE);
    $display("ready_in=%b (expect 0, buffer full)", ready_in);

    // clear buffer with grant
    grant_E = 1;
    @(posedge clk); #1;
    grant_E = 0;
    @(posedge clk); #1;
    $display("ready_in=%b (expect 1, buffer cleared)", ready_in);

    // TEST 3: Route West (hopX=4'hF, dirX=0)
    $display("\n=== TEST 3: Route West - odd polarity ===");
    polarity = 1;
    send_packet({1'b1, 1'b0, 1'b0, 5'b0, 4'hF, 4'h0, 8'h0, 8'h0, 32'hCAFEBABE});
    @(posedge clk); #1;
    $display("forward_W=%b (expect 1)", forward_W);
    $display("forward_N=%b forward_S=%b forward_E=%b forward_PE=%b (expect 0)",
             forward_N, forward_S, forward_E, forward_PE);

    grant_W = 1;
    @(posedge clk); #1;
    grant_W = 0;

    // TEST 4: Route North (hopX=0, hopY=4'hF, dirY=1)
    $display("\n=== TEST 4: Route North - even polarity ===");
    polarity = 0;
    send_packet({1'b0, 1'b0, 1'b1, 5'b0, 4'h0, 4'hF, 8'h0, 8'h0, 32'h12345678});
    @(posedge clk); #1;
    $display("forward_N=%b (expect 1)", forward_N);
    $display("forward_S=%b forward_E=%b forward_W=%b forward_PE=%b (expect 0)",
             forward_S, forward_E, forward_W, forward_PE);

    grant_N = 1;
    @(posedge clk); #1;
    grant_N = 0;

    // TEST 5: Route South (hopX=0, hopY=4'hF, dirY=0)
    $display("\n=== TEST 5: Route South - odd polarity ===");
    polarity = 1;
    send_packet({1'b1, 1'b0, 1'b0, 5'b0, 4'h0, 4'hF, 8'h0, 8'h0, 32'hABCDEF00});
    @(posedge clk); #1;
    $display("forward_S=%b (expect 1)", forward_S);
    $display("forward_N=%b forward_E=%b forward_W=%b forward_PE=%b (expect 0)",
             forward_N, forward_E, forward_W, forward_PE);

    grant_S = 1;
    @(posedge clk); #1;
    grant_S = 0;

    // TEST 6: Route to PE (hopX=0, hopY=0)
    $display("\n=== TEST 6: Route to PE - even polarity ===");
    polarity = 0;
    send_packet({1'b0, 1'b0, 1'b0, 5'b0, 4'h0, 4'h0, 8'h01, 8'h01, 32'hBEEFCAFE});
    @(posedge clk); #1;
    $display("forward_PE=%b (expect 1)", forward_PE);
    $display("forward_N=%b forward_S=%b forward_E=%b forward_W=%b (expect 0)",
             forward_N, forward_S, forward_E, forward_W);

    grant_PE = 1;
    @(posedge clk); #1;
    grant_PE = 0;

    // TEST 7: Buffer full - reject new packet
    $display("\n=== TEST 7: Buffer full - reject incoming packet ===");
    polarity = 0;
    send_packet({1'b0, 1'b1, 1'b0, 5'b0, 4'hF, 4'h0, 8'h0, 8'h0, 32'h11111111});
    @(posedge clk); #1;
    $display("ready_in=%b (expect 0, buffer full)", ready_in);
    // try sending another packet - should be rejected
    send_packet({1'b0, 1'b1, 1'b0, 5'b0, 4'hF, 4'h0, 8'h0, 8'h0, 32'h22222222});
    @(posedge clk); #1;
    $display("data_out=%h (expect first packet, not overwritten)", data_out);

    grant_E = 1;
    @(posedge clk); #1;
    grant_E = 0;

    // TEST 8: hop decrement check
    $display("\n=== TEST 8: Hop decrement - hopX should right shift ===");
    polarity = 0;
    // hopX = 4'hF (1111), after forwarding should become 4'h7 (0111)
    send_packet({1'b0, 1'b1, 1'b0, 5'b0, 4'hF, 4'h0, 8'h0, 8'h0, 32'h0});
    @(posedge clk); #1;
    $display("data_out hopX=%b (expect 0111)", data_out[55:52]);

    grant_E = 1;
    @(posedge clk); #1;
    grant_E = 0;

    $display("\n=== ALL TESTS COMPLETE ===");
    $finish;
end

initial begin
    $dumpfile("tb_input_ctrl.vcd");
    $dumpvars(0, tb);
end

endmodule