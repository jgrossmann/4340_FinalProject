// Including files from sub-blocks 

// Files for arbiter 
/*
`include "../.././arbiter/arbiter.sv"
`include "../.././arbiter/rr_overall/rr_comparator/n_rr_comparator.sv" 
`include "../.././arbiter/rr_overall/rr_comparator/s_rr_comparator.sv" 
`include "../.././arbiter/rr_overall/rr_comparator/w_rr_comparator.sv" 
`include "../.././arbiter/rr_overall/rr_comparator/e_rr_comparator.sv" 
`include "../.././arbiter/rr_overall/rr_comparator/l_rr_comparator.sv" 
`include "../.././arbiter/rr_overall/priorityencoder.sv" 
`include "../.././arbiter/rr_overall/priorityencoder_to_mux.sv" 
`include "../.././arbiter/rr_overall/mux_5to1.sv" 
`include "../.././arbiter/rr_overall/mux_5to1_1bit.sv" 

`include "../.././arbiter/rr_overall/rr_register/eff_rr_0001.sv" 
`include "../.././arbiter/rr_overall/rr_register/rr_register_0001.sv" 
`include "../.././arbiter/rr_overall/rr_register/eff_rr_0010.sv" 
`include "../.././arbiter/rr_overall/rr_register/rr_register_0010.sv" 
`include "../.././arbiter/rr_overall/rr_register/eff_rr_0100.sv" 
`include "../.././arbiter/rr_overall/rr_register/rr_register_0100.sv" 
`include "../.././arbiter/rr_overall/rr_register/eff_rr_1000.sv" 
`include "../.././arbiter/rr_overall/rr_register/rr_register_1000.sv" 

`include "../.././arbiter/rr_overall/n_rr_processor.sv" 
`include "../.././arbiter/rr_overall/s_rr_processor.sv" 
`include "../.././arbiter/rr_overall/w_rr_processor.sv" 
`include "../.././arbiter/rr_overall/e_rr_processor.sv" 
`include "../.././arbiter/rr_overall/l_rr_processor.sv" 

`include "../.././arbiter/nexthop_register/enable_eff_nr.sv"
`include "../.././arbiter/nexthop_register/nexthop_register.sv" 
`include "../.././arbiter/yx_processor/yx_processor.sv" 

`include "../.././arbiter/packet_tracker/packet_tracker.sv" 
`include "../.././arbiter/packet_tracker/eff_pt.sv" 

// Files for input buffer 
`include "../.././input_buffer/ram.sv"
`include "../.././input_buffer/rw_pointer.sv"
`include "../.././input_buffer/input_buffer.sv"
`include "../.././input_buffer/mux_ram.sv"
`include "../.././input_buffer/decoder_ram.sv"
`include "../.././input_buffer/ff_ram.sv"
`include "../.././input_buffer/eff_pointer.sv"

// Files for cross-bar switch 
`include "../.././crossbar_switch/demux/cs_demux_1to5.sv"
`include "../.././crossbar_switch/mux/cs_mux_5to1.sv"
`include "../.././crossbar_switch/crossbar_switch_inner.sv"

// Files for credit-counter 

`include "../.././credit_counter/eff_cc.sv"
`include "../.././credit_counter/credit_counter.sv"
*/
// This is the unit-router module for inner router 

module s_edge_router
(
	input [15 : 0] n_data_i,
	input [15 : 0] e_data_i,
	input [15 : 0] w_data_i,
	input [15 : 0] l_data_i,
	input [15:0] yx_addr_router_i,
	input n_valid_i,
	input e_valid_i,
	input w_valid_i,
	input l_valid_i,
	input n_credit_i,
	input e_credit_i,
	input w_credit_i,
	input l_credit_i,
	output [15 : 0] n_data_o,
	output [15 : 0] e_data_o,
	output [15 : 0] w_data_o,
	output [15 : 0] l_data_o,
	output n_valid_o,
	output e_valid_o,
	output w_valid_o,
	output l_valid_o,
	output n_credit_o,
	output e_credit_o,
	output w_credit_o,
	output l_credit_o,
	input clk,
	input reset
);

// Setting temporary variables for output 
logic n_valid_o_temp; 
logic w_valid_o_temp; 
logic e_valid_o_temp; 
logic l_valid_o_temp;

logic n_credit_o_temp; 
logic w_credit_o_temp; 
logic e_credit_o_temp; 
logic l_credit_o_temp; 

logic [15:0] n_data_o_temp; 
logic [15:0] s_data_o_temp; 
logic [15:0] w_data_o_temp; 
logic [15:0] e_data_o_temp; 
logic [15:0] l_data_o_temp; 

logic [2:0] demux_select_temp_n;
logic [2:0] demux_select_temp_s; 
logic [2:0] demux_select_temp_w; 
logic [2:0] demux_select_temp_e; 
logic [2:0] demux_select_temp_l; 

logic [2:0] mux_select_temp_n;
logic [2:0] mux_select_temp_s; 
logic [2:0] mux_select_temp_w; 
logic [2:0] mux_select_temp_e; 
logic [2:0] mux_select_temp_l;

logic [15:0] ib_data_o_temp_n;  
logic [15:0] ib_data_o_temp_s;  
logic [15:0] ib_data_o_temp_w;  
logic [15:0] ib_data_o_temp_e;  
logic [15:0] ib_data_o_temp_l;  

logic ib_read_i_temp_n;
logic ib_read_i_temp_s; 
logic ib_read_i_temp_w; 
logic ib_read_i_temp_e; 
logic ib_read_i_temp_l;  

logic ib_valid_o_temp_n; 
logic ib_valid_o_temp_s; 
logic ib_valid_o_temp_w; 
logic ib_valid_o_temp_e; 
logic ib_valid_o_temp_l; 

logic ib_buf_empty_n; 
logic ib_buf_empty_s; 
logic ib_buf_empty_w; 
logic ib_buf_empty_e; 
logic ib_buf_empty_l;

logic cc_credit_n_i_temp; 
logic cc_credit_s_i_temp; 
logic cc_credit_w_i_temp; 
logic cc_credit_e_i_temp; 
logic cc_credit_l_i_temp; 

logic [2:0] ib_buf_ram_raddr_o_temp_n;
logic [2:0] ib_buf_ram_raddr_o_temp_s; 
logic [2:0] ib_buf_ram_raddr_o_temp_w; 
logic [2:0] ib_buf_ram_raddr_o_temp_e; 
logic [2:0] ib_buf_ram_raddr_o_temp_l; 

logic [2:0] ib_buf_ram_waddr_o_temp_n;
logic [2:0] ib_buf_ram_waddr_o_temp_s; 
logic [2:0] ib_buf_ram_waddr_o_temp_w; 
logic [2:0] ib_buf_ram_waddr_o_temp_e; 
logic [2:0] ib_buf_ram_waddr_o_temp_l; 
 
// Input buffer instantiation
input_buffer ib_n (

      .clk(clk),
	  .reset(reset), 
      .buf_data_i(n_data_i),
      .buf_write_i(n_valid_i),
      .buf_read_i(ib_read_i_temp_n), 
      .buf_empty_o(ib_buf_empty_n),
      .buf_valid_o(ib_valid_o_temp_n), 
      .buf_data_o(ib_data_o_temp_n),
	  
	  // These are for debugging purpose, not actually going to use them anywhere
      .buf_ram_raddr_o(ib_buf_ram_raddr_o_temp_n),
      .buf_ram_waddr_o(ib_buf_ram_waddr_o_temp_n)

);

input_buffer ib_w (

      .clk(clk),
	  .reset(reset), 
      .buf_data_i(w_data_i),
      .buf_write_i(w_valid_i),
      .buf_read_i(ib_read_i_temp_w), 
      .buf_empty_o(ib_buf_empty_w),
      .buf_valid_o(ib_valid_o_temp_w), 
      .buf_data_o(ib_data_o_temp_w),
	  
	  // These are for debugging purpose, not actually going to use them anywhere
      .buf_ram_raddr_o(ib_buf_ram_raddr_o_temp_w),
      .buf_ram_waddr_o(ib_buf_ram_waddr_o_temp_w)

);

input_buffer ib_e (

      .clk(clk),
	  .reset(reset), 
      .buf_data_i(e_data_i),
      .buf_write_i(e_valid_i),
      .buf_read_i(ib_read_i_temp_e), 
      .buf_empty_o(ib_buf_empty_e),
      .buf_valid_o(ib_valid_o_temp_e), 
      .buf_data_o(ib_data_o_temp_e),
	  
	  // These are for debugging purpose, not actually going to use them anywhere
      .buf_ram_raddr_o(ib_buf_ram_raddr_o_temp_e),
      .buf_ram_waddr_o(ib_buf_ram_waddr_o_temp_e)

);

input_buffer ib_l (

      .clk(clk),
	  .reset(reset), 
      .buf_data_i(l_data_i),
      .buf_write_i(l_valid_i),
      .buf_read_i(ib_read_i_temp_l), 
      .buf_empty_o(ib_buf_empty_l),
      .buf_valid_o(ib_valid_o_temp_l), 
      .buf_data_o(ib_data_o_temp_l),
	  
	  // These are for debugging purpose, not actually going to use them anywhere
      .buf_ram_raddr_o(ib_buf_ram_raddr_o_temp_l),
      .buf_ram_waddr_o(ib_buf_ram_waddr_o_temp_l)

);

// credit counter instantiation 

credit_counter cc_n (

	  .clk(clk), 
	  .reset(reset),
	  .cc_dec_i(n_cc_dec_temp),  
	  .cc_inc_i(n_credit_i), 
	  .cc_credit_o(cc_credit_n_i_temp)
	
);

credit_counter cc_w (

	  .clk(clk), 
	  .reset(reset),
	  .cc_dec_i(w_cc_dec_temp),  
	  .cc_inc_i(w_credit_i), 
	  .cc_credit_o(cc_credit_w_i_temp)
	
);

credit_counter cc_e (

	  .clk(clk), 
	  .reset(reset),
	  .cc_dec_i(e_cc_dec_temp),  
	  .cc_inc_i(e_credit_i), 
	  .cc_credit_o(cc_credit_e_i_temp)
	
);

credit_counter cc_l (

	  .clk(clk), 
	  .reset(reset),
	  .cc_dec_i(l_cc_dec_temp),  
	  .cc_inc_i(l_credit_i), 
	  .cc_credit_o(cc_credit_l_i_temp)
	
);
// arbiter instantiation 


arbiter arbiter_inner (

	  .clk(clk), 
      .reset(reset), 

	  .cc_credit_n_i(cc_credit_n_i_temp),
	  .cc_credit_s_i(1'b0),  
	  .cc_credit_w_i(cc_credit_w_i_temp), 
	  .cc_credit_e_i(cc_credit_e_i_temp), 
	  .cc_credit_l_i(cc_credit_l_i_temp), 

	  .yx_addr_router_i(yx_addr_router_i),
	  .yx_n_addr_header_i(ib_data_o_temp_n),
	  .yx_s_addr_header_i(16'b0000000000000000), 
	  .yx_w_addr_header_i(ib_data_o_temp_w),
	  .yx_e_addr_header_i(ib_data_o_temp_e), 
	  .yx_l_addr_header_i(ib_data_o_temp_l), 

	  .ib_empty_n_i(ib_buf_empty_n), 
	  .ib_empty_s_i(1'b0), 
	  .ib_empty_w_i(ib_buf_empty_w), 
	  .ib_empty_e_i(ib_buf_empty_e), 
	  .ib_empty_l_i(ib_buf_empty_l), 

	  .cc_credit_n_o(n_cc_dec_temp),
	  .cc_credit_s_o(s_cc_dec_temp), 
	  .cc_credit_w_o(w_cc_dec_temp), 
	  .cc_credit_e_o(e_cc_dec_temp), 
	  .cc_credit_l_o(l_cc_dec_temp), 

	  .demux_nhr_n_addr_o(demux_select_temp_n), 
	  .demux_nhr_s_addr_o(demux_select_temp_s), 
	  .demux_nhr_w_addr_o(demux_select_temp_w), 
	  .demux_nhr_e_addr_o(demux_select_temp_e), 
	  .demux_nhr_l_addr_o(demux_select_temp_l), 

	  .rrp_n_priority_to_cs_o(mux_select_temp_n),
	  .rrp_n_priority_read_o(ib_read_i_temp_n),
	  
	  .rrp_s_priority_to_cs_o(mux_select_temp_s),
	  .rrp_s_priority_read_o(ib_read_i_temp_s),

	  .rrp_w_priority_to_cs_o(mux_select_temp_w),
	  .rrp_w_priority_read_o(ib_read_i_temp_w),

	  .rrp_e_priority_to_cs_o(mux_select_temp_e),
	  .rrp_e_priority_read_o(ib_read_i_temp_e),

	  .rrp_l_priority_to_cs_o(mux_select_temp_l),
	  .rrp_l_priority_read_o(ib_read_i_temp_l)

);


 
// crossbar switch instantiation 

crossbar_switch_inner cs_inner (

	  .n_cs_i(ib_data_o_temp_n), 
	  .s_cs_i(ib_data_o_temp_s), 
	  .w_cs_i(ib_data_o_temp_w), 
	  .e_cs_i(ib_data_o_temp_e), 
	  .l_cs_i(ib_data_o_temp_l), 

// Input of demux select signals

	  .n_cs_sel_demux_i(demux_select_temp_n), 
	  .s_cs_sel_demux_i(demux_select_temp_s), 
	  .w_cs_sel_demux_i(demux_select_temp_w), 
	  .e_cs_sel_demux_i(demux_select_temp_e), 
	  .l_cs_sel_demux_i(demux_select_temp_l),

// Input of mux select signals

	  .n_cs_sel_mux_i(mux_select_temp_n), 
	  .s_cs_sel_mux_i(mux_select_temp_s), 
	  .w_cs_sel_mux_i(mux_select_temp_w), 
	  .e_cs_sel_mux_i(mux_select_temp_e), 
	  .l_cs_sel_mux_i(mux_select_temp_l),

// output of mux 

	  .n_cs_o(n_data_o_temp), 
	  .s_cs_o(s_data_o_temp), 
	  .w_cs_o(w_data_o_temp), 
	  .e_cs_o(e_data_o_temp), 
	  .l_cs_o(l_data_o_temp)

);

always_comb begin 

n_credit_o_temp = ib_read_i_temp_n;
w_credit_o_temp = ib_read_i_temp_w;
e_credit_o_temp = ib_read_i_temp_e;
l_credit_o_temp = ib_read_i_temp_l;

end 

assign n_data_o = n_data_o_temp; 
assign w_data_o = w_data_o_temp; 
assign e_data_o = e_data_o_temp; 
assign l_data_o = l_data_o_temp; 

assign n_valid_o = ib_valid_o_temp_n; 
assign w_valid_o = ib_valid_o_temp_w; 
assign e_valid_o = ib_valid_o_temp_e; 
assign l_valid_o = ib_valid_o_temp_l; 

assign n_credit_o = n_credit_o_temp; 
assign w_credit_o = w_credit_o_temp; 
assign e_credit_o = e_credit_o_temp; 
assign l_credit_o = l_credit_o_temp; 

endmodule
