`include "./include/gscl45nm.v"
`timescale 1ns/10ps

`define CYCLE_TIME 4

// Include Files
// Memory Files
//`include "./include/dmem.v"
//`include "./include/imem.v"

module tb_syn_cardinal_cpu;

reg clk, reset;
wire [0:31] inst_in;	// Instruction data
wire [0:31] pc_out;		// PC from where instruction should be fetched
wire [0:63] d_in ;		// Data input for the load word 
wire [0:31] addr_out;	// Which address memory should be written or read
wire memEn ;			// For Load word
wire memWrEn;			// For Store Word
wire [0:63] d_out ;		// Data out for the store word to be written in Memory

parameter clock_period = 4;

integer cycle_number;
integer i;
integer dmem_dump_file_1, dmem_dump_file_2, dmem_dump_file_3;

// FIX: Added program_started flag to prevent false termination at time 0
// when inst_in is 00000000 before any instructions have been fetched
reg program_started;

cardinal_cpu dut (clk, reset, inst_in, d_in, pc_out, addr_out, memEn, memWrEn, d_out);

imem Ins_Cache (
	.memAddr		(pc_out[22:29]),	// Only 8-bits are used in this project
	.dataOut		(inst_in)		// 32-bit  Instruction
	);

dmem DM_Cache (
	.clk 		(clk),				// System Clock
	.memEn		(memEn),			// data-memory enable (to avoid spurious reads)
	.memWrEn	(memWrEn),		// data-memory Write Enable
	.memAddr	(addr_out[24:31]),	// 8-bit Memory address
	.dataIn		(d_out),			// 64-bit data to data-memory
	.dataOut	(d_in)			// 64-bit data from data-memory
	);	

always #2 clk = ~clk;

// FIX: Track when a non-zero instruction has been fetched
// This prevents the wait condition from firing before the program starts
always @(posedge clk) begin
	if (reset)
		program_started <= 1'b0;
	else if (inst_in != 32'h00000000)
		program_started <= 1'b1;
end

initial	
	begin
		program_started = 0; // FIX: initialize program_started

		//Testing the imem_1 instructions which are already provided
		$readmemh("./testcase/imem_1.fill", Ins_Cache.MEM); 	// loading instruction memory into node0
		$readmemh("./testcase/dmem.fill", DM_Cache.MEM); 	// loading data memory into dmem		
		clk = 0;
		reset = 1;
		#(4*clock_period); reset = 0;
		// FIX: wait for program to start before checking for termination
		wait (program_started && inst_in == 32'h00000000);
		$display("The program completed in %d cycles", cycle_number);
		// Let us now flush the pipe line
		repeat(5) @(negedge clk);
		// Open file for output
		dmem_dump_file_1 = $fopen("./report/dmem_output_1.dump");
		// Let us now dump all the locations of the data memory now
		for (i=0; i<128; i=i+1) 
		begin
			$fdisplay(dmem_dump_file_1, "Memory location #%d : %h ", i, DM_Cache.MEM[i]);			
		end
		$fclose (dmem_dump_file_1);
		#(5*clock_period);

		//Testing custom file which has all the instructions
		$readmemh("./testcase/imem_2.fill", Ins_Cache.MEM); 	// loading instruction memory into node0
		$readmemh("./testcase/dmem.fill", DM_Cache.MEM); 	// loading data memory into dmem		
		reset = 1;
		program_started = 0; // FIX: reset program_started for next test
		#(4*clock_period); reset = 0;
		// FIX: wait for program to start before checking for termination
		wait (program_started && inst_in == 32'h00000000);
		$display("The program completed in %d cycles", cycle_number);
		// Let us now flush the pipe line
		repeat(5) @(negedge clk);
		// Open file for output
		dmem_dump_file_2 = $fopen("./report/dmem_output_2.dump");
		// Let us now dump all the locations of the data memory now
		for (i=0; i<128; i=i+1) 
		begin
			$fdisplay(dmem_dump_file_2, "Memory location #%d : %h ", i, DM_Cache.MEM[i]);			
		end
		$fclose (dmem_dump_file_2);
		#(5*clock_period);	

		//Testing Branch related instructions
		$readmemh("./testcase/imem_3.fill", Ins_Cache.MEM); 	// loading instruction memory into node0
		$readmemh("./testcase/dmem.fill", DM_Cache.MEM); 	// loading data memory into dmem		
		reset = 1;
		program_started = 0; // FIX: reset program_started for next test
		#(4*clock_period); reset = 0;
		// FIX: wait for program to start before checking for termination
		wait (program_started && inst_in == 32'h00000000);
		$display("The program completed in %d cycles", cycle_number);
		// Let us now flush the pipe line
		repeat(5) @(negedge clk);
		// Open file for output
		dmem_dump_file_3 = $fopen("./report/dmem_output_3.dump");
		// Let us now dump all the locations of the data memory now
		for (i=0; i<128; i=i+1) 
		begin
			$fdisplay(dmem_dump_file_3, "Memory location #%d : %h ", i, DM_Cache.MEM[i]);			
		end
		$fclose (dmem_dump_file_3);
		#(5*clock_period);
		$stop;
	end



//// ******************** Cycle Counter ******************** \\\\

always @ (posedge clk)
begin
	if (reset)
		cycle_number <= 0;
	else
		cycle_number <= cycle_number + 1;
end

initial begin
    #100000;
    $display("GLOBAL TIMEOUT");
    $finish;
end

initial begin
		$sdf_annotate("./netlist/tb_cardinal_cpu_syn.sdf", dut,,"sdf.log","MAXIMUM","1.0:1.0:1.0", "FROM_MAXIMUM");	//http://www.pldworld.com/_hdl/2/_ref/se_html/manual_html/c_sdf10.html
		$enable_warnings;
		$log("ncsim.log");
	end

endmodule
 `undef CYCLE_TIME