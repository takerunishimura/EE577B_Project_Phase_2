module reg_file (
    input              clk,
    input              reset,

    // Read port 1
    input      [0:4]   rdAddr1,
    output     [0:63]  rdData1,
    
    // Read port 2
    input      [0:4]   rdAddr2,
    output     [0:63]  rdData2,

    // Write port
    input      [0:4]   wrAddr,
    input      [0:63]  wrData,
    input              wrEn
);
    reg [0:63] regfile [0:31];
    integer i;

    // -----------------------------
    // Synchronous reset and write
    // -----------------------------
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                regfile[i] <= 64'd0;
            end
        end else begin
            if (wrEn && (wrAddr != 5'd0)) begin
                regfile[wrAddr] <= wrData;
            end
        end
    end

    // -----------------------------
    // Asynchronous read ports
    // -----------------------------
    assign rdData1 = (rdAddr1 == 5'd0) ? 64'd0 : regfile[rdAddr1];
    assign rdData2 = (rdAddr2 == 5'd0) ? 64'd0 : regfile[rdAddr2];
    
endmodule