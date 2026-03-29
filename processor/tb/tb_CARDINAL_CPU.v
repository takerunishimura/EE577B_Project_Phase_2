///// Test Bench for CARDINAL_CPU   /////// 

`timescale 1ns/10ps

module tb_cardinal_cpu;

    // ------------------------------------------------------------
    // Project-required cycle time: 4ns
    // ------------------------------------------------------------
    parameter CYCLE_TIME      = 4;
    parameter MAX_CYCLES      = 300;
    parameter LOAD_IMEM_FILL  = 1;
    parameter LOAD_DMEM_FILL  = 1;

    reg         clk;
    reg         reset;

    wire [0:31] inst_in;
    wire [0:31] pc_out;
    wire [0:63] d_in;
    wire [0:31] addr_out;
    wire        memEn;
    wire        memWrEn;
    wire [0:63] d_out;

    integer cycle_number;
    integer i;
    integer dmem_dump_file;
    reg     timed_out;
    reg     program_started;

    // ------------------------------------------------------------
    // DUT
    // ------------------------------------------------------------
    cardinal_cpu dut (
        .clk     (clk),
        .reset   (reset),
        .inst_in (inst_in),
        .d_in    (d_in),
        .pc_out  (pc_out),
        .addr_out(addr_out),
        .memEn   (memEn),
        .memWrEn (memWrEn),
        .d_out   (d_out)
    );

    // ------------------------------------------------------------
    // Memory models provided by the course
    // ------------------------------------------------------------
    imem Ins_Cache (
        .memAddr (pc_out[22:29]),
        .dataOut (inst_in)
    );

    dmem DM_Cache (
        .clk     (clk),
        .memEn   (memEn),
        .memWrEn (memWrEn),
        .memAddr (addr_out[24:31]),
        .dataIn  (d_out),
        .dataOut (d_in)
    );

    // ------------------------------------------------------------
    // Clock generation
    // ------------------------------------------------------------
    always #(CYCLE_TIME/2) clk = ~clk;

    // ------------------------------------------------------------
    // Cycle counter
    // ------------------------------------------------------------
    always @(posedge clk) begin
        if (reset)
            cycle_number <= 0;
        else
            cycle_number <= cycle_number + 1;
    end

    // ------------------------------------------------------------
    // Track whether a non-zero instruction has ever been fetched.
    // This avoids falsely declaring "program complete" at time 0
    // when instruction memory is empty.
    // ------------------------------------------------------------
    always @(posedge clk) begin
        if (reset)
            program_started <= 1'b0;
        else if (inst_in != 32'h00000000)
            program_started <= 1'b1;
    end

    // ------------------------------------------------------------
    // Runtime monitor for debugging
    // ------------------------------------------------------------
    always @(posedge clk) begin
        if (!reset) begin
            $display("[TB] cycle=%0d pc=%h inst=%h memEn=%b memWrEn=%b addr=%h d_out=%h d_in=%h",
                     cycle_number, pc_out, inst_in, memEn, memWrEn, addr_out, d_out, d_in);
        end
    end

    // ------------------------------------------------------------
    // Timeout protection
    // ------------------------------------------------------------
    initial begin
        timed_out = 1'b0;
        wait (!reset);
        repeat (MAX_CYCLES) @(posedge clk);
        timed_out = 1'b1;
        $display("[TB][ERROR] Timeout after %0d cycles.", MAX_CYCLES);

        dmem_dump_file = $fopen("./dmem_timeout.dump", "w");
        for (i = 0; i < 128; i = i + 1)
            $fdisplay(dmem_dump_file, "Memory[%0d] = %h", i, DM_Cache.MEM[i]);
        $fclose(dmem_dump_file);

        $stop;
    end

    // ------------------------------------------------------------
    // Main sequence
    // ------------------------------------------------------------
    initial begin
        clk            = 1'b0;
        reset          = 1'b1;
        cycle_number   = 0;
        program_started= 1'b0;

        // Initialize memories to zero so the TB still works even
        // if you decide not to use .fill files yet.
        for (i = 0; i < 256; i = i + 1) begin
            Ins_Cache.MEM[i] = 32'h00000000;
            DM_Cache.MEM[i]  = 64'h0000000000000000;
        end

        // Optional file loading
        // Keep the files in the same directory as the simulation run,
        // or change these paths as needed.
        if (LOAD_IMEM_FILL)
            $readmemh("./imem_1.fill", Ins_Cache.MEM);

        if (LOAD_DMEM_FILL)
            $readmemh("./dmem.fill", DM_Cache.MEM);

        // Apply synchronous active-high reset
        repeat (4) @(posedge clk);
        reset = 1'b0;

        // If a program was loaded, wait until it finishes.
        // "Finish" is defined as: after at least one non-zero
        // instruction has been seen, the fetched instruction becomes 0.
        if (LOAD_IMEM_FILL) begin
            wait (program_started && (inst_in == 32'h00000000 || timed_out));

            if (!timed_out) begin
                $display("[TB] Program completed in %0d cycles.", cycle_number);

                // Let pipeline drain a little
                repeat (5) @(posedge clk);

                dmem_dump_file = $fopen("./dmem_output.dump", "w");
                for (i = 0; i < 128; i = i + 1)
                    $fdisplay(dmem_dump_file, "Memory[%0d] = %h", i, DM_Cache.MEM[i]);
                $fclose(dmem_dump_file);

                $display("[TB] Data memory dumped to ./dmem_output.dump");
                $stop;
            end
        end
        else begin
            // No program file: just do a reset/clock smoke test.
            repeat (20) @(posedge clk);
            $display("[TB] Smoke test complete (no imem.fill loaded).");
            $stop;
        end
    end

endmodule