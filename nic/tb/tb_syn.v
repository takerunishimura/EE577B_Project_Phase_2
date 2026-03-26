`include "./include/gscl45nm.v"

`timescale 1ns/10ps

module tb_syn;

    // ------------------------------------------------------------
    // DUT signals
    // ------------------------------------------------------------
    reg         clk;
    reg         reset;

    reg  [1:0]  addr;
    reg  [63:0] d_in;
    wire [63:0] d_out;
    reg         nicEn;
    reg         nicWrEn;

    wire        net_so;
    reg         net_ro;
    wire [63:0] net_do;

    reg         net_si;
    wire        net_ri;
    reg  [63:0] net_di;
    reg         net_polarity;

    // ------------------------------------------------------------
    // DUT
    // ------------------------------------------------------------
    cardinal_nic dut (
        .clk          (clk),
        .reset        (reset),
        .addr         (addr),
        .d_in         (d_in),
        .d_out        (d_out),
        .nicEn        (nicEn),
        .nicWrEn      (nicWrEn),
        .net_so       (net_so),
        .net_ro       (net_ro),
        .net_do       (net_do),
        .net_si       (net_si),
        .net_ri       (net_ri),
        .net_di       (net_di),
        .net_polarity (net_polarity)
    );

    // ------------------------------------------------------------
    // Useful constants
    // ------------------------------------------------------------
    localparam ADDR_IN_BUF     = 2'b00;
    localparam ADDR_IN_STATUS  = 2'b01;
    localparam ADDR_OUT_BUF    = 2'b10;
    localparam ADDR_OUT_STATUS = 2'b11;

    // packet[63] = VC polarity bit
    localparam [63:0] PKT_EVEN = 64'h0123_4567_89AB_CDEF; // bit63 = 0
    localparam [63:0] PKT_ODD  = 64'h8123_4567_89AB_CDEF; // bit63 = 1
    localparam [63:0] PKT_IN1  = 64'h1111_2222_3333_4444; // from router to NIC
    localparam [63:0] PKT_IN2  = 64'hAAAA_BBBB_CCCC_DDDD;

    integer errors;

    // ------------------------------------------------------------
    // Clock
    // ------------------------------------------------------------
    initial begin
        clk = 1'b0;
        forever #2 clk = ~clk;
    end

    // ------------------------------------------------------------
    // Helper tasks
    // ------------------------------------------------------------
    task clear_inputs;
    begin
        addr         = 2'b00;
        d_in         = 64'd0;
        nicEn        = 1'b0;
        nicWrEn      = 1'b0;
        net_ro       = 1'b0;
        net_si       = 1'b0;
        net_di       = 64'd0;
        net_polarity = 1'b0;
    end
    endtask

    task check;
        input cond;
        input [255:0] msg;
    begin
        if (!cond) begin
            $display("[FAIL] %0t : %0s", $time, msg);
            errors = errors + 1;
        end else begin
            $display("[PASS] %0t : %0s", $time, msg);
        end
    end
    endtask

    task proc_write_outbuf;
        input [63:0] pkt;
    begin
        @(negedge clk);
        nicEn   = 1'b1;
        nicWrEn = 1'b1;
        addr    = ADDR_OUT_BUF;
        d_in    = pkt;
        @(posedge clk);
        #1;
        @(negedge clk);
        nicEn   = 1'b0;
        nicWrEn = 1'b0;
        addr    = 2'b00;
        d_in    = 64'd0;
    end
    endtask

    task proc_read_reg;
        input  [1:0] reg_addr;
    begin
        @(negedge clk);
        nicEn   = 1'b1;
        nicWrEn = 1'b0;
        addr    = reg_addr;
        @(posedge clk);
        #1;
        @(negedge clk);
        nicEn   = 1'b0;
        nicWrEn = 1'b0;
        addr    = 2'b00;
    end
    endtask

    task router_send_to_nic;
        input [63:0] pkt;
    begin
        @(negedge clk);
        net_di = pkt;
        net_si = 1'b1;
        @(posedge clk);
        #1;
        @(negedge clk);
        net_si = 1'b0;
        net_di = 64'd0;
    end
    endtask

    // ------------------------------------------------------------
    // Test sequence
    // ------------------------------------------------------------
    initial begin
        errors = 0;
        clear_inputs();

        // -------------------------
        // Reset test
        // -------------------------
        reset = 1'b1;
        @(posedge clk);
        #1;
        check(net_so == 1'b0, "After reset, net_so should be 0");
        check(net_ri == 1'b1, "After reset, net_ri should be 1 (input buffer empty)");

        proc_read_reg(ADDR_IN_STATUS);
        check(d_out == 64'd0, "After reset, input status should be 0");

        proc_read_reg(ADDR_OUT_STATUS);
        check(d_out == 64'd0, "After reset, output status should be 0");

        reset = 1'b0;
        @(posedge clk);
        #1;

        // --------------------------------------------------------
        // Case 1: Processor store when output buffer AVAILABLE
        // --------------------------------------------------------
        $display("\n=== Case 1: Processor store when output buffer available ===");
        proc_write_outbuf(PKT_EVEN);

        proc_read_reg(ADDR_OUT_STATUS);
        check(d_out == 64'd1, "Output status should become 1 after successful store");

        // --------------------------------------------------------
        // Case 2: Processor store when output buffer UNAVAILABLE
        //         (illegal store ignored)
        // --------------------------------------------------------
        $display("\n=== Case 2: Processor store when output buffer unavailable ===");
        proc_write_outbuf(PKT_ODD);  // should be ignored because out buffer already full

        // still should contain original packet
        check(net_do == PKT_EVEN, "Output buffer content should remain unchanged when full");

        proc_read_reg(ADDR_OUT_STATUS);
        check(d_out == 64'd1, "Output status should remain 1 when store is ignored");

        // --------------------------------------------------------
        // NIC -> Router handshake WITHOUT blocking
        // out buffer full, router ready, polarity match
        // --------------------------------------------------------
        $display("\n=== NIC -> Router handshake without blocking ===");
        net_ro       = 1'b1;
        net_polarity = 1'b0; // matches PKT_EVEN[63] = 0

        #1;
        check(net_so == 1'b1, "net_so should assert when out buffer full, net_ro=1, polarity matches");
        check(net_do == PKT_EVEN, "net_do should drive output packet");

        @(posedge clk);
        #1;
        check(net_so == 1'b0, "After successful send, net_so should deassert");
        proc_read_reg(ADDR_OUT_STATUS);
        check(d_out == 64'd0, "After successful send, output status should return to 0");

        net_ro = 1'b0;

        // --------------------------------------------------------
        // NIC -> Router handshake WITH blocking
        // out buffer full, but router not ready first
        // --------------------------------------------------------
        $display("\n=== NIC -> Router handshake with blocking ===");
        proc_write_outbuf(PKT_ODD);

        net_ro       = 1'b0; // blocking
        net_polarity = 1'b1; // matches odd packet

        #1;
        check(net_so == 1'b0, "When router not ready, net_so should stay 0");
        check(net_do == PKT_ODD, "Blocked packet should remain on net_do/output buffer");

        proc_read_reg(ADDR_OUT_STATUS);
        check(d_out == 64'd1, "Output status should remain 1 while blocked");

        // now unblock
        net_ro = 1'b1;
        #1;
        check(net_so == 1'b1, "When router becomes ready, net_so should assert");

        @(posedge clk);
        #1;
        proc_read_reg(ADDR_OUT_STATUS);
        check(d_out == 64'd0, "After blocked packet is finally sent, output status should clear");

        net_ro = 1'b0;

        // --------------------------------------------------------
        // Also verify polarity mismatch blocks send
        // --------------------------------------------------------
        $display("\n=== NIC -> Router blocked by polarity mismatch ===");
        proc_write_outbuf(PKT_EVEN);
        net_ro       = 1'b1;
        net_polarity = 1'b1; // mismatch

        #1;
        check(net_so == 1'b0, "net_so should be 0 when polarity mismatches packet VC");

        // fix polarity
        net_polarity = 1'b0;
        #1;
        check(net_so == 1'b1, "net_so should assert once polarity matches");

        @(posedge clk);
        #1;
        proc_read_reg(ADDR_OUT_STATUS);
        check(d_out == 64'd0, "Output status should clear after send on correct polarity");

        net_ro = 1'b0;

        // --------------------------------------------------------
        // Router -> NIC handshake WITHOUT blocking
        // input buffer empty, so net_ri should be 1
        // --------------------------------------------------------
        $display("\n=== Router -> NIC handshake without blocking ===");
        #1;
        check(net_ri == 1'b1, "net_ri should be 1 when input buffer is empty");

        router_send_to_nic(PKT_IN1);

        #1;
        check(net_ri == 1'b0, "After NIC receives packet, net_ri should go low");

        proc_read_reg(ADDR_IN_STATUS);
        check(d_out == 64'd1, "Input status should become 1 after packet reception");

        // --------------------------------------------------------
        // Case 3: Processor load when input buffer AVAILABLE
        // --------------------------------------------------------
        $display("\n=== Case 3: Processor load when input buffer available ===");
        proc_read_reg(ADDR_IN_BUF);
        check(d_out == PKT_IN1, "Processor should read received packet from input buffer");

        proc_read_reg(ADDR_IN_STATUS);
        check(d_out == 64'd0, "After reading input buffer, input status should clear to 0");
        check(net_ri == 1'b1, "After consuming input packet, net_ri should return to 1");

        // --------------------------------------------------------
        // Case 4: Processor load when input buffer UNAVAILABLE
        // --------------------------------------------------------
        $display("\n=== Case 4: Processor load when input buffer unavailable ===");
        proc_read_reg(ADDR_IN_STATUS);
        check(d_out == 64'd0, "Input status should be 0 when no packet is present");

        proc_read_reg(ADDR_IN_BUF);
        // spec says unsupported/empty behavior is not meaningful to software;
        // here we just verify status stays 0 and NIC remains ready
        proc_read_reg(ADDR_IN_STATUS);
        check(d_out == 64'd0, "Reading empty input buffer should not set input status");
        check(net_ri == 1'b1, "NIC should remain ready when input buffer is empty");

        // --------------------------------------------------------
        // Router -> NIC blocking behavior:
        // if input buffer already full, NIC should not be ready
        // --------------------------------------------------------
        $display("\n=== Router -> NIC blocking behavior ===");
        router_send_to_nic(PKT_IN2);
        proc_read_reg(ADDR_IN_STATUS);
        check(d_out == 64'd1, "Input status should be 1 after second packet arrives");
        check(net_ri == 1'b0, "NIC should not be ready when input buffer is full");

        // Try to send another packet while full; NIC should not accept it
        @(negedge clk);
        net_di = 64'h5555_6666_7777_8888;
        net_si = 1'b1;
        @(posedge clk);
        #1;
        @(negedge clk);
        net_si = 1'b0;
        net_di = 64'd0;

        // Read out current packet; should still be PKT_IN2
        proc_read_reg(ADDR_IN_BUF);
        check(d_out == PKT_IN2, "When NIC input buffer is full, new incoming packet should not overwrite existing one");

        proc_read_reg(ADDR_IN_STATUS);
        check(d_out == 64'd0, "After reading second packet, input status should clear");

        // --------------------------------------------------------
        // Finish
        // --------------------------------------------------------
        if (errors == 0) begin
            $display("\n==============================================");
            $display("All tb_cardinal_nic tests PASSED.");
            $display("==============================================");
        end else begin
            $display("\n==============================================");
            $display("tb_cardinal_nic completed with %0d error(s).", errors);
            $display("==============================================");
        end

        #20;
        $finish;
    end
    initial begin
		$sdf_annotate("./netlist/cardinal_nic_syn.sdf", dut,,"sdf.log","MAXIMUM","1.0:1.0:1.0", "FROM_MAXIMUM");	//http://www.pldworld.com/_hdl/2/_ref/se_html/manual_html/c_sdf10.html
		$enable_warnings;
		$log("ncsim.log");
	end

endmodule
