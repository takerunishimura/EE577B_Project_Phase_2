module gold_mesh(clk, reset,
                node00_pesi, node00_peri, node00_pedi, node00_peso, node00_pero, node00_pedo, node00_polarity,
                node01_pesi, node01_peri, node01_pedi, node01_peso, node01_pero, node01_pedo, node01_polarity,
                node02_pesi, node02_peri, node02_pedi, node02_peso, node02_pero, node02_pedo, node02_polarity,
                node03_pesi, node03_peri, node03_pedi, node03_peso, node03_pero, node03_pedo, node03_polarity,
                node10_pesi, node10_peri, node10_pedi, node10_peso, node10_pero, node10_pedo, node10_polarity,
                node11_pesi, node11_peri, node11_pedi, node11_peso, node11_pero, node11_pedo, node11_polarity,
                node12_pesi, node12_peri, node12_pedi, node12_peso, node12_pero, node12_pedo, node12_polarity,
                node13_pesi, node13_peri, node13_pedi, node13_peso, node13_pero, node13_pedo, node13_polarity,
                node20_pesi, node20_peri, node20_pedi, node20_peso, node20_pero, node20_pedo, node20_polarity,
                node21_pesi, node21_peri, node21_pedi, node21_peso, node21_pero, node21_pedo, node21_polarity,
                node22_pesi, node22_peri, node22_pedi, node22_peso, node22_pero, node22_pedo, node22_polarity,
                node23_pesi, node23_peri, node23_pedi, node23_peso, node23_pero, node23_pedo, node23_polarity,
                node30_pesi, node30_peri, node30_pedi, node30_peso, node30_pero, node30_pedo, node30_polarity,
                node31_pesi, node31_peri, node31_pedi, node31_peso, node31_pero, node31_pedo, node31_polarity,
                node32_pesi, node32_peri, node32_pedi, node32_peso, node32_pero, node32_pedo, node32_polarity,
                node33_pesi, node33_peri, node33_pedi, node33_peso, node33_pero, node33_pedo, node33_polarity);
input clk, reset;

// Node 00
input node00_pesi, node00_pero;
input [63:0] node00_pedi;
output node00_peri, node00_peso, node00_polarity;
output [63:0] node00_pedo;

// Node 01
input node01_pesi, node01_pero;
input [63:0] node01_pedi;
output node01_peri, node01_peso, node01_polarity;
output [63:0] node01_pedo;

// Node 02
input node02_pesi, node02_pero;
input [63:0] node02_pedi;
output node02_peri, node02_peso, node02_polarity;
output [63:0] node02_pedo;

// Node 03
input node03_pesi, node03_pero;
input [63:0] node03_pedi;
output node03_peri, node03_peso, node03_polarity;
output [63:0] node03_pedo;

// Node 10
input node10_pesi, node10_pero;
input [63:0] node10_pedi;
output node10_peri, node10_peso, node10_polarity;
output [63:0] node10_pedo;

// Node 11
input node11_pesi, node11_pero;
input [63:0] node11_pedi;
output node11_peri, node11_peso, node11_polarity;
output [63:0] node11_pedo;

// Node 12
input node12_pesi, node12_pero;
input [63:0] node12_pedi;
output node12_peri, node12_peso, node12_polarity;
output [63:0] node12_pedo;

// Node 13
input node13_pesi, node13_pero;
input [63:0] node13_pedi;
output node13_peri, node13_peso, node13_polarity;
output [63:0] node13_pedo;

// Node 20
input node20_pesi, node20_pero;
input [63:0] node20_pedi;
output node20_peri, node20_peso, node20_polarity;
output [63:0] node20_pedo;

// Node 21
input node21_pesi, node21_pero;
input [63:0] node21_pedi;
output node21_peri, node21_peso, node21_polarity;
output [63:0] node21_pedo;

// Node 22
input node22_pesi, node22_pero;
input [63:0] node22_pedi;
output node22_peri, node22_peso, node22_polarity;
output [63:0] node22_pedo;

// Node 23
input node23_pesi, node23_pero;
input [63:0] node23_pedi;
output node23_peri, node23_peso, node23_polarity;
output [63:0] node23_pedo;

// Node 30
input node30_pesi, node30_pero;
input [63:0] node30_pedi;
output node30_peri, node30_peso, node30_polarity;
output [63:0] node30_pedo;

// Node 31
input node31_pesi, node31_pero;
input [63:0] node31_pedi;
output node31_peri, node31_peso, node31_polarity;
output [63:0] node31_pedo;

// Node 32
input node32_pesi, node32_pero;
input [63:0] node32_pedi;
output node32_peri, node32_peso, node32_polarity;
output [63:0] node32_pedo;

// Node 33
input node33_pesi, node33_pero;
input [63:0] node33_pedi;
output node33_peri, node33_peso, node33_polarity;
output [63:0] node33_pedo;

// East-West connections (eastward: left to right)
wire ew_si_00_01, ew_ri_00_01; wire [63:0] ew_di_00_01; // node00 -> node01
wire ew_si_01_02, ew_ri_01_02; wire [63:0] ew_di_01_02; // node01 -> node02
wire ew_si_02_03, ew_ri_02_03; wire [63:0] ew_di_02_03; // node02 -> node03
wire ew_si_10_11, ew_ri_10_11; wire [63:0] ew_di_10_11; // node10 -> node11
wire ew_si_11_12, ew_ri_11_12; wire [63:0] ew_di_11_12; // node11 -> node12
wire ew_si_12_13, ew_ri_12_13; wire [63:0] ew_di_12_13; // node12 -> node13
wire ew_si_20_21, ew_ri_20_21; wire [63:0] ew_di_20_21; // node20 -> node21
wire ew_si_21_22, ew_ri_21_22; wire [63:0] ew_di_21_22; // node21 -> node22
wire ew_si_22_23, ew_ri_22_23; wire [63:0] ew_di_22_23; // node22 -> node23
wire ew_si_30_31, ew_ri_30_31; wire [63:0] ew_di_30_31; // node30 -> node31
wire ew_si_31_32, ew_ri_31_32; wire [63:0] ew_di_31_32; // node31 -> node32
wire ew_si_32_33, ew_ri_32_33; wire [63:0] ew_di_32_33; // node32 -> node33

// West-East connections (westward: right to left)
wire we_si_01_00, we_ri_01_00; wire [63:0] we_di_01_00; // node01 -> node00
wire we_si_02_01, we_ri_02_01; wire [63:0] we_di_02_01; // node02 -> node01
wire we_si_03_02, we_ri_03_02; wire [63:0] we_di_03_02; // node03 -> node02
wire we_si_11_10, we_ri_11_10; wire [63:0] we_di_11_10; // node11 -> node10
wire we_si_12_11, we_ri_12_11; wire [63:0] we_di_12_11; // node12 -> node11
wire we_si_13_12, we_ri_13_12; wire [63:0] we_di_13_12; // node13 -> node12
wire we_si_21_20, we_ri_21_20; wire [63:0] we_di_21_20; // node21 -> node20
wire we_si_22_21, we_ri_22_21; wire [63:0] we_di_22_21; // node22 -> node21
wire we_si_23_22, we_ri_23_22; wire [63:0] we_di_23_22; // node23 -> node22
wire we_si_31_30, we_ri_31_30; wire [63:0] we_di_31_30; // node31 -> node30
wire we_si_32_31, we_ri_32_31; wire [63:0] we_di_32_31; // node32 -> node31
wire we_si_33_32, we_ri_33_32; wire [63:0] we_di_33_32; // node33 -> node32

// North-South connections (southward: top to bottom)
wire ns_si_00_10, ns_ri_00_10; wire [63:0] ns_di_00_10; // node00 -> node10
wire ns_si_01_11, ns_ri_01_11; wire [63:0] ns_di_01_11; // node01 -> node11
wire ns_si_02_12, ns_ri_02_12; wire [63:0] ns_di_02_12; // node02 -> node12
wire ns_si_03_13, ns_ri_03_13; wire [63:0] ns_di_03_13; // node03 -> node13
wire ns_si_10_20, ns_ri_10_20; wire [63:0] ns_di_10_20; // node10 -> node20
wire ns_si_11_21, ns_ri_11_21; wire [63:0] ns_di_11_21; // node11 -> node21
wire ns_si_12_22, ns_ri_12_22; wire [63:0] ns_di_12_22; // node12 -> node22
wire ns_si_13_23, ns_ri_13_23; wire [63:0] ns_di_13_23; // node13 -> node23
wire ns_si_20_30, ns_ri_20_30; wire [63:0] ns_di_20_30; // node20 -> node30
wire ns_si_21_31, ns_ri_21_31; wire [63:0] ns_di_21_31; // node21 -> node31
wire ns_si_22_32, ns_ri_22_32; wire [63:0] ns_di_22_32; // node22 -> node32
wire ns_si_23_33, ns_ri_23_33; wire [63:0] ns_di_23_33; // node23 -> node33

// South-North connections (northward: bottom to top)
wire sn_si_10_00, sn_ri_10_00; wire [63:0] sn_di_10_00; // node10 -> node00
wire sn_si_11_01, sn_ri_11_01; wire [63:0] sn_di_11_01; // node11 -> node01
wire sn_si_12_02, sn_ri_12_02; wire [63:0] sn_di_12_02; // node12 -> node02
wire sn_si_13_03, sn_ri_13_03; wire [63:0] sn_di_13_03; // node13 -> node03
wire sn_si_20_10, sn_ri_20_10; wire [63:0] sn_di_20_10; // node20 -> node10
wire sn_si_21_11, sn_ri_21_11; wire [63:0] sn_di_21_11; // node21 -> node11
wire sn_si_22_12, sn_ri_22_12; wire [63:0] sn_di_22_12; // node22 -> node12
wire sn_si_23_13, sn_ri_23_13; wire [63:0] sn_di_23_13; // node23 -> node13
wire sn_si_30_20, sn_ri_30_20; wire [63:0] sn_di_30_20; // node30 -> node20
wire sn_si_31_21, sn_ri_31_21; wire [63:0] sn_di_31_21; // node31 -> node21
wire sn_si_32_22, sn_ri_32_22; wire [63:0] sn_di_32_22; // node32 -> node22
wire sn_si_33_23, sn_ri_33_23; wire [63:0] sn_di_33_23; // node33 -> node23

//========================================
// NIC not implemented in mesh in phase 1
//========================================
/* 
// NIC to router PE port connections (one per node)
wire nic_so_00, nic_ro_00; wire [63:0] nic_do_00; // NIC00 -> router00 PE input
wire nic_si_00, nic_ri_00; wire [63:0] nic_di_00; // router00 PE output -> NIC00
wire nic_polarity_00;                               // polarity for NIC00

wire nic_so_01, nic_ro_01; wire [63:0] nic_do_01;
wire nic_si_01, nic_ri_01; wire [63:0] nic_di_01;
wire nic_polarity_01;

wire nic_so_02, nic_ro_02; wire [63:0] nic_do_02;
wire nic_si_02, nic_ri_02; wire [63:0] nic_di_02;
wire nic_polarity_02;

wire nic_so_03, nic_ro_03; wire [63:0] nic_do_03;
wire nic_si_03, nic_ri_03; wire [63:0] nic_di_03;
wire nic_polarity_03;

wire nic_so_10, nic_ro_10; wire [63:0] nic_do_10;
wire nic_si_10, nic_ri_10; wire [63:0] nic_di_10;
wire nic_polarity_10;

wire nic_so_11, nic_ro_11; wire [63:0] nic_do_11;
wire nic_si_11, nic_ri_11; wire [63:0] nic_di_11;
wire nic_polarity_11;

wire nic_so_12, nic_ro_12; wire [63:0] nic_do_12;
wire nic_si_12, nic_ri_12; wire [63:0] nic_di_12;
wire nic_polarity_12;

wire nic_so_13, nic_ro_13; wire [63:0] nic_do_13;
wire nic_si_13, nic_ri_13; wire [63:0] nic_di_13;
wire nic_polarity_13;

wire nic_so_20, nic_ro_20; wire [63:0] nic_do_20;
wire nic_si_20, nic_ri_20; wire [63:0] nic_di_20;
wire nic_polarity_20;

wire nic_so_21, nic_ro_21; wire [63:0] nic_do_21;
wire nic_si_21, nic_ri_21; wire [63:0] nic_di_21;
wire nic_polarity_21;

wire nic_so_22, nic_ro_22; wire [63:0] nic_do_22;
wire nic_si_22, nic_ri_22; wire [63:0] nic_di_22;
wire nic_polarity_22;

wire nic_so_23, nic_ro_23; wire [63:0] nic_do_23;
wire nic_si_23, nic_ri_23; wire [63:0] nic_di_23;
wire nic_polarity_23;

wire nic_so_30, nic_ro_30; wire [63:0] nic_do_30;
wire nic_si_30, nic_ri_30; wire [63:0] nic_di_30;
wire nic_polarity_30;

wire nic_so_31, nic_ro_31; wire [63:0] nic_do_31;
wire nic_si_31, nic_ri_31; wire [63:0] nic_di_31;
wire nic_polarity_31;

wire nic_so_32, nic_ro_32; wire [63:0] nic_do_32;
wire nic_si_32, nic_ri_32; wire [63:0] nic_di_32;
wire nic_polarity_32;

wire nic_so_33, nic_ro_33; wire [63:0] nic_do_33;
wire nic_si_33, nic_ri_33; wire [63:0] nic_di_33;
wire nic_polarity_33;
*/

/*
cardinal_nic nic00 (
    .clk(clk),
    .reset(reset),
    // Processor side
    .addr(),
    .d_in(),
    .d_out(),
    .nicEn(),
    .nicWrEn(),
    // Router side
    .net_so(nic_so_00),
    .net_ro(nic_ro_00),
    .net_do(nic_do_00),
    .net_si(nic_si_00),
    .net_ri(nic_ri_00),
    .net_di(nic_di_00),
    .net_polarity(nic_polarity_00)
);
*/

//instantiations
//node00
gold_router router00 (
    .clk(clk),
    .reset(reset),
    .polarity(node00_polarity),
    // North - boundary
    .nsi(1'b0), .nri(), .ndi(64'd0),
    .nso(), .nro(1'b1), .ndo(),
    // South - connects to node10
    .ssi(sn_si_10_00), .sri(sn_ri_10_00), .sdi(sn_di_10_00),
    .sso(ns_si_00_10), .sro(ns_ri_00_10), .sdo(ns_di_00_10),
    // East - connects to node01
    .esi(we_si_01_00), .eri(we_ri_01_00), .edi(we_di_01_00),
    .eso(ew_si_00_01), .ero(ew_ri_00_01), .edo(ew_di_00_01),
    // West - boundary
    .wsi(1'b0), .wri(), .wdi(64'd0),
    .wso(), .wro(1'b1), .wdo(),
    // PE
    .pesi(node00_pesi), .peri(node00_peri), .pedi(node00_pedi),
    .peso(node00_peso), .pero(node00_pero), .pedo(node00_pedo)
);

//node01
gold_router router01 (
    .clk(clk),
    .reset(reset),
    .polarity(node01_polarity),
    // North - boundary
    .nsi(1'b0), .nri(), .ndi(64'd0),
    .nso(), .nro(1'b1), .ndo(),
    // South - connects to node11
    .ssi(sn_si_11_01), .sri(sn_ri_11_01), .sdi(sn_di_11_01),
    .sso(ns_si_01_11), .sro(ns_ri_01_11), .sdo(ns_di_01_11),
    // East - connects to node02
    .esi(we_si_02_01), .eri(we_ri_02_01), .edi(we_di_02_01),
    .eso(ew_si_01_02), .ero(ew_ri_01_02), .edo(ew_di_01_02),
    // West - connects to node00
    .wsi(ew_si_00_01), .wri(ew_ri_00_01), .wdi(ew_di_00_01),
    .wso(we_si_01_00), .wro(we_ri_01_00), .wdo(we_di_01_00),
    // PE
    .pesi(node01_pesi), .peri(node01_peri), .pedi(node01_pedi),
    .peso(node01_peso), .pero(node01_pero), .pedo(node01_pedo)
);

//node02
gold_router router02 (
    .clk(clk),
    .reset(reset),
    .polarity(node02_polarity),
    // North - boundary
    .nsi(1'b0), .nri(), .ndi(64'd0),
    .nso(), .nro(1'b1), .ndo(),
    // South - connects to node12
    .ssi(sn_si_12_02), .sri(sn_ri_12_02), .sdi(sn_di_12_02),
    .sso(ns_si_02_12), .sro(ns_ri_02_12), .sdo(ns_di_02_12),
    // East - connects to node03
    .esi(we_si_03_02), .eri(we_ri_03_02), .edi(we_di_03_02),
    .eso(ew_si_02_03), .ero(ew_ri_02_03), .edo(ew_di_02_03),
    // West - connects to node01
    .wsi(ew_si_01_02), .wri(ew_ri_01_02), .wdi(ew_di_01_02),
    .wso(we_si_02_01), .wro(we_ri_02_01), .wdo(we_di_02_01),
    // PE
    .pesi(node02_pesi), .peri(node02_peri), .pedi(node02_pedi),
    .peso(node02_peso), .pero(node02_pero), .pedo(node02_pedo)
);

//node03
gold_router router03 (
    .clk(clk),
    .reset(reset),
    .polarity(node03_polarity),
    // North - boundary
    .nsi(1'b0), .nri(), .ndi(64'd0),
    .nso(), .nro(1'b1), .ndo(),
    // South - connects to node13
    .ssi(sn_si_13_03), .sri(sn_ri_13_03), .sdi(sn_di_13_03),
    .sso(ns_si_03_13), .sro(ns_ri_03_13), .sdo(ns_di_03_13),
    // East - boundary
    .esi(1'b0), .eri(), .edi(64'd0),
    .eso(), .ero(1'b1), .edo(),
    // West - connects to node02
    .wsi(ew_si_02_03), .wri(ew_ri_02_03), .wdi(ew_di_02_03),
    .wso(we_si_03_02), .wro(we_ri_03_02), .wdo(we_di_03_02),
    // PE
    .pesi(node03_pesi), .peri(node03_peri), .pedi(node03_pedi),
    .peso(node03_peso), .pero(node03_pero), .pedo(node03_pedo)
);

//node10
gold_router router10 (
    .clk(clk),
    .reset(reset),
    .polarity(node10_polarity),
    // North - connects to node00
    .nsi(ns_si_00_10), .nri(ns_ri_00_10), .ndi(ns_di_00_10),
    .nso(sn_si_10_00), .nro(sn_ri_10_00), .ndo(sn_di_10_00),
    // South - connects to node20
    .ssi(sn_si_20_10), .sri(sn_ri_20_10), .sdi(sn_di_20_10),
    .sso(ns_si_10_20), .sro(ns_ri_10_20), .sdo(ns_di_10_20),
    // East - connects to node11
    .esi(we_si_11_10), .eri(we_ri_11_10), .edi(we_di_11_10),
    .eso(ew_si_10_11), .ero(ew_ri_10_11), .edo(ew_di_10_11),
    // West - boundary
    .wsi(1'b0), .wri(), .wdi(64'd0),
    .wso(), .wro(1'b1), .wdo(),
    // PE
    .pesi(node10_pesi), .peri(node10_peri), .pedi(node10_pedi),
    .peso(node10_peso), .pero(node10_pero), .pedo(node10_pedo)
);

//node11
gold_router router11 (
    .clk(clk),
    .reset(reset),
    .polarity(node11_polarity),
    // North - connects to node01
    .nsi(ns_si_01_11), .nri(ns_ri_01_11), .ndi(ns_di_01_11),
    .nso(sn_si_11_01), .nro(sn_ri_11_01), .ndo(sn_di_11_01),
    // South - connects to node21
    .ssi(sn_si_21_11), .sri(sn_ri_21_11), .sdi(sn_di_21_11),
    .sso(ns_si_11_21), .sro(ns_ri_11_21), .sdo(ns_di_11_21),
    // East - connects to node12
    .esi(we_si_12_11), .eri(we_ri_12_11), .edi(we_di_12_11),
    .eso(ew_si_11_12), .ero(ew_ri_11_12), .edo(ew_di_11_12),
    // West - connects to node10
    .wsi(ew_si_10_11), .wri(ew_ri_10_11), .wdi(ew_di_10_11),
    .wso(we_si_11_10), .wro(we_ri_11_10), .wdo(we_di_11_10),
    // PE
    .pesi(node11_pesi), .peri(node11_peri), .pedi(node11_pedi),
    .peso(node11_peso), .pero(node11_pero), .pedo(node11_pedo)
);

//node12
gold_router router12 (
    .clk(clk),
    .reset(reset),
    .polarity(node12_polarity),
    // North - connects to node02
    .nsi(ns_si_02_12), .nri(ns_ri_02_12), .ndi(ns_di_02_12),
    .nso(sn_si_12_02), .nro(sn_ri_12_02), .ndo(sn_di_12_02),
    // South - connects to node22
    .ssi(sn_si_22_12), .sri(sn_ri_22_12), .sdi(sn_di_22_12),
    .sso(ns_si_12_22), .sro(ns_ri_12_22), .sdo(ns_di_12_22),
    // East - connects to node13
    .esi(we_si_13_12), .eri(we_ri_13_12), .edi(we_di_13_12),
    .eso(ew_si_12_13), .ero(ew_ri_12_13), .edo(ew_di_12_13),
    // West - connects to node11
    .wsi(ew_si_11_12), .wri(ew_ri_11_12), .wdi(ew_di_11_12),
    .wso(we_si_12_11), .wro(we_ri_12_11), .wdo(we_di_12_11),
    // PE
    .pesi(node12_pesi), .peri(node12_peri), .pedi(node12_pedi),
    .peso(node12_peso), .pero(node12_pero), .pedo(node12_pedo)
);

//node13
gold_router router13 (
    .clk(clk),
    .reset(reset),
    .polarity(node13_polarity),
    // North - connects to node03
    .nsi(ns_si_03_13), .nri(ns_ri_03_13), .ndi(ns_di_03_13),
    .nso(sn_si_13_03), .nro(sn_ri_13_03), .ndo(sn_di_13_03),
    // South - connects to node23
    .ssi(sn_si_23_13), .sri(sn_ri_23_13), .sdi(sn_di_23_13),
    .sso(ns_si_13_23), .sro(ns_ri_13_23), .sdo(ns_di_13_23),
    // East - boundary
    .esi(1'b0), .eri(), .edi(64'd0),
    .eso(), .ero(1'b1), .edo(),
    // West - connects to node12
    .wsi(ew_si_12_13), .wri(ew_ri_12_13), .wdi(ew_di_12_13),
    .wso(we_si_13_12), .wro(we_ri_13_12), .wdo(we_di_13_12),
    // PE
    .pesi(node13_pesi), .peri(node13_peri), .pedi(node13_pedi),
    .peso(node13_peso), .pero(node13_pero), .pedo(node13_pedo)
);

//node20
gold_router router20 (
    .clk(clk),
    .reset(reset),
    .polarity(node20_polarity),
    // North - connects to node10
    .nsi(ns_si_10_20), .nri(ns_ri_10_20), .ndi(ns_di_10_20),
    .nso(sn_si_20_10), .nro(sn_ri_20_10), .ndo(sn_di_20_10),
    // South - connects to node30
    .ssi(sn_si_30_20), .sri(sn_ri_30_20), .sdi(sn_di_30_20),
    .sso(ns_si_20_30), .sro(ns_ri_20_30), .sdo(ns_di_20_30),
    // East - connects to node21
    .esi(we_si_21_20), .eri(we_ri_21_20), .edi(we_di_21_20),
    .eso(ew_si_20_21), .ero(ew_ri_20_21), .edo(ew_di_20_21),
    // West - boundary
    .wsi(1'b0), .wri(), .wdi(64'd0),
    .wso(), .wro(1'b1), .wdo(),
    // PE
    .pesi(node20_pesi), .peri(node20_peri), .pedi(node20_pedi),
    .peso(node20_peso), .pero(node20_pero), .pedo(node20_pedo)
);

//node21
gold_router router21 (
    .clk(clk),
    .reset(reset),
    .polarity(node21_polarity),
    // North - connects to node11
    .nsi(ns_si_11_21), .nri(ns_ri_11_21), .ndi(ns_di_11_21),
    .nso(sn_si_21_11), .nro(sn_ri_21_11), .ndo(sn_di_21_11),
    // South - connects to node31
    .ssi(sn_si_31_21), .sri(sn_ri_31_21), .sdi(sn_di_31_21),
    .sso(ns_si_21_31), .sro(ns_ri_21_31), .sdo(ns_di_21_31),
    // East - connects to node22
    .esi(we_si_22_21), .eri(we_ri_22_21), .edi(we_di_22_21),
    .eso(ew_si_21_22), .ero(ew_ri_21_22), .edo(ew_di_21_22),
    // West - connects to node20
    .wsi(ew_si_20_21), .wri(ew_ri_20_21), .wdi(ew_di_20_21),
    .wso(we_si_21_20), .wro(we_ri_21_20), .wdo(we_di_21_20),
    // PE
    .pesi(node21_pesi), .peri(node21_peri), .pedi(node21_pedi),
    .peso(node21_peso), .pero(node21_pero), .pedo(node21_pedo)
);

//node22
gold_router router22 (
    .clk(clk),
    .reset(reset),
    .polarity(node22_polarity),
    // North - connects to node12
    .nsi(ns_si_12_22), .nri(ns_ri_12_22), .ndi(ns_di_12_22),
    .nso(sn_si_22_12), .nro(sn_ri_22_12), .ndo(sn_di_22_12),
    // South - connects to node32
    .ssi(sn_si_32_22), .sri(sn_ri_32_22), .sdi(sn_di_32_22),
    .sso(ns_si_22_32), .sro(ns_ri_22_32), .sdo(ns_di_22_32),
    // East - connects to node23
    .esi(we_si_23_22), .eri(we_ri_23_22), .edi(we_di_23_22),
    .eso(ew_si_22_23), .ero(ew_ri_22_23), .edo(ew_di_22_23),
    // West - connects to node21
    .wsi(ew_si_21_22), .wri(ew_ri_21_22), .wdi(ew_di_21_22),
    .wso(we_si_22_21), .wro(we_ri_22_21), .wdo(we_di_22_21),
    // PE
    .pesi(node22_pesi), .peri(node22_peri), .pedi(node22_pedi),
    .peso(node22_peso), .pero(node22_pero), .pedo(node22_pedo)
);

//node23
gold_router router23 (
    .clk(clk),
    .reset(reset),
    .polarity(node23_polarity),
    // North - connects to node13
    .nsi(ns_si_13_23), .nri(ns_ri_13_23), .ndi(ns_di_13_23),
    .nso(sn_si_23_13), .nro(sn_ri_23_13), .ndo(sn_di_23_13),
    // South - connects to node33
    .ssi(sn_si_33_23), .sri(sn_ri_33_23), .sdi(sn_di_33_23),
    .sso(ns_si_23_33), .sro(ns_ri_23_33), .sdo(ns_di_23_33),
    // East - boundary
    .esi(1'b0), .eri(), .edi(64'd0),
    .eso(), .ero(1'b1), .edo(),
    // West - connects to node22
    .wsi(ew_si_22_23), .wri(ew_ri_22_23), .wdi(ew_di_22_23),
    .wso(we_si_23_22), .wro(we_ri_23_22), .wdo(we_di_23_22),
    // PE
    .pesi(node23_pesi), .peri(node23_peri), .pedi(node23_pedi),
    .peso(node23_peso), .pero(node23_pero), .pedo(node23_pedo)
);

//node30
gold_router router30 (
    .clk(clk),
    .reset(reset),
    .polarity(node30_polarity),
    // North - connects to node20
    .nsi(ns_si_20_30), .nri(ns_ri_20_30), .ndi(ns_di_20_30),
    .nso(sn_si_30_20), .nro(sn_ri_30_20), .ndo(sn_di_30_20),
    // South - boundary
    .ssi(1'b0), .sri(), .sdi(64'd0),
    .sso(), .sro(1'b1), .sdo(),
    // East - connects to node31
    .esi(we_si_31_30), .eri(we_ri_31_30), .edi(we_di_31_30),
    .eso(ew_si_30_31), .ero(ew_ri_30_31), .edo(ew_di_30_31),
    // West - boundary
    .wsi(1'b0), .wri(), .wdi(64'd0),
    .wso(), .wro(1'b1), .wdo(),
    // PE
    .pesi(node30_pesi), .peri(node30_peri), .pedi(node30_pedi),
    .peso(node30_peso), .pero(node30_pero), .pedo(node30_pedo)
);

//node31
gold_router router31 (
    .clk(clk),
    .reset(reset),
    .polarity(node31_polarity),
    // North - connects to node21
    .nsi(ns_si_21_31), .nri(ns_ri_21_31), .ndi(ns_di_21_31),
    .nso(sn_si_31_21), .nro(sn_ri_31_21), .ndo(sn_di_31_21),
    // South - boundary
    .ssi(1'b0), .sri(), .sdi(64'd0),
    .sso(), .sro(1'b1), .sdo(),
    // East - connects to node32
    .esi(we_si_32_31), .eri(we_ri_32_31), .edi(we_di_32_31),
    .eso(ew_si_31_32), .ero(ew_ri_31_32), .edo(ew_di_31_32),
    // West - connects to node30
    .wsi(ew_si_30_31), .wri(ew_ri_30_31), .wdi(ew_di_30_31),
    .wso(we_si_31_30), .wro(we_ri_31_30), .wdo(we_di_31_30),
    // PE
    .pesi(node31_pesi), .peri(node31_peri), .pedi(node31_pedi),
    .peso(node31_peso), .pero(node31_pero), .pedo(node31_pedo)
);

//node32
gold_router router32 (
    .clk(clk),
    .reset(reset),
    .polarity(node32_polarity),
    // North - connects to node22
    .nsi(ns_si_22_32), .nri(ns_ri_22_32), .ndi(ns_di_22_32),
    .nso(sn_si_32_22), .nro(sn_ri_32_22), .ndo(sn_di_32_22),
    // South - boundary
    .ssi(1'b0), .sri(), .sdi(64'd0),
    .sso(), .sro(1'b1), .sdo(),
    // East - connects to node33
    .esi(we_si_33_32), .eri(we_ri_33_32), .edi(we_di_33_32),
    .eso(ew_si_32_33), .ero(ew_ri_32_33), .edo(ew_di_32_33),
    // West - connects to node31
    .wsi(ew_si_31_32), .wri(ew_ri_31_32), .wdi(ew_di_31_32),
    .wso(we_si_32_31), .wro(we_ri_32_31), .wdo(we_di_32_31),
    // PE
    .pesi(node32_pesi), .peri(node32_peri), .pedi(node32_pedi),
    .peso(node32_peso), .pero(node32_pero), .pedo(node32_pedo)
);

//node33
gold_router router33 (
    .clk(clk),
    .reset(reset),
    .polarity(node33_polarity),
    // North - connects to node23
    .nsi(ns_si_23_33), .nri(ns_ri_23_33), .ndi(ns_di_23_33),
    .nso(sn_si_33_23), .nro(sn_ri_33_23), .ndo(sn_di_33_23),
    // South - boundary
    .ssi(1'b0), .sri(), .sdi(64'd0),
    .sso(), .sro(1'b1), .sdo(),
    // East - boundary
    .esi(1'b0), .eri(), .edi(64'd0),
    .eso(), .ero(1'b1), .edo(),
    // West - connects to node32
    .wsi(ew_si_32_33), .wri(ew_ri_32_33), .wdi(ew_di_32_33),
    .wso(we_si_33_32), .wro(we_ri_33_32), .wdo(we_di_33_32),
    // PE
    .pesi(node33_pesi), .peri(node33_peri), .pedi(node33_pedi),
    .peso(node33_peso), .pero(node33_pero), .pedo(node33_pedo)
);
endmodule