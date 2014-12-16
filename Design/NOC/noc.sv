`timescale 1ns/1ps 

// Including files from sub-blocks 

// Files for arbiter 
`include "NOC/arbiter/arbiter.sv"
`include "NOC/arbiter/rr_overall/rr_comparator/n_rr_comparator.sv" 
`include "NOC/arbiter/rr_overall/rr_comparator/s_rr_comparator.sv" 
`include "NOC/arbiter/rr_overall/rr_comparator/w_rr_comparator.sv" 
`include "NOC/arbiter/rr_overall/rr_comparator/e_rr_comparator.sv" 
`include "NOC/arbiter/rr_overall/rr_comparator/l_rr_comparator.sv" 
`include "NOC/arbiter/rr_overall/priorityencoder.sv" 
`include "NOC/arbiter/rr_overall/priorityencoder_to_mux.sv" 
`include "NOC/arbiter/rr_overall/mux_5to1.sv" 
`include "NOC/arbiter/rr_overall/mux_5to1_1bit.sv" 

`include "NOC/arbiter/rr_overall/rr_register/eff_rr_0001.sv" 
`include "NOC/arbiter/rr_overall/rr_register/rr_register_0001.sv" 
`include "NOC/arbiter/rr_overall/rr_register/eff_rr_0010.sv" 
`include "NOC/arbiter/rr_overall/rr_register/rr_register_0010.sv" 
`include "NOC/arbiter/rr_overall/rr_register/eff_rr_0100.sv" 
`include "NOC/arbiter/rr_overall/rr_register/rr_register_0100.sv" 
`include "NOC/arbiter/rr_overall/rr_register/eff_rr_1000.sv" 
`include "NOC/arbiter/rr_overall/rr_register/rr_register_1000.sv" 

`include "NOC/arbiter/rr_overall/n_rr_processor.sv" 
`include "NOC/arbiter/rr_overall/s_rr_processor.sv" 
`include "NOC/arbiter/rr_overall/w_rr_processor.sv" 
`include "NOC/arbiter/rr_overall/e_rr_processor.sv" 
`include "NOC/arbiter/rr_overall/l_rr_processor.sv" 

`include "NOC/arbiter/nexthop_register/enable_eff_nr.sv"
`include "NOC/arbiter/nexthop_register/nexthop_register.sv" 
`include "NOC/arbiter/yx_processor/yx_processor.sv" 

`include "NOC/arbiter/packet_tracker/packet_tracker.sv" 
`include "NOC/arbiter/packet_tracker/eff_pt.sv" 

// Files for input buffer 
`include "NOC/input_buffer/ram.sv"
`include "NOC/input_buffer/rw_pointer.sv"
`include "NOC/input_buffer/input_buffer.sv"
`include "NOC/input_buffer/mux_ram.sv"
`include "NOC/input_buffer/decoder_ram.sv"
`include "NOC/input_buffer/ff_ram.sv"
`include "NOC/input_buffer/eff_pointer.sv"

// Files for cross-bar switch 
`include "NOC/crossbar_switch/demux/cs_demux_1to5.sv"
`include "NOC/crossbar_switch/mux/cs_mux_5to1.sv"
`include "NOC/crossbar_switch/crossbar_switch_inner.sv"

// Files for credit-counter 

`include "NOC/credit_counter/eff_cc.sv"
`include "NOC/credit_counter/credit_counter.sv"

// This is the unit-router module for routers 

`include "NOC/unit_router/n_edge_router/n_edge_router.sv"
`include "NOC/unit_router/s_edge_router/s_edge_router.sv"
`include "NOC/unit_router/w_edge_router/w_edge_router.sv"
`include "NOC/unit_router/e_edge_router/e_edge_router.sv"
`include "NOC/unit_router/sw_corner_router/sw_corner_router.sv"
`include "NOC/unit_router/se_corner_router/se_corner_router.sv"
`include "NOC/unit_router/nw_corner_router/nw_corner_router.sv"
`include "NOC/unit_router/ne_corner_router/ne_corner_router.sv"
`include "NOC/unit_router/inner_router/inner_router.sv"

`include "NOC/eff_router_address.sv"

module noc (ifc.dut ifc);

// Connection for UP-DOWN direction 
// Data Interconnection for horizontal connection 

wire [15:0] data_00_01_0;
wire [15:0] data_01_02_0;
wire [15:0] data_02_03_0;

wire [15:0] data_10_11_0;
wire [15:0] data_11_12_0;
wire [15:0] data_12_13_0;

wire [15:0] data_20_21_0;
wire [15:0] data_21_22_0;
wire [15:0] data_22_23_0;

wire [15:0] data_30_31_0;
wire [15:0] data_31_32_0;
wire [15:0] data_32_33_0;

// Data Interconnection for vertical connection 

wire [15:0] data_00_10_0;
wire [15:0] data_10_20_0;
wire [15:0] data_20_30_0;

wire [15:0] data_01_11_0;
wire [15:0] data_11_21_0;
wire [15:0] data_21_31_0;

wire [15:0] data_02_12_0;
wire [15:0] data_12_22_0;
wire [15:0] data_22_32_0;

wire [15:0] data_03_13_0;
wire [15:0] data_13_23_0;
wire [15:0] data_23_33_0;

// Valid Interconnection for horizontal connection 

wire  valid_00_01_0;
wire  valid_01_02_0;
wire  valid_02_03_0;

wire  valid_10_11_0;
wire  valid_11_12_0;
wire  valid_12_13_0;

wire  valid_20_21_0;
wire  valid_21_22_0;
wire  valid_22_23_0;

wire  valid_30_31_0;
wire  valid_31_32_0;
wire  valid_32_33_0;

// Valid Interconnection for vertical connection 

wire  valid_00_10_0;
wire  valid_10_20_0;
wire  valid_20_30_0;

wire  valid_01_11_0;
wire  valid_11_21_0;
wire  valid_21_31_0;

wire  valid_02_12_0;
wire  valid_12_22_0;
wire  valid_22_32_0;

wire  valid_03_13_0;
wire  valid_13_23_0;
wire  valid_23_33_0;

// Credit Interconnection for horizontal connection 

wire  credit_00_01_0;
wire  credit_01_02_0;
wire  credit_02_03_0;

wire  credit_10_11_0;
wire  credit_11_12_0;
wire  credit_12_13_0;

wire  credit_20_21_0;
wire  credit_21_22_0;
wire  credit_22_23_0;

wire  credit_30_31_0;
wire  credit_31_32_0;
wire  credit_32_33_0;

// Credit Interconnection for vertical connection 

wire  credit_00_10_0;
wire  credit_10_20_0;
wire  credit_20_30_0;

wire  credit_01_11_0;
wire  credit_11_21_0;
wire  credit_21_31_0;

wire  credit_02_12_0;
wire  credit_12_22_0;
wire  credit_22_32_0;

wire  credit_03_13_0;
wire  credit_13_23_0;
wire  credit_23_33_0;

// Connection for DOWN-UP direction 

// Data Interconnection for horizontal connection 

wire [15:0] data_00_01_1;
wire [15:0] data_01_02_1;
wire [15:0] data_02_03_1;

wire [15:0] data_10_11_1;
wire [15:0] data_11_12_1;
wire [15:0] data_12_13_1;

wire [15:0] data_20_21_1;
wire [15:0] data_21_22_1;
wire [15:0] data_22_23_1;

wire [15:0] data_30_31_1;
wire [15:0] data_31_32_1;
wire [15:0] data_32_33_1;

// Data Interconnection for vertical connection 

wire [15:0] data_00_10_1;
wire [15:0] data_10_20_1;
wire [15:0] data_20_30_1;

wire [15:0] data_01_11_1;
wire [15:0] data_11_21_1;
wire [15:0] data_21_31_1;

wire [15:0] data_02_12_1;
wire [15:0] data_12_22_1;
wire [15:0] data_22_32_1;

wire [15:0] data_03_13_1;
wire [15:0] data_13_23_1;
wire [15:0] data_23_33_1;

// Valid Interconnection for horizontal connection 

wire  valid_00_01_1;
wire  valid_01_02_1;
wire  valid_02_03_1;

wire  valid_10_11_1;
wire  valid_11_12_1;
wire  valid_12_13_1;

wire  valid_20_21_1;
wire  valid_21_22_1;
wire  valid_22_23_1;

wire  valid_30_31_1;
wire  valid_31_32_1;
wire  valid_32_33_1;

// Valid Interconnection for vertical connection 

wire  valid_00_10_1;
wire  valid_10_20_1;
wire  valid_20_30_1;

wire  valid_01_11_1;
wire  valid_11_21_1;
wire  valid_21_31_1;

wire  valid_02_12_1;
wire  valid_12_22_1;
wire  valid_22_32_1;

wire  valid_03_13_1;
wire  valid_13_23_1;
wire  valid_23_33_1;

// Credit Interconnection for horizontal connection 

wire  credit_00_01_1;
wire  credit_01_02_1;
wire  credit_02_03_1;

wire  credit_10_11_1;
wire  credit_11_12_1;
wire  credit_12_13_1;

wire  credit_20_21_1;
wire  credit_21_22_1;
wire  credit_22_23_1;

wire  credit_30_31_1;
wire  credit_31_32_1;
wire  credit_32_33_1;

// Credit Interconnection for vertical connection 

wire  credit_00_10_1;
wire  credit_10_20_1;
wire  credit_20_30_1;

wire  credit_01_11_1;
wire  credit_11_21_1;
wire  credit_21_31_1;

wire  credit_02_12_1;
wire  credit_12_22_1;
wire  credit_22_32_1;

wire  credit_03_13_1;
wire  credit_13_23_1;
wire  credit_23_33_1;

logic [15:0] address_00_i; 
logic [15:0] address_01_i; 
logic [15:0] address_02_i; 
logic [15:0] address_03_i; 
logic [15:0] address_10_i; 
logic [15:0] address_11_i; 
logic [15:0] address_12_i; 
logic [15:0] address_13_i; 
logic [15:0] address_20_i; 
logic [15:0] address_21_i; 
logic [15:0] address_22_i; 
logic [15:0] address_23_i; 
logic [15:0] address_30_i; 
logic [15:0] address_31_i; 
logic [15:0] address_32_i; 
logic [15:0] address_33_i; 

logic [15:0] address_00_o; 
logic [15:0] address_01_o; 
logic [15:0] address_02_o; 
logic [15:0] address_03_o; 
logic [15:0] address_10_o; 
logic [15:0] address_11_o; 
logic [15:0] address_12_o; 
logic [15:0] address_13_o; 
logic [15:0] address_20_o; 
logic [15:0] address_21_o; 
logic [15:0] address_22_o; 
logic [15:0] address_23_o; 
logic [15:0] address_30_o; 
logic [15:0] address_31_o; 
logic [15:0] address_32_o; 
logic [15:0] address_33_o; 

always_comb begin 

address_00_i = 16'b0000000000000000; 
address_01_i = 16'b0000000000010000;
address_02_i = 16'b0000000000100000;
address_03_i = 16'b0000000000110000;
address_10_i = 16'b0000000000000001; 
address_11_i = 16'b0000000000010001;
address_12_i = 16'b0000000000100001;
address_13_i = 16'b0000000000110001;
address_20_i = 16'b0000000000000010; 
address_21_i = 16'b0000000000010010;
address_22_i = 16'b0000000000100010;
address_23_i = 16'b0000000000110010;
address_30_i = 16'b0000000000000011; 
address_31_i = 16'b0000000000010011;
address_32_i = 16'b0000000000100011;
address_33_i = 16'b0000000000110011;

end 

// Instantiate registers for router address 

eff_router_address #(.DATA_WIDTH(16)) eff_ra_00 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_00_o),
	.data_i(address_00_i)
	);

eff_router_address #(.DATA_WIDTH(16)) eff_ra_01 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_01_o),
	.data_i(address_01_i)
	);

eff_router_address #(.DATA_WIDTH(16)) eff_ra_02 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_02_o),
	.data_i(address_02_i)
	);
	
eff_router_address #(.DATA_WIDTH(16)) eff_ra_03 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_03_o),
	.data_i(address_03_i)
	);
	
eff_router_address #(.DATA_WIDTH(16)) eff_ra_10 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_10_o),
	.data_i(address_10_i)
	);

eff_router_address #(.DATA_WIDTH(16)) eff_ra_11 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_11_o),
	.data_i(address_11_i)
	);

eff_router_address #(.DATA_WIDTH(16)) eff_ra_12 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_12_o),
	.data_i(address_12_i)
	);
	
eff_router_address #(.DATA_WIDTH(16)) eff_ra_13 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_13_o),
	.data_i(address_03_i)
	);

eff_router_address #(.DATA_WIDTH(16)) eff_ra_20 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_20_o),
	.data_i(address_20_i)
	);

eff_router_address #(.DATA_WIDTH(16)) eff_ra_21 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_21_o),
	.data_i(address_21_i)
	);

eff_router_address #(.DATA_WIDTH(16)) eff_ra_22 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_22_o),
	.data_i(address_22_i)
	);
	
eff_router_address #(.DATA_WIDTH(16)) eff_ra_23 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_23_o),
	.data_i(address_23_i)
	);
	
eff_router_address #(.DATA_WIDTH(16)) eff_ra_30 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_30_o),
	.data_i(address_30_i)
	);

eff_router_address #(.DATA_WIDTH(16)) eff_ra_31 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_31_o),
	.data_i(address_31_i)
	);

eff_router_address #(.DATA_WIDTH(16)) eff_ra_32 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_32_o),
	.data_i(address_32_i)
	);
	
eff_router_address #(.DATA_WIDTH(16)) eff_ra_33 (
	
	.clk(clk),
	.reset(reset),
	.data_o(address_33_o),
	.data_i(address_33_i)
	);

// Corner router instances 

nw_corner_router router_00 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_00_o),
	.l_data_i(ifc.data_i[0][0]),
	.l_valid_i(ifc.valid_i[0][0]),
	.l_credit_i(ifc.credit_i[0][0]),
	.l_data_o(ifc.data_o[0][0]),
	.l_valid_o(ifc.valid_o[0][0]),
	.l_credit_o(ifc.credit_o[0][0]),
	.s_data_i (data_00_10_1),
	.s_valid_i (valid_00_10_1),
	.s_credit_i (credit_00_10_1),
	.s_data_o (data_00_10_0),
	.s_valid_o (valid_00_10_1),
	.s_credit_o (credit_00_10_1),
	
	.e_data_i (data_00_01_1),
	.e_valid_i (valid_00_01_1),
	.e_credit_i (credit_00_01_1),
	.e_data_o (data_00_01_0),
	.e_valid_o (valid_00_01_0),
	.e_credit_o	(credit_00_01_0)

); 

sw_corner_router router_30 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_30_o),
	.l_data_i(ifc.data_i[3][0]),
	.l_valid_i(ifc.valid_i[3][0]),
	.l_credit_i(ifc.credit_i[3][0]),
	.l_data_o(ifc.data_o[3][0]),
	.l_valid_o(ifc.valid_o[3][0]),
	.l_credit_o(ifc.credit_o[3][0]),
	
	.n_data_i (data_20_30_0),
	.n_valid_i (valid_20_30_0),
	.n_credit_i (credit_20_30_0),
	.n_data_o (data_20_30_1),
	.n_valid_o (valid_20_30_1),
	.n_credit_o (credit_20_30_1),
	
	.e_data_i (data_30_31_1),
	.e_valid_i (valid_30_31_1),
	.e_credit_i (credit_30_31_1),
	.e_data_o (data_30_31_0),
	.e_valid_o (valid_30_31_0),
	.e_credit_o	(credit_30_31_0)

); 

ne_corner_router router_03 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_03_o),
	.l_data_i(ifc.data_i[0][3]),
	.l_valid_i(ifc.valid_i[0][3]),
	.l_credit_i(ifc.credit_i[0][3]),
	.l_data_o(ifc.data_o[0][3]),
	.l_valid_o(ifc.valid_o[0][3]),
	.l_credit_o(ifc.credit_o[0][3]),
	
	.s_data_i (data_03_13_1),
	.s_valid_i (valid_03_13_1),
	.s_credit_i (credit_03_13_1),
	.s_data_o (data_03_13_0),
	.s_valid_o (valid_03_13_0),
	.s_credit_o (credit_03_13_0),
	
	.w_data_i (data_02_03_0),
	.w_valid_i (valid_02_03_0),
	.w_credit_i (credit_02_03_0),
	.w_data_o (data_02_03_1),
	.w_valid_o (valid_02_03_1),
	.w_credit_o	(credit_02_03_1)

); 

se_corner_router router_33 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_33_o),
	.l_data_i(ifc.data_i[3][3]),
	.l_valid_i(ifc.valid_i[3][3]),
	.l_credit_i(ifc.credit_i[3][3]),
	.l_data_o(ifc.data_o[3][3]),
	.l_valid_o(ifc.valid_o[3][3]),
	.l_credit_o(ifc.credit_o[3][3]),
	
	.n_data_i (data_23_33_0),
	.n_valid_i (valid_23_33_0),
	.n_credit_i (credit_23_33_0),
	.n_data_o (data_23_33_1),
	.n_valid_o (valid_23_33_0),
	.n_credit_o (credit_23_33_0),
	
	.w_data_i (data_32_33_0),
	.w_valid_i (valid_32_33_0),
	.w_credit_i (credit_32_33_0),
	.w_data_o (data_32_33_1),
	.w_valid_o (valid_32_33_1),
	.w_credit_o	(credit_32_33_1)

); 

// Edge router instances 

n_edge_router router_01 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_01_o),
	.l_data_i(ifc.data_i[0][1]),
	.l_valid_i(ifc.valid_i[0][1]),
	.l_credit_i(ifc.credit_i[0][1]),
	.l_data_o(ifc.data_o[0][1]),
	.l_valid_o(ifc.valid_o[0][1]),
	.l_credit_o(ifc.credit_o[0][1]),

	.s_data_i (data_01_11_1),
	.s_valid_i (valid_01_11_1),
	.s_credit_i (credit_01_11_1),
	.s_data_o (data_01_11_0),
	.s_valid_o (valid_01_11_0),
	.s_credit_o (credit_01_11_0),
	
	.w_data_i (data_00_01_0),
	.w_valid_i (valid_00_01_0),
	.w_credit_i (credit_00_01_0),
	.w_data_o (data_00_01_1),
	.w_valid_o (valid_00_01_1),
	.w_credit_o	(credit_00_01_1),
	
	.e_data_i (data_01_02_1),
	.e_valid_i (valid_01_02_1),
	.e_credit_i (credit_01_02_1),
	.e_data_o (data_01_02_0),
	.e_valid_o (valid_01_02_0),
	.e_credit_o	(credit_01_02_0)
	
); 

n_edge_router router_02 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_02_o),
	.l_data_i(ifc.data_i[0][2]),
	.l_valid_i(ifc.valid_i[0][2]),
	.l_credit_i(ifc.credit_i[0][2]),
	.l_data_o(ifc.data_o[0][2]),
	.l_valid_o(ifc.valid_o[0][2]),
	.l_credit_o(ifc.credit_o[0][2]),
	
	.s_data_i (data_02_12_1),
	.s_valid_i (valid_02_12_1),
	.s_credit_i (credit_02_12_1),
	.s_data_o (data_02_12_0),
	.s_valid_o (valid_02_12_0),
	.s_credit_o (credit_02_12_0),
	
	.w_data_i (data_01_02_0),
	.w_valid_i (valid_01_02_0),
	.w_credit_i (credit_01_02_0),
	.w_data_o (data_01_02_1),
	.w_valid_o (valid_01_02_1),
	.w_credit_o	(credit_01_02_1),
	
	.e_data_i (data_02_03_1),
	.e_valid_i (valid_02_03_1),
	.e_credit_i (credit_02_03_1),
	.e_data_o (data_02_03_0),
	.e_valid_o (valid_02_03_0),
	.e_credit_o	(credit_02_03_0)

); 

s_edge_router router_31 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_31_o),
	.l_data_i(ifc.data_i[3][1]),
	.l_valid_i(ifc.valid_i[3][1]),
	.l_credit_i(ifc.credit_i[3][1]),
	.l_data_o(ifc.data_o[3][1]),
	.l_valid_o(ifc.valid_o[3][1]),
	.l_credit_o(ifc.credit_o[3][1]),
	
	.n_data_i (data_21_31_0),
	.n_valid_i (valid_21_31_0),
	.n_credit_i (credit_21_31_0),
	.n_data_o (data_21_31_1),
	.n_valid_o (valid_21_31_1),
	.n_credit_o (credit_21_31_1),
	
	.w_data_i (data_30_31_0),
	.w_valid_i (valid_30_31_0),
	.w_credit_i (credit_30_31_0),
	.w_data_o (data_30_31_1),
	.w_valid_o (valid_30_31_1),
	.w_credit_o	(credit_30_31_1),
	
	.e_data_i (data_31_32_1),
	.e_valid_i (valid_31_32_1),
	.e_credit_i (credit_31_32_1),
	.e_data_o (data_31_32_0),
	.e_valid_o (valid_31_32_0),
	.e_credit_o	(credit_31_32_0)

); 

s_edge_router router_32 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_32_o),
	.l_data_i(ifc.data_i[3][2]),
	.l_valid_i(ifc.valid_i[3][2]),
	.l_credit_i(ifc.credit_i[3][2]),
	.l_data_o(ifc.data_o[3][2]),
	.l_valid_o(ifc.valid_o[3][2]),
	.l_credit_o(ifc.credit_o[3][2]),
	
	.n_data_i (data_22_32_0),
	.n_valid_i (valid_22_32_0),
	.n_credit_i (credit_22_32_0),
	.n_data_o (data_22_32_1),
	.n_valid_o (valid_22_32_1),
	.n_credit_o (credit_22_32_1),
	
	.w_data_i (data_31_32_0),
	.w_valid_i (valid_31_32_0),
	.w_credit_i (credit_31_32_0),
	.w_data_o (data_31_32_1),
	.w_valid_o (valid_31_32_1),
	.w_credit_o	(credit_31_32_1),
	
	.e_data_i (data_32_33_1),
	.e_valid_i (valid_32_33_1),
	.e_credit_i (credit_32_33_1),
	.e_data_o (data_32_33_0),
	.e_valid_o (valid_32_33_0),
	.e_credit_o	(credit_32_33_0)

); 

w_edge_router router_10 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_10_o),
	.l_data_i(ifc.data_i[1][0]),
	.l_valid_i(ifc.valid_i[1][0]),
	.l_credit_i(ifc.credit_i[1][0]),
	.l_data_o(ifc.data_o[1][0]),
	.l_valid_o(ifc.valid_o[1][0]),
	.l_credit_o(ifc.credit_o[1][0]),
	
	.n_data_i (data_00_10_0),
	.n_valid_i (valid_00_10_0),
	.n_credit_i (credit_00_10_0),
	.n_data_o (data_00_10_1),
	.n_valid_o (valid_00_10_1),
	.n_credit_o (credit_00_10_1),
	
	.s_data_i (data_10_20_1),
	.s_valid_i (valid_10_20_1),
	.s_credit_i (credit_10_20_1),
	.s_data_o (data_10_20_0),
	.s_valid_o (valid_10_20_0),
	.s_credit_o	(credit_10_20_0),
	
	.e_data_i (data_10_11_1),
	.e_valid_i (valid_10_11_1),
	.e_credit_i (credit_10_11_1),
	.e_data_o (data_10_11_0),
	.e_valid_o (valid_10_11_0),
	.e_credit_o	(credit_10_11_0)

); 

//

w_edge_router router_20 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_20_o),
	.l_data_i(ifc.data_i[2][0]),
	.l_valid_i(ifc.valid_i[2][0]),
	.l_credit_i(ifc.credit_i[2][0]),
	.l_data_o(ifc.data_o[2][0]),
	.l_valid_o(ifc.valid_o[2][0]),
	.l_credit_o(ifc.credit_o[2][0]),
	
	.n_data_i (data_10_20_0),
	.n_valid_i (valid_10_20_0),
	.n_credit_i (credit_10_20_0),
	.n_data_o (data_10_20_1),
	.n_valid_o (valid_10_20_1),
	.n_credit_o (credit_10_20_1),
	
	.s_data_i (data_20_30_1),
	.s_valid_i (valid_20_30_1),
	.s_credit_i (credit_20_30_1),
	.s_data_o (data_20_30_0),
	.s_valid_o (valid_20_30_0),
	.s_credit_o	(credit_20_30_0),
	
	.e_data_i (data_20_21_1),
	.e_valid_i (valid_20_21_1),
	.e_credit_i (credit_20_21_1),
	.e_data_o (data_20_21_0),
	.e_valid_o (valid_20_21_0),
	.e_credit_o	(credit_20_21_0)

); 

e_edge_router router_13 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_13_o),
	.l_data_i(ifc.data_i[1][3]),
	.l_valid_i(ifc.valid_i[1][3]),
	.l_credit_i(ifc.credit_i[1][3]),
	.l_data_o(ifc.data_o[1][3]),
	.l_valid_o(ifc.valid_o[1][3]),
	.l_credit_o(ifc.credit_o[1][3]),
	
	.n_data_i (data_03_13_0),
	.n_valid_i (valid_03_13_0),
	.n_credit_i (credit_03_13_0),
	.n_data_o (data_03_13_1),
	.n_valid_o (valid_03_13_1),
	.n_credit_o (credit_03_13_1),
	
	.s_data_i (data_13_23_1),
	.s_valid_i (valid_13_23_1),
	.s_credit_i (credit_13_23_1),
	.s_data_o (data_13_23_0),
	.s_valid_o (valid_13_23_0),
	.s_credit_o	(credit_13_23_0),
	
	.w_data_i (data_12_13_0),
	.w_valid_i (valid_12_13_0),
	.w_credit_i (credit_12_13_0),
	.w_data_o (data_12_13_1),
	.w_valid_o (valid_12_13_1),
	.w_credit_o	(credit_12_13_1)

); 

e_edge_router router_23 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_23_o),
	.l_data_i(ifc.data_i[2][3]),
	.l_valid_i(ifc.valid_i[2][3]),
	.l_credit_i(ifc.credit_i[2][3]),
	.l_data_o(ifc.data_o[2][3]),
	.l_valid_o(ifc.valid_o[2][3]),
	.l_credit_o(ifc.credit_o[2][3]),
	
	.n_data_i (data_13_23_0),
	.n_valid_i (valid_13_23_0),
	.n_credit_i (credit_13_23_0),
	.n_data_o (data_13_23_1),
	.n_valid_o (valid_13_23_1),
	.n_credit_o (credit_13_23_1),
	
	.s_data_i (data_23_33_1),
	.s_valid_i (valid_23_33_1),
	.s_credit_i (credit_23_33_1),
	.s_data_o (data_23_33_0),
	.s_valid_o (valid_23_33_0),
	.s_credit_o	(credit_23_33_0),
	
	.w_data_i (data_22_23_0),
	.w_valid_i (valid_22_23_0),
	.w_credit_i (credit_22_23_0),
	.w_data_o (data_22_23_1),
	.w_valid_o (valid_22_23_1),
	.w_credit_o	(credit_22_23_1)

); 



// Inner router instances 

inner_router router_11 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_11_o),
	.l_data_i(ifc.data_i[1][1]),
	.l_valid_i(ifc.valid_i[1][1]),
	.l_credit_i(ifc.credit_i[1][1]),
	.l_data_o(ifc.data_o[1][1]),
	.l_valid_o(ifc.valid_o[1][1]),
	.l_credit_o(ifc.credit_o[1][1]),
	
	.n_data_i (data_01_11_0),
	.n_valid_i (valid_01_11_0),
	.n_credit_i (credit_01_11_0),
	.n_data_o (data_01_11_1),
	.n_valid_o (valid_01_11_1),
	.n_credit_o (credit_01_11_1),
	
	.s_data_i (data_11_21_1),
	.s_valid_i (valid_11_21_1),
	.s_credit_i (credit_11_21_1),
	.s_data_o (data_11_21_0),
	.s_valid_o (valid_11_21_0),
	.s_credit_o	(credit_11_21_0),
	
	.w_data_i (data_10_11_0),
	.w_valid_i (valid_10_11_0),
	.w_credit_i (credit_10_11_0),
	.w_data_o (data_10_11_1),
	.w_valid_o (valid_10_11_1),
	.w_credit_o	(credit_10_11_1),
	
	.e_data_i (data_11_12_1),
	.e_valid_i (valid_11_12_1),
	.e_credit_i (credit_11_12_1),
	.e_data_o (data_11_12_0),
	.e_valid_o (valid_11_12_0),
	.e_credit_o	(credit_11_12_0)

); 

inner_router router_12 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_12_o),
	.l_data_i(ifc.data_i[1][2]),
	.l_valid_i(ifc.valid_i[1][2]),
	.l_credit_i(ifc.credit_i[1][2]),
	.l_data_o(ifc.data_o[1][2]),
	.l_valid_o(ifc.valid_o[1][2]),
	.l_credit_o(ifc.credit_o[1][2]),
	
	.n_data_i (data_02_12_0),
	.n_valid_i (valid_02_12_0),
	.n_credit_i (credit_02_12_0),
	.n_data_o (data_02_12_1),
	.n_valid_o (valid_02_12_1),
	.n_credit_o (credit_02_12_1),
	
	.s_data_i (data_12_22_1),
	.s_valid_i (valid_12_22_1),
	.s_credit_i (credit_12_22_1),
	.s_data_o (data_12_22_0),
	.s_valid_o (valid_12_22_0),
	.s_credit_o	(credit_12_22_0),
	
	.w_data_i (data_11_12_0),
	.w_valid_i (valid_11_12_0),
	.w_credit_i (credit_11_12_0),
	.w_data_o (data_11_12_1),
	.w_valid_o (valid_11_12_1),
	.w_credit_o	(credit_11_12_1),
	
	.e_data_i (data_12_13_1),
	.e_valid_i (valid_12_13_1),
	.e_credit_i (credit_12_13_1),
	.e_data_o (data_12_13_0),
	.e_valid_o (valid_12_13_0),
	.e_credit_o	(credit_12_13_0)

); 

inner_router router_21 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_21_o),
	.l_data_i(ifc.data_i[2][1]),
	.l_valid_i(ifc.valid_i[2][1]),
	.l_credit_i(ifc.credit_i[2][1]),
	.l_data_o(ifc.data_o[2][1]),
	.l_valid_o(ifc.valid_o[2][1]),
	.l_credit_o(ifc.credit_o[2][1]),
	
	.n_data_i (data_11_21_0),
	.n_valid_i (valid_11_21_0),
	.n_credit_i (credit_11_21_0),
	.n_data_o (data_11_21_1),
	.n_valid_o (valid_11_21_1),
	.n_credit_o (credit_11_21_1),
	
	.s_data_i (data_21_31_1),
	.s_valid_i (valid_21_31_1),
	.s_credit_i (credit_21_31_1),
	.s_data_o (data_21_31_0),
	.s_valid_o (valid_21_31_0),
	.s_credit_o	(credit_21_31_0),
	
	.w_data_i (data_20_21_0),
	.w_valid_i (valid_20_21_0),
	.w_credit_i (credit_20_21_0),
	.w_data_o (data_20_21_1),
	.w_valid_o (valid_20_21_1),
	.w_credit_o	(credit_20_21_1),
	
	.e_data_i (data_21_22_1),
	.e_valid_i (valid_21_22_1),
	.e_credit_i (credit_21_22_1),
	.e_data_o (data_21_22_0),
	.e_valid_o (valid_21_22_0),
	.e_credit_o	(credit_21_22_0)

); 

inner_router router_22 (
	
	.clk(ifc.clk),
	.reset(ifc.reset),
	.yx_addr_router_i (address_22_o),
	.l_data_i(ifc.data_i[2][2]),
	.l_valid_i(ifc.valid_i[2][2]),
	.l_credit_i(ifc.credit_i[2][2]),
	.l_data_o(ifc.data_o[2][2]),
	.l_valid_o(ifc.valid_o[2][2]),
	.l_credit_o(ifc.credit_o[2][2]),
	
	.n_data_i (data_12_22_0),
	.n_valid_i (valid_12_22_0),
	.n_credit_i (credit_12_22_0),
	.n_data_o (data_12_22_1),
	.n_valid_o (valid_12_22_1),
	.n_credit_o (credit_12_22_1),
	
	.s_data_i (data_22_32_1),
	.s_valid_i (valid_22_32_1),
	.s_credit_i (credit_22_32_1),
	.s_data_o (data_22_32_0),
	.s_valid_o (valid_22_32_0),
	.s_credit_o	(credit_22_32_0),
	
	.w_data_i (data_21_22_0),
	.w_valid_i (valid_21_22_0),
	.w_credit_i (credit_21_22_0),
	.w_data_o (data_21_22_1),
	.w_valid_o (valid_21_22_1),
	.w_credit_o	(credit_21_22_1),
	
	.e_data_i (data_22_23_1),
	.e_valid_i (valid_22_23_1),
	.e_credit_i (credit_22_23_1),
	.e_data_o (data_22_23_0),
	.e_valid_o (valid_22_23_0),
	.e_credit_o	(credit_22_23_0)

); 

endmodule
