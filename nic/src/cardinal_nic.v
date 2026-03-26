//// Cardinal_NIC.v////

module cardinal_nic (
    input              clk,
    input              reset,

    // Processor side
    input      [1:0]   addr,
    input      [63:0]  d_in,
    output reg [63:0]  d_out,
    input              nicEn,
    input              nicWrEn,

    // Router side
    output             net_so,
    input              net_ro,
    output     [63:0]  net_do,

    input              net_si,
    output             net_ri,
    input      [63:0]  net_di,
    input              net_polarity
);

    // ------------------------------------------------------------
    // Internal registers
    // ------------------------------------------------------------
    reg [63:0] in_buf;          // network input channel buffer
    reg [63:0] out_buf;         // network output channel buffer
    reg        in_status;       // 1 = input buffer full,  0 = empty
    reg        out_status;      // 1 = output buffer full, 0 = empty

    // ------------------------------------------------------------
    // Address map
    // 2'b00 : input channel buffer
    // 2'b01 : input channel status register
    // 2'b10 : output channel buffer
    // 2'b11 : output channel status register
    // ------------------------------------------------------------
    localparam ADDR_IN_BUF     = 2'b00;
    localparam ADDR_IN_STATUS  = 2'b01;
    localparam ADDR_OUT_BUF    = 2'b10;
    localparam ADDR_OUT_STATUS = 2'b11;

    // ------------------------------------------------------------
    // VC polarity bit in packet
    // Router spec: packet[63] is the VC polarity bit
    // 0 = even VC, 1 = odd VC
    // ------------------------------------------------------------
    wire packet_vc_bit;
    assign packet_vc_bit = out_buf[63];

    // ------------------------------------------------------------
    // Router-side handshaking
    //
    // net_ri:
    //   Asserted when NIC input buffer is empty
    //
    // net_so:
    //   Asserted when NIC output buffer has a packet,
    //   router is ready, and current router polarity matches
    //   packet VC polarity
    // ------------------------------------------------------------
    assign net_ri = ~in_status;

    assign net_so = out_status && net_ro && (packet_vc_bit == net_polarity);
    assign net_do = out_buf;

    // ------------------------------------------------------------
    // Sequential logic
    // - synchronous reset
    // - processor read/write
    // - router receive/transmit side effects
    // ------------------------------------------------------------
    always @(posedge clk) begin
        if (reset) begin
            in_buf     <= 64'd0;
            out_buf    <= 64'd0;
            in_status  <= 1'b0;
            out_status <= 1'b0;
            d_out      <= 64'd0;
        end else begin
            // Default when NIC not enabled:
            // spec says d_out should assume 0 when nicEn is not asserted
            if (!nicEn) begin
                d_out <= 64'd0;
            end

            // ----------------------------------------------------
            // 1) Processor interface
            // ----------------------------------------------------

            // Write: only legal write is to output channel buffer
            if (nicEn && nicWrEn) begin
                if (addr == ADDR_OUT_BUF) begin
                    // Ignore store if output buffer already occupied
                    if (!out_status) begin
                        out_buf    <= d_in;
                        out_status <= 1'b1;
                    end
                end
                // all other writes are illegal -> ignore
            end

            // Read: synchronous read on next rising edge
            if (nicEn && !nicWrEn) begin
                case (addr)
                    ADDR_IN_BUF: begin
                        // Reading input buffer consumes the packet,
                        // making buffer available again.
                        d_out <= in_buf;
                        if (in_status) begin
                            in_status <= 1'b0;
                        end
                    end

                    ADDR_IN_STATUS: begin
                        d_out <= {63'd0, in_status};
                    end

                    ADDR_OUT_BUF: begin
                        // Processor read of output buffer is unsupported/illegal.
                        // Ignore by returning zero.
                        d_out <= 64'd0;
                    end

                    ADDR_OUT_STATUS: begin
                        d_out <= {63'd0, out_status};
                    end

                    default: begin
                        d_out <= 64'd0;
                    end
                endcase
            end

            // ----------------------------------------------------
            // 2) Router -> NIC receive path
            //    If net_si asserted and input buffer empty,
            //    latch packet into input buffer.
            // ----------------------------------------------------
            if (net_si && !in_status) begin
                in_buf    <= net_di;
                in_status <= 1'b1;
            end

            // ----------------------------------------------------
            // 3) NIC -> Router transmit completion
            //    If handshake succeeds this cycle, packet leaves NIC.
            // ----------------------------------------------------
            if (net_so) begin
                out_status <= 1'b0;
                // out_buf content may remain unchanged physically;
                // status bit determines validity.
            end
        end
    end

endmodule