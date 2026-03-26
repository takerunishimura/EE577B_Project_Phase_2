`include "./include/gscl45nm.v"
`timescale 1ns/10ps

module tb_syn;

reg clk, reset;
// Node 00
reg node00_pesi, node00_pero;
reg [63:0] node00_pedi;
wire node00_peri, node00_peso, node00_polarity;
wire [63:0] node00_pedo;

// Node 01
reg node01_pesi, node01_pero;
reg [63:0] node01_pedi;
wire node01_peri, node01_peso, node01_polarity;
wire [63:0] node01_pedo;

// Node 02
reg node02_pesi, node02_pero;
reg [63:0] node02_pedi;
wire node02_peri, node02_peso, node02_polarity;
wire [63:0] node02_pedo;

// Node 03
reg node03_pesi, node03_pero;
reg [63:0] node03_pedi;
wire node03_peri, node03_peso, node03_polarity;
wire [63:0] node03_pedo;

// Node 10
reg node10_pesi, node10_pero;
reg [63:0] node10_pedi;
wire node10_peri, node10_peso, node10_polarity;
wire [63:0] node10_pedo;

// Node 11
reg node11_pesi, node11_pero;
reg [63:0] node11_pedi;
wire node11_peri, node11_peso, node11_polarity;
wire [63:0] node11_pedo;

// Node 12
reg node12_pesi, node12_pero;
reg [63:0] node12_pedi;
wire node12_peri, node12_peso, node12_polarity;
wire [63:0] node12_pedo;

// Node 13
reg node13_pesi, node13_pero;
reg [63:0] node13_pedi;
wire node13_peri, node13_peso, node13_polarity;
wire [63:0] node13_pedo;

// Node 20
reg node20_pesi, node20_pero;
reg [63:0] node20_pedi;
wire node20_peri, node20_peso, node20_polarity;
wire [63:0] node20_pedo;

// Node 21
reg node21_pesi, node21_pero;
reg [63:0] node21_pedi;
wire node21_peri, node21_peso, node21_polarity;
wire [63:0] node21_pedo;

// Node 22
reg node22_pesi, node22_pero;
reg [63:0] node22_pedi;
wire node22_peri, node22_peso, node22_polarity;
wire [63:0] node22_pedo;

// Node 23
reg node23_pesi, node23_pero;
reg [63:0] node23_pedi;
wire node23_peri, node23_peso, node23_polarity;
wire [63:0] node23_pedo;

// Node 30
reg node30_pesi, node30_pero;
reg [63:0] node30_pedi;
wire node30_peri, node30_peso, node30_polarity;
wire [63:0] node30_pedo;

// Node 31
reg node31_pesi, node31_pero;
reg [63:0] node31_pedi;
wire node31_peri, node31_peso, node31_polarity;
wire [63:0] node31_pedo;

// Node 32
reg node32_pesi, node32_pero;
reg [63:0] node32_pedi;
wire node32_peri, node32_peso, node32_polarity;
wire [63:0] node32_pedo;

// Node 33
reg node33_pesi, node33_pero;
reg [63:0] node33_pedi;
wire node33_peri, node33_peso, node33_polarity;
wire [63:0] node33_pedo;

gold_mesh uut (
    .clk(clk), .reset(reset),
    .node00_pesi(node00_pesi), .node00_pero(node00_pero), .node00_pedi(node00_pedi),
    .node00_peri(node00_peri), .node00_peso(node00_peso), .node00_pedo(node00_pedo), .node00_polarity(node00_polarity),
    .node01_pesi(node01_pesi), .node01_pero(node01_pero), .node01_pedi(node01_pedi),
    .node01_peri(node01_peri), .node01_peso(node01_peso), .node01_pedo(node01_pedo), .node01_polarity(node01_polarity),
    .node02_pesi(node02_pesi), .node02_pero(node02_pero), .node02_pedi(node02_pedi),
    .node02_peri(node02_peri), .node02_peso(node02_peso), .node02_pedo(node02_pedo), .node02_polarity(node02_polarity),
    .node03_pesi(node03_pesi), .node03_pero(node03_pero), .node03_pedi(node03_pedi),
    .node03_peri(node03_peri), .node03_peso(node03_peso), .node03_pedo(node03_pedo), .node03_polarity(node03_polarity),
    .node10_pesi(node10_pesi), .node10_pero(node10_pero), .node10_pedi(node10_pedi),
    .node10_peri(node10_peri), .node10_peso(node10_peso), .node10_pedo(node10_pedo), .node10_polarity(node10_polarity),
    .node11_pesi(node11_pesi), .node11_pero(node11_pero), .node11_pedi(node11_pedi),
    .node11_peri(node11_peri), .node11_peso(node11_peso), .node11_pedo(node11_pedo), .node11_polarity(node11_polarity),
    .node12_pesi(node12_pesi), .node12_pero(node12_pero), .node12_pedi(node12_pedi),
    .node12_peri(node12_peri), .node12_peso(node12_peso), .node12_pedo(node12_pedo), .node12_polarity(node12_polarity),
    .node13_pesi(node13_pesi), .node13_pero(node13_pero), .node13_pedi(node13_pedi),
    .node13_peri(node13_peri), .node13_peso(node13_peso), .node13_pedo(node13_pedo), .node13_polarity(node13_polarity),
    .node20_pesi(node20_pesi), .node20_pero(node20_pero), .node20_pedi(node20_pedi),
    .node20_peri(node20_peri), .node20_peso(node20_peso), .node20_pedo(node20_pedo), .node20_polarity(node20_polarity),
    .node21_pesi(node21_pesi), .node21_pero(node21_pero), .node21_pedi(node21_pedi),
    .node21_peri(node21_peri), .node21_peso(node21_peso), .node21_pedo(node21_pedo), .node21_polarity(node21_polarity),
    .node22_pesi(node22_pesi), .node22_pero(node22_pero), .node22_pedi(node22_pedi),
    .node22_peri(node22_peri), .node22_peso(node22_peso), .node22_pedo(node22_pedo), .node22_polarity(node22_polarity),
    .node23_pesi(node23_pesi), .node23_pero(node23_pero), .node23_pedi(node23_pedi),
    .node23_peri(node23_peri), .node23_peso(node23_peso), .node23_pedo(node23_pedo), .node23_polarity(node23_polarity),
    .node30_pesi(node30_pesi), .node30_pero(node30_pero), .node30_pedi(node30_pedi),
    .node30_peri(node30_peri), .node30_peso(node30_peso), .node30_pedo(node30_pedo), .node30_polarity(node30_polarity),
    .node31_pesi(node31_pesi), .node31_pero(node31_pero), .node31_pedi(node31_pedi),
    .node31_peri(node31_peri), .node31_peso(node31_peso), .node31_pedo(node31_pedo), .node31_polarity(node31_polarity),
    .node32_pesi(node32_pesi), .node32_pero(node32_pero), .node32_pedi(node32_pedi),
    .node32_peri(node32_peri), .node32_peso(node32_peso), .node32_pedo(node32_pedo), .node32_polarity(node32_polarity),
    .node33_pesi(node33_pesi), .node33_pero(node33_pero), .node33_pedi(node33_pedi),
    .node33_peri(node33_peri), .node33_peso(node33_peso), .node33_pedo(node33_pedo), .node33_polarity(node33_polarity)
);

always #2 clk = ~clk;

// global timeout
initial begin
    #100000;
    $display("GLOBAL TIMEOUT");
    $finish;
end
// ===============================================================================================================
//TEST CASES TESTING RESET, HANDSHAKING WITH/WITHOUT BLOCKING
/*
initial begin
    clk = 0;
    reset = 1;
    node00_pesi = 1'b0; node00_pedi = 64'd0; node00_pero = 1'b1;
    node01_pesi = 1'b0; node01_pedi = 64'd0; node01_pero = 1'b1;
    node02_pesi = 1'b0; node02_pedi = 64'd0; node02_pero = 1'b1;
    node03_pesi = 1'b0; node03_pedi = 64'd0; node03_pero = 1'b1;
    node10_pesi = 1'b0; node10_pedi = 64'd0; node10_pero = 1'b1;
    node11_pesi = 1'b0; node11_pedi = 64'd0; node11_pero = 1'b1;
    node12_pesi = 1'b0; node12_pedi = 64'd0; node12_pero = 1'b1;
    node13_pesi = 1'b0; node13_pedi = 64'd0; node13_pero = 1'b1;
    node20_pesi = 1'b0; node20_pedi = 64'd0; node20_pero = 1'b1;
    node21_pesi = 1'b0; node21_pedi = 64'd0; node21_pero = 1'b1;
    node22_pesi = 1'b0; node22_pedi = 64'd0; node22_pero = 1'b1;
    node23_pesi = 1'b0; node23_pedi = 64'd0; node23_pero = 1'b1;
    node30_pesi = 1'b0; node30_pedi = 64'd0; node30_pero = 1'b1;
    node31_pesi = 1'b0; node31_pedi = 64'd0; node31_pero = 1'b1;
    node32_pesi = 1'b0; node32_pedi = 64'd0; node32_pero = 1'b1;
    node33_pesi = 1'b0; node33_pedi = 64'd0; node33_pero = 1'b1;

    // =====================================================
    // TEST 1: Reset signal operation
    // Verify all signals initialize correctly after reset
    // =====================================================
    $display("=== TEST 1: Reset Signal Operation ===");
    $display("During reset:");
    $display("node00_polarity=%b (expect 0)", node00_polarity);
    $display("node00_peri=%b (expect 1, PE input ready)", node00_peri);
    $display("node00_peso=%b (expect 0, PE output not sending)", node00_peso);

    // hold reset for 4 cycles to clearly show reset behavior in waveform
    @(posedge clk); @(posedge clk); @(posedge clk); @(posedge clk);

    $display("After 4 cycles still in reset:");
    $display("node00_polarity=%b (expect 0, stays 0 during reset)", node00_polarity);
    $display("node00_peri=%b (expect 1)", node00_peri);
    $display("node00_peso=%b (expect 0)", node00_peso);

    // deassert reset
    reset = 0;
    @(posedge clk); #1;
    $display("After reset deasserted (1 cycle):");
    $display("node00_polarity=%b (expect 1, first toggle after reset)", node00_polarity);
    $display("node00_peri=%b (expect 1)", node00_peri);
    $display("node00_peso=%b (expect 0)", node00_peso);

    @(posedge clk); #1;
    $display("After reset deasserted (2 cycles):");
    $display("node00_polarity=%b (expect 0, toggles every cycle)", node00_polarity);

    repeat(5) @(posedge clk);
    $display("[PASS] Reset behavior verified - check waveform for polarity toggle");

    // =====================================================
    // TEST 2: Router-to-router handshaking WITHOUT blocking
    // node00 -> node01 (1 hop East), router is ready so no blocking
    // Observe: nsi/nri handshake completes in 2 cycles
    // =====================================================
    $display("\n=== TEST 2: Handshaking WITHOUT Blocking ===");
    $display("Injecting packet from node00 to node01 (1 hop East)");
    $display("Expected: clean handshake, packet arrives at node01 with no waiting");

    wait(node00_polarity == 0); #1;
    $display("node00_peri=%b (expect 1, router ready to accept)", node00_peri);
    $display("node01_peri=%b (expect 1, node01 router ready)", node01_peri);

    // inject packet - 1 hop East
    // header: vc=0, dirX=1, hopX=0001, hopY=0000
    // bits 63:56 = 0100_0000 = 0x40
    // bits 55:48 = 0001_0000 = 0x10  (hopX=0001, hopY=0000)
    node00_pesi = 1; node00_pedi = 64'h4010_0000_AAAA_0002;
    @(posedge clk); #1;
    node00_pesi = 0; node00_pedi = 64'd0;

    // wait for packet to arrive at node01
    wait(node01_peso == 1); #1;
    if (node01_pedo[31:0] == 32'hAAAA_0002)
        $display("[PASS] Packet arrived at node01 without blocking: node01_pedo=%h", node01_pedo);
    else
        $display("[FAIL] node01_pedo=%h (expect AAAA_0002)", node01_pedo);

    repeat(10) @(posedge clk);

    // =====================================================
    // TEST 3: Router-to-router handshaking WITH blocking
    // Inject first packet, wait for it to arrive at node01,
    // then block it, inject second packet, verify blocking,
    // then unblock and verify second packet arrives
    // =====================================================
    $display("\n=== TEST 3: Handshaking WITH Blocking ===");

    // Block node01 BEFORE injecting - packet will get stuck in router00's east output
    node01_pero = 0;  // block node01 from accepting from west neighbor
    repeat(3) @(posedge clk); #1;
    $display("Step 1: node01 blocked (pero=0), injecting packet from node00");

    wait(node00_polarity == 0); #1;
    node00_pesi = 1; node00_pedi = 64'h4010_0000_BBBB_0003;
    @(posedge clk); #1;
    node00_pesi = 0; node00_pedi = 64'd0;

    repeat(10) @(posedge clk); #1;
    $display("Step 2: Packet blocked in router00 east output:");
    $display("router00 east_oc even=%h full=%b", uut.router00.east_oc.even_buffer, uut.router00.east_oc.even_buffer_full);
    $display("router00 east_oc odd=%h full=%b", uut.router00.east_oc.odd_buffer, uut.router00.east_oc.odd_buffer_full);
    $display("node01_peso=%b (expect 0, blocked)", node01_peso);

    // unblock
    $display("Step 3: Unblocking node01 (pero=1)");
    node01_pero = 1;
    wait(node01_peso == 1); #1;
    if (node01_pedo[31:0] == 32'hBBBB_0003)
        $display("[PASS] Packet arrived after unblocking: node01_pedo=%h", node01_pedo);
    else
        $display("[FAIL] node01_pedo=%h (expect BBBB_0003)", node01_pedo);

    repeat(10) @(posedge clk);

    $display("\n=== ALL WAVEFORM TESTS COMPLETE - Run make simg to view waveforms ===");
    #20;
    $finish;
end
*/
// ===============================================================================================================



// ===============================================================================================================
//FUNCTIONALITY & CONTENTION SITUATION TEST CASES
initial begin
    clk = 0;
    reset = 1;
    node00_pesi = 1'b0; node00_pedi = 64'd0; node00_pero = 1'b1;
    node01_pesi = 1'b0; node01_pedi = 64'd0; node01_pero = 1'b1;
    node02_pesi = 1'b0; node02_pedi = 64'd0; node02_pero = 1'b1;
    node03_pesi = 1'b0; node03_pedi = 64'd0; node03_pero = 1'b1;
    node10_pesi = 1'b0; node10_pedi = 64'd0; node10_pero = 1'b1;
    node11_pesi = 1'b0; node11_pedi = 64'd0; node11_pero = 1'b1;
    node12_pesi = 1'b0; node12_pedi = 64'd0; node12_pero = 1'b1;
    node13_pesi = 1'b0; node13_pedi = 64'd0; node13_pero = 1'b1;
    node20_pesi = 1'b0; node20_pedi = 64'd0; node20_pero = 1'b1;
    node21_pesi = 1'b0; node21_pedi = 64'd0; node21_pero = 1'b1;
    node22_pesi = 1'b0; node22_pedi = 64'd0; node22_pero = 1'b1;
    node23_pesi = 1'b0; node23_pedi = 64'd0; node23_pero = 1'b1;
    node30_pesi = 1'b0; node30_pedi = 64'd0; node30_pero = 1'b1;
    node31_pesi = 1'b0; node31_pedi = 64'd0; node31_pero = 1'b1;
    node32_pesi = 1'b0; node32_pedi = 64'd0; node32_pero = 1'b1;
    node33_pesi = 1'b0; node33_pedi = 64'd0; node33_pero = 1'b1;

    @(posedge clk); @(posedge clk);
    reset = 0;
    @(posedge clk); #1;

    // =====================================================
    // TEST 1: node00 -> node03 (3 hops East)
    // vc=0, dirX=1, hopX=0111, hopY=0000
    // header: [63]=0 [62]=1 [61]=0 [60:56]=00000 [55:52]=0111 [51:48]=0000
    // =====================================================
    $display("=== TEST 1: node00 -> node03 (3 hops East) ===");
    wait(node00_polarity == 0); #1;
    node00_pesi = 1; node00_pedi = 64'h4070_0000_AAAA_0001;
    @(posedge clk); #1;
    node00_pesi = 0; node00_pedi = 64'd0;
    wait(node03_peso == 1); #1;
    if (node03_pedo[31:0] == 32'hAAAA_0001)
        $display("[PASS] node03_pedo=%h", node03_pedo);
    else
        $display("[FAIL] node03_pedo=%h (expect AAAA_0001)", node03_pedo);
    @(posedge clk); #1;
    // after each test, wait for buffers to clear
    repeat(50) @(posedge clk);

    // =====================================================
    // TEST 2: node03 -> node00 (3 hops West)
    // vc=0, dirX=0, hopX=0111, hopY=0000
    // header: [63]=0 [62]=0 [61]=0 [60:56]=00000 [55:52]=0111 [51:48]=0000
    // =====================================================
    $display("\n=== TEST 2: node03 -> node00 (3 hops West) ===");
    wait(node03_polarity == 0); #1;
    node03_pesi = 1; node03_pedi = 64'h0070_0000_BBBB_0002;
    @(posedge clk); #1;
    node03_pesi = 0; node03_pedi = 64'd0;
    wait(node00_peso == 1); #1;
    if (node00_pedo[31:0] == 32'hBBBB_0002)
        $display("[PASS] node00_pedo=%h", node00_pedo);
    else
        $display("[FAIL] node00_pedo=%h (expect BBBB_0002)", node00_pedo);
    @(posedge clk); #1;
    repeat(50) @(posedge clk);

    // =====================================================
    // TEST 3: node00 -> node30 (3 hops South)
    // vc=0, dirX=0, dirY=0, hopX=0000, hopY=0111
    // header: [63]=0 [62]=0 [61]=0 [60:56]=00000 [55:52]=0000 [51:48]=0111
    // =====================================================
    $display("\n=== TEST 3: node00 -> node30 (3 hops South) ===");
    wait(node00_polarity == 0); #1;
    node00_pesi = 1; node00_pedi = 64'h0007_0000_CCCC_0003;
    @(posedge clk); #1;
    node00_pesi = 0; node00_pedi = 64'd0;
    wait(node30_peso == 1); #1;
    if (node30_pedo[31:0] == 32'hCCCC_0003)
        $display("[PASS] node30_pedo=%h", node30_pedo);
    else
        $display("[FAIL] node30_pedo=%h (expect CCCC_0003)", node30_pedo);
    @(posedge clk); #1;
    repeat(50) @(posedge clk);

    // =====================================================
    // TEST 4: node30 -> node00 (3 hops North)
    // vc=0, dirX=0, dirY=1, hopX=0000, hopY=0111
    // header: [63]=0 [62]=0 [61]=1 [60:56]=00000 [55:52]=0000 [51:48]=0111
    // =====================================================
    $display("\n=== TEST 4: node30 -> node00 (3 hops North) ===");
    wait(node30_polarity == 0); #1;
    node30_pesi = 1; node30_pedi = 64'h2007_0000_DDDD_0004;
    @(posedge clk); #1;
    node30_pesi = 0; node30_pedi = 64'd0;
    wait(node00_peso == 1); #1;
    if (node00_pedo[31:0] == 32'hDDDD_0004)
        $display("[PASS] node00_pedo=%h", node00_pedo);
    else
        $display("[FAIL] node00_pedo=%h (expect DDDD_0004)", node00_pedo);
    @(posedge clk); #1;
    repeat(50) @(posedge clk);

    // =====================================================
    // TEST 5: node00 -> node33 (3 hops East + 3 hops South)
    // vc=0, dirX=1, dirY=0, hopX=0111, hopY=0111
    // header: [63]=0 [62]=1 [61]=0 [60:56]=00000 [55:52]=0111 [51:48]=0111
    // =====================================================
    $display("\n=== TEST 5: node00 -> node33 (3E + 3S) ===");
    wait(node00_polarity == 0); #1;
    node00_pesi = 1; node00_pedi = 64'h4077_0000_EEEE_0005;
    @(posedge clk); #1;
    node00_pesi = 0; node00_pedi = 64'd0;
    
    wait(node33_peso == 1); #1;
    if (node33_pedo[31:0] == 32'hEEEE_0005)
        $display("[PASS] node33_pedo=%h", node33_pedo);
    else
        $display("[FAIL] node33_pedo=%h (expect EEEE_0005)", node33_pedo);
    @(posedge clk); #1;
    repeat(50) @(posedge clk);

    // =====================================================
    // TEST 6: node33 -> node00 (3 hops West + 3 hops North)
    // vc=0, dirX=0, dirY=1, hopX=0111, hopY=0111
    // header: [63]=0 [62]=0 [61]=1 [60:56]=00000 [55:52]=0111 [51:48]=0111
    // =====================================================
    // wait for node00 PE output to clear from previous test
    wait(node00_peso == 0);
    repeat(10) @(posedge clk); #1;

    $display("\n=== TEST 6: node33 -> node00 (3W + 3N) ===");
    wait(node33_polarity == 0); #1;
    node33_pesi = 1; node33_pedi = 64'h2077_0000_FFFF_0006;
    @(posedge clk); #1;
    node33_pesi = 0; node33_pedi = 64'd0;
    wait(node00_peso == 1); #1;
    if (node00_pedo[31:0] == 32'hFFFF_0006)
        $display("[PASS] node00_pedo=%h", node00_pedo);
    else
        $display("[FAIL] node00_pedo=%h (expect FFFF_0006)", node00_pedo);
    @(posedge clk); #1;
    repeat(50) @(posedge clk);

    // =====================================================
    // TEST 7: Contention - node01 and node10 both sending to node00
    // node01 -> node00 (1 hop West): dirX=0, hopX=0001, hopY=0000
    // node10 -> node00 (1 hop North): dirY=1, hopX=0000, hopY=0001
    // Both arrive at router00 PE output simultaneously -> contention
    // =====================================================
    $display("\n=== TEST 7: Contention - node01 and node10 both sending to node00 ===");

    // wait for node00 PE output to be clear from previous test
    wait(node00_peso == 0);
    repeat(10) @(posedge clk); #1;

    // inject both packets simultaneously on same polarity
    wait(node01_polarity == 0); #1;
    node01_pesi = 1; node01_pedi = 64'h0010_0000_1111_0007;
    node10_pesi = 1; node10_pedi = 64'h2001_0000_2222_0007;
    @(posedge clk); #1;
    node01_pesi = 0; node01_pedi = 64'd0;
    node10_pesi = 0; node10_pedi = 64'd0;

    // first packet arrives - arbiter picks one
    wait(node00_peso == 1); #1;
    $display("First packet: node00_pedo=%h", node00_pedo);
    if (node00_pedo[31:0] == 32'h1111_0007)
        $display("[INFO] node01 packet won first arbitration");
    else if (node00_pedo[31:0] == 32'h2222_0007)
        $display("[INFO] node10 packet won first arbitration");
    else
        $display("[FAIL] unexpected packet %h", node00_pedo);
    @(posedge clk); #1;

    // second packet arrives after arbitration
    wait(node00_peso == 1); #1;
    $display("Second packet: node00_pedo=%h", node00_pedo);
    if (node00_pedo[31:0] == 32'h1111_0007)
        $display("[INFO] node01 packet arrived second");
    else if (node00_pedo[31:0] == 32'h2222_0007)
        $display("[INFO] node10 packet arrived second");
    else
        $display("[FAIL] unexpected packet %h", node00_pedo);

    if (node00_pedo[31:0] == 32'h1111_0007 || node00_pedo[31:0] == 32'h2222_0007)
        $display("[PASS] Both packets arrived at node00 - contention handled correctly");

    $display("\n=== ALL TESTS COMPLETE ===");
    #20;
    $finish;
end
// ===============================================================================================================

initial begin
    $dumpfile("tb_syn.vcd");
    $dumpvars(0, tb_syn);
end

initial begin
		$sdf_annotate("./netlist/gold_mesh_syn.sdf", uut,,"sdf.log","MAXIMUM","1.0:1.0:1.0", "FROM_MAXIMUM");	//http://www.pldworld.com/_hdl/2/_ref/se_html/manual_html/c_sdf10.html
		$enable_warnings;
		$log("ncsim.log");
	end

endmodule