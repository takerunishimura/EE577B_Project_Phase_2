module gold_router (nsi, nri, ndi, nso, nro, ndo,
                    ssi, sri, sdi, sso, sro, sdo,
                    esi, eri, edi, eso, ero, edo,
                    wsi, wri, wdi, wso, wro, wdo,
                    pesi, peri, pedi, peso, pero, pedo,
                    clk, reset, polarity
                    ); 
input clk, reset;             
input nsi, ssi, esi, wsi, pesi, nro, sro, ero, wro, pero;
input [63:0] ndi, sdi, edi, wdi, pedi;

output nri, sri, eri, wri, peri, nso, sso, eso, wso, peso, polarity;
output [63:0] ndo, sdo, edo, wdo, pedo;

reg polarity;

// forward wires
wire fwd_N2S, fwd_N2PE;  // from North input
wire fwd_S2N, fwd_S2PE;  // from South input
wire fwd_E2N, fwd_E2S, fwd_E2W, fwd_E2PE;  // from East input
wire fwd_W2N, fwd_W2S, fwd_W2E, fwd_W2PE;  // from West input
wire fwd_PE2N, fwd_PE2S, fwd_PE2E, fwd_PE2W; // from PE input

// dummy wires for unused forward outputs, in input_ctrl instantiation
wire unused_N_fwd_N, unused_N_fwd_E, unused_N_fwd_W;
wire unused_S_fwd_S, unused_S_fwd_E, unused_S_fwd_W;
wire unused_E_fwd_E;
wire unused_W_fwd_W;
wire unused_PE_fwd_PE;

// grant wires
wire gnt_N2S, gnt_N2E, gnt_N2W, gnt_N2PE;  // N output_ctrl
wire gnt_S2N, gnt_S2E, gnt_S2W, gnt_S2PE;  // S output_ctrl
wire gnt_E2W, gnt_E2PE;  // E output_ctrl
wire gnt_W2E, gnt_W2PE;  // W output_ctrl
wire gnt_PE2N, gnt_PE2S, gnt_PE2E, gnt_PE2W; // PE output_ctrl
wire [63:0] data_N, data_S, data_E, data_W, data_PE;

// dumy wires for unused grants, in output_ctrl instantiations
wire unused_N_gnt_N;
wire unused_S_gnt_S;
wire unused_E_gnt_N, unused_E_gnt_S, unused_E_gnt_E;
wire unused_W_gnt_N, unused_W_gnt_S, unused_W_gnt_W;
wire unused_PE_gnt_PE;

always @(posedge clk) begin
    if (reset)
        polarity <= 1'b0;
    else 
        polarity <= ~polarity;
end

input_ctrl north_ic (
    .clk(clk),
    .reset(reset),
    .send_in(nsi),
    .data_in(ndi),
    .grant_N(1'b0),
    .grant_S(gnt_S2N),
    .grant_E(1'b0),
    .grant_W(1'b0),
    .grant_PE(gnt_PE2N),
    .forward_N(unused_N_fwd_N),
    .forward_S(fwd_N2S),
    .forward_E(unused_N_fwd_E),
    .forward_W(unused_N_fwd_W),
    .forward_PE(fwd_N2PE),
    .ready_in(nri),
    .data_out(data_N),
    .polarity(polarity)
);

input_ctrl south_ic (
    .clk(clk),
    .reset(reset),
    .send_in(ssi),
    .data_in(sdi),
    .grant_N(gnt_N2S),
    .grant_S(1'b0),
    .grant_E(1'b0),
    .grant_W(1'b0),
    .grant_PE(gnt_PE2S),
    .forward_N(fwd_S2N),
    .forward_S(unused_S_fwd_S),
    .forward_E(unused_S_fwd_E),
    .forward_W(unused_S_fwd_W),
    .forward_PE(fwd_S2PE),
    .ready_in(sri),
    .data_out(data_S),
    .polarity(polarity)
);

input_ctrl east_ic (
    .clk(clk),
    .reset(reset),
    .send_in(esi),
    .data_in(edi),
    .grant_N(gnt_N2E),
    .grant_S(gnt_S2E),
    .grant_E(1'b0),
    .grant_W(gnt_W2E),
    .grant_PE(gnt_PE2E),
    .forward_N(fwd_E2N),
    .forward_S(fwd_E2S),
    .forward_E(unused_E_fwd_E),
    .forward_W(fwd_E2W),
    .forward_PE(fwd_E2PE),
    .ready_in(eri),
    .data_out(data_E),
    .polarity(polarity)
);

input_ctrl west_ic (
    .clk(clk),
    .reset(reset),
    .send_in(wsi),
    .data_in(wdi),
    .grant_N(gnt_N2W),
    .grant_S(gnt_S2W),
    .grant_E(gnt_E2W),
    .grant_W(1'b0),
    .grant_PE(gnt_PE2W),
    .forward_N(fwd_W2N),
    .forward_S(fwd_W2S),
    .forward_E(fwd_W2E),
    .forward_W(unused_W_fwd_W),
    .forward_PE(fwd_W2PE),
    .ready_in(wri),
    .data_out(data_W),
    .polarity(polarity)
);

input_ctrl pe_ic (
    .clk(clk),
    .reset(reset),
    .send_in(pesi),
    .data_in(pedi),
    .grant_N(gnt_N2PE),
    .grant_S(gnt_S2PE),
    .grant_E(gnt_E2PE),
    .grant_W(gnt_W2PE),
    .grant_PE(1'b0),
    .forward_N(fwd_PE2N),
    .forward_S(fwd_PE2S),
    .forward_E(fwd_PE2E),
    .forward_W(fwd_PE2W),
    .forward_PE(unused_PE_fwd_PE),
    .ready_in(peri),
    .data_out(data_PE),
    .polarity(polarity)
);

output_ctrl north_oc(
    .clk(clk),
    .reset(reset),
    .data_N(64'd0),
    .data_S(data_S),
    .data_E(data_E),
    .data_W(data_W),
    .data_PE(data_PE),
    .polarity(polarity),
    .forward_N(1'b0),
    .forward_S(fwd_S2N),
    .forward_E(fwd_E2N),
    .forward_W(fwd_W2N),
    .forward_PE(fwd_PE2N),
    .ready_out(nro),
    .grant_N(unused_N_gnt_N),
    .grant_S(gnt_N2S),
    .grant_E(gnt_N2E),
    .grant_W(gnt_N2W),
    .grant_PE(gnt_N2PE),
    .data_out(ndo),
    .send_out(nso)
);

output_ctrl south_oc(
    .clk(clk),
    .reset(reset),
    .data_N(data_N),
    .data_S(64'd0),
    .data_E(data_E),
    .data_W(data_W),
    .data_PE(data_PE),
    .polarity(polarity),
    .forward_N(fwd_N2S),
    .forward_S(1'b0),
    .forward_E(fwd_E2S),
    .forward_W(fwd_W2S),
    .forward_PE(fwd_PE2S),
    .ready_out(sro),
    .grant_N(gnt_S2N),
    .grant_S(unused_S_gnt_S),
    .grant_E(gnt_S2E),
    .grant_W(gnt_S2W),
    .grant_PE(gnt_S2PE),
    .data_out(sdo),
    .send_out(sso)
);

output_ctrl east_oc(
    .clk(clk),
    .reset(reset),
    .data_N(64'd0),
    .data_S(64'd0),
    .data_E(64'd0),
    .data_W(data_W),
    .data_PE(data_PE),
    .polarity(polarity),
    .forward_N(1'b0),
    .forward_S(1'b0),
    .forward_E(1'b0),
    .forward_W(fwd_W2E),
    .forward_PE(fwd_PE2E),
    .ready_out(ero),
    .grant_N(unused_E_gnt_N),
    .grant_S(unused_E_gnt_S),
    .grant_E(unused_E_gnt_E),
    .grant_W(gnt_E2W),
    .grant_PE(gnt_E2PE),
    .data_out(edo),
    .send_out(eso)
);

output_ctrl west_oc(
    .clk(clk),
    .reset(reset),
    .data_N(64'd0),
    .data_S(64'd0),
    .data_E(data_E),
    .data_W(64'd0),
    .data_PE(data_PE),
    .polarity(polarity),
    .forward_N(1'b0),
    .forward_S(1'b0),
    .forward_E(fwd_E2W),
    .forward_W(1'b0),
    .forward_PE(fwd_PE2W),
    .ready_out(wro),
    .grant_N(unused_W_gnt_N),
    .grant_S(unused_W_gnt_S),
    .grant_E(gnt_W2E),
    .grant_W(unused_W_gnt_W),
    .grant_PE(gnt_W2PE),
    .data_out(wdo),
    .send_out(wso)
);

output_ctrl pe_oc(
    .clk(clk),
    .reset(reset),
    .data_N(data_N),
    .data_S(data_S),
    .data_E(data_E),
    .data_W(data_W),
    .data_PE(64'd0),
    .polarity(polarity),
    .forward_N(fwd_N2PE),
    .forward_S(fwd_S2PE),
    .forward_E(fwd_E2PE),
    .forward_W(fwd_W2PE),
    .forward_PE(1'b0),
    .ready_out(pero),
    .grant_N(gnt_PE2N),
    .grant_S(gnt_PE2S),
    .grant_E(gnt_PE2E),
    .grant_W(gnt_PE2W),
    .grant_PE(unused_PE_gnt_PE),
    .data_out(pedo),
    .send_out(peso)
);

endmodule