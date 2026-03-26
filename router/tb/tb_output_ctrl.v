`timescale 1ns/10ps
module tb_output_ctrl;

reg clk, reset;
reg [63:0] data_N, data_S, data_E, data_W, data_PE;
reg polarity;
reg ready_out;
reg forward_N, forward_S, forward_E, forward_W, forward_PE;

wire grant_N, grant_S, grant_E, grant_W, grant_PE;
wire [63:0] data_out;
wire send_out;

// instantiate output_ctrl
output_ctrl uut (
    .clk(clk),
    .reset(reset),
    .data_N(data_N),
    .data_S(data_S),
    .data_W(data_W),
    .data_E(data_E),
    .data_PE(data_PE),
    .polarity(polarity),
    .ready_out(ready_out),
    .forward_N(forward_N),
    .forward_S(forward_S),
    .forward_E(forward_E),
    .forward_W(forward_W),
    .forward_PE(forward_PE),
    .grant_N(grant_N),
    .grant_S(grant_S),
    .grant_W(grant_W),
    .grant_E(grant_E),
    .grant_PE(grant_PE),
    .data_out(data_out),
    .send_out(send_out)
);

// 250MHz clock
always #2 clk = ~clk;

initial begin
    // initialize
    clk = 0;
    reset = 1;
    polarity = 0;
    ready_out = 0;
    forward_N = 0; forward_S = 0; forward_E = 0; forward_W = 0; forward_PE = 0;
    data_N = 64'd0; data_S = 64'd0; data_E = 64'd0; data_W = 64'd0; data_PE = 64'd0;

    // apply reset for 2 cycles
    @(posedge clk); @(posedge clk);
    reset = 0;
    #1;

    $display("=== TEST 1: Reset behavior ===");
    $display("grant_N=%b grant_S=%b grant_E=%b grant_W=%b grant_PE=%b (expect all 0)",
             grant_N, grant_S, grant_E, grant_W, grant_PE);
    $display("send_out=%b (expect 0)", send_out);

    // TEST 2: Single request from North - no contention
    $display("\n=== TEST 2: Single request from North - no contention ===");
    polarity = 0;
    data_N = 64'hDEADBEEF_12345678;
    forward_N = 1;
    #1; // wait for combinational to settle
    $display("grant_N=%b (expect 1)", grant_N);
    $display("grant_S=%b grant_E=%b grant_W=%b grant_PE=%b (expect all 0)",
             grant_S, grant_E, grant_W, grant_PE);
    @(posedge clk); #1; // latch data into buffer
    forward_N = 0;
    @(posedge clk); #1;

    // TEST 3: send_out handshaking
    $display("\n=== TEST 3: send_out handshaking ===");
    // on even cycle, odd buffer transmits externally
    // we latched into even buffer, so need odd cycle to transmit
    polarity = 1;
    ready_out = 1;
    #1;
    $display("send_out=%b (expect 1, even buffer full and ready_out high)", send_out);
    $display("data_out=%h", data_out);
    @(posedge clk); #1;
    ready_out = 0;
    polarity = 0;
    #1;
    $display("send_out=%b (expect 0, buffer cleared)", send_out);

    // TEST 4: Single request from South - odd polarity
    $display("\n=== TEST 4: Single request from South ===");
    polarity = 1;
    data_S = 64'hCAFEBABE_ABCDEF00;
    forward_S = 1;
    #1;
    $display("grant_S=%b (expect 1)", grant_S);
    $display("grant_N=%b grant_E=%b grant_W=%b grant_PE=%b (expect all 0)",
             grant_N, grant_E, grant_W, grant_PE);
    @(posedge clk); #1;
    forward_S = 0;
    @(posedge clk); #1;

    // TEST 5: Contention - N and S both requesting, state = Last_N so S gets priority
    $display("\n=== TEST 5: Contention - N and S both requesting (Last_N state, S has priority) ===");
    polarity = 0;
    data_N = 64'hAAAAAAAA_AAAAAAAA;
    data_S = 64'hBBBBBBBB_BBBBBBBB;
    forward_N = 1;
    forward_S = 1;
    #1;
    $display("grant_S=%b (expect 1, S has priority over N)", grant_S);
    $display("grant_N=%b (expect 0)", grant_N);
    @(posedge clk); #1;
    forward_N = 0;
    forward_S = 0;
    @(posedge clk); #1;

    polarity = 1; ready_out = 1;
    @(posedge clk); #1;
    polarity = 0; ready_out = 1;
    @(posedge clk); #1;
    ready_out = 0;
    #1;

    // TEST 6: Contention - state should now be Last_S so E gets priority
    $display("\n=== TEST 6: Contention - N S E requesting (Last_S state, E has priority) ===");
    polarity = 1;
    data_N = 64'hCCCCCCCC_CCCCCCCC;
    data_S = 64'hDDDDDDDD_DDDDDDDD;
    data_E = 64'hEEEEEEEE_EEEEEEEE;
    forward_N = 1;
    forward_S = 1;
    forward_E = 1;
    #1;
    $display("grant_E=%b (expect 1, E has priority)", grant_E);
    $display("grant_N=%b grant_S=%b (expect 0)", grant_N, grant_S);
    @(posedge clk); #1;
    forward_N = 0;
    forward_S = 0;
    forward_E = 0;
    @(posedge clk); #1;

    // TEST 7: Buffer full - no grant given
    $display("\n=== TEST 7: Buffer full - no grant given ===");
    // first fill the even buffer
    polarity = 0;
    data_N = 64'h11111111_11111111;
    forward_N = 1;
    #1;
    @(posedge clk); #1; // latch into even buffer
    forward_N = 0;
    // now try another request - even buffer should be full
    data_S = 64'h22222222_22222222;
    forward_S = 1;
    #1;
    $display("grant_N=%b grant_S=%b (expect both 0, even buffer full)", grant_N, grant_S);
    @(posedge clk); #1;
    forward_S = 0;

    // clear even buffer via external transmission on odd cycle
    polarity = 1;
    ready_out = 1;
    #1;
    @(posedge clk); #1;
    ready_out = 0;
    polarity = 0;

    // TEST 8: PE vs N contention - N should win (PE has fixed lowest priority)
    $display("\n=== TEST 8: PE vs N contention - N should win ===");
    polarity = 0;
    data_N = 64'hFFFFFFFF_FFFFFFFF;
    data_PE = 64'h00000000_00000001;
    forward_N = 1;
    forward_PE = 1;
    #1;
    $display("grant_N=%b (expect 1, N has priority over PE)", grant_N);
    $display("grant_PE=%b (expect 0)", grant_PE);
    @(posedge clk); #1;
    forward_N = 0;
    forward_PE = 0;

    $display("\n=== ALL TESTS COMPLETE ===");
    $finish;
end

initial begin
    $dumpfile("tb_output_ctrl.vcd");
    $dumpvars(0, tb_output_ctrl);
end

endmodule