`include "./rr_overall/rr_comparator/n_rr_comparator.sv" 
`include "./rr_overall/rr_comparator/s_rr_comparator.sv" 
`include "./rr_overall/rr_comparator/w_rr_comparator.sv" 
`include "./rr_overall/rr_comparator/e_rr_comparator.sv" 
`include "./rr_overall/rr_comparator/l_rr_comparator.sv" 
`include "./rr_overall/priorityencoder.sv" 
`include "./rr_overall/priorityencoder_to_mux.sv" 
`include "./rr_overall/mux_5to1.sv" 
`include "./rr_overall/mux_5to1_1bit.sv" 

`include "./rr_overall/rr_register/eff_rr_0001.sv" 
`include "./rr_overall/rr_register/rr_register_0001.sv" 
`include "./rr_overall/rr_register/eff_rr_0010.sv" 
`include "./rr_overall/rr_register/rr_register_0010.sv" 
`include "./rr_overall/rr_register/eff_rr_0100.sv" 
`include "./rr_overall/rr_register/rr_register_0100.sv" 
`include "./rr_overall/rr_register/eff_rr_1000.sv" 
`include "./rr_overall/rr_register/rr_register_1000.sv" 

`include "./rr_overall/n_rr_processor.sv" 
`include "./rr_overall/s_rr_processor.sv" 
`include "./rr_overall/w_rr_processor.sv" 
`include "./rr_overall/e_rr_processor.sv" 
`include "./rr_overall/l_rr_processor.sv" 

`include "./nexthop_register/enable_eff_nr.sv"
`include "./nexthop_register/nexthop_register.sv" 
`include "./yx_processor/yx_processor.sv" 

`include "./packet_tracker/packet_tracker.sv" 
`include "./packet_tracker/eff_pt.sv" 


module arbiter (

input clk, 
input reset, 

input cc_credit_n_i,
input cc_credit_s_i, 
input cc_credit_w_i, 
input cc_credit_e_i, 
input cc_credit_l_i, 

input [7:0] yx_addr_router_i,

input [7:0] yx_n_addr_header_i,
input [7:0] yx_s_addr_header_i, 
input [7:0] yx_w_addr_header_i,
input [7:0] yx_e_addr_header_i, 
input [7:0] yx_l_addr_header_i, 

input ib_empty_n_i, 
input ib_empty_s_i, 
input ib_empty_w_i, 
input ib_empty_e_i, 
input ib_empty_l_i, 

output cc_credit_n_o,
output cc_credit_s_o, 
output cc_credit_w_o, 
output cc_credit_e_o, 
output cc_credit_l_o, 

output demux_nhr_n_addr_o, 
output demux_nhr_s_addr_o, 
output demux_nhr_w_addr_o, 
output demux_nhr_e_addr_o, 
output demux_nhr_l_addr_o, 

output rrp_n_priority_to_cs_o,
output rrp_n_priority_read_o,

output rrp_s_priority_to_cs_o,
output rrp_s_priority_read_o,

output rrp_w_priority_to_cs_o,
output rrp_w_priority_read_o,

output rrp_e_priority_to_cs_o,
output rrp_e_priority_read_o,

output rrp_l_priority_to_cs_o,
output rrp_l_priority_read_o

);

logic [2:0] yx_n_addr_o_temp; 
logic [2:0] yx_s_addr_o_temp; 
logic [2:0] yx_w_addr_o_temp; 
logic [2:0] yx_e_addr_o_temp; 
logic [2:0] yx_l_addr_o_temp; 

logic [2:0] nhr_n_addr_o_temp; 
logic [2:0] nhr_s_addr_o_temp; 
logic [2:0] nhr_w_addr_o_temp; 
logic [2:0] nhr_e_addr_o_temp; 
logic [2:0] nhr_l_addr_o_temp; 

logic nhr_n_write_i_temp;
logic nhr_s_write_i_temp;  
logic nhr_w_write_i_temp;  
logic nhr_e_write_i_temp;  
logic nhr_l_write_i_temp;  

logic rrp_n_priority_n_o_temp;
logic rrp_n_priority_s_o_temp;
logic rrp_n_priority_w_o_temp;
logic rrp_n_priority_e_o_temp;
logic rrp_n_priority_l_o_temp;
logic [2:0] rrp_n_priority_to_cs_o_temp;

logic rrp_s_priority_n_o_temp;
logic rrp_s_priority_s_o_temp;
logic rrp_s_priority_w_o_temp;
logic rrp_s_priority_e_o_temp;
logic rrp_s_priority_l_o_temp;
logic [2:0] rrp_s_priority_to_cs_o_temp;

logic rrp_w_priority_n_o_temp;
logic rrp_w_priority_s_o_temp;
logic rrp_w_priority_w_o_temp;
logic rrp_w_priority_e_o_temp;
logic rrp_w_priority_l_o_temp;
logic [2:0] rrp_w_priority_to_cs_o_temp;

logic rrp_e_priority_n_o_temp;
logic rrp_e_priority_s_o_temp;
logic rrp_e_priority_w_o_temp;
logic rrp_e_priority_e_o_temp;
logic rrp_e_priority_l_o_temp;
logic [2:0] rrp_e_priority_to_cs_o_temp;

logic rrp_l_priority_n_o_temp;
logic rrp_l_priority_s_o_temp;
logic rrp_l_priority_w_o_temp;
logic rrp_l_priority_e_o_temp;
logic rrp_l_priority_l_o_temp;
logic [2:0] rrp_l_priority_to_cs_o_temp;

logic rrp_n_priority_read_o_temp; 
logic rrp_s_priority_read_o_temp; 
logic rrp_w_priority_read_o_temp;  
logic rrp_e_priority_read_o_temp; 
logic rrp_l_priority_read_o_temp; 

logic rr_n_register_change_order_i; 
logic rr_s_register_change_order_i; 
logic rr_w_register_change_order_i; 
logic rr_e_register_change_order_i; 
logic rr_l_register_change_order_i;

logic cc_credit_n_o_temp; 
logic cc_credit_s_o_temp; 
logic cc_credit_w_o_temp; 
logic cc_credit_e_o_temp; 
logic cc_credit_l_o_temp; 

packet_tracker pt_n ( 

  .clk(clk), 
  .reset(reset),
  .pt_inc_i(rrp_n_priority_read_o_temp),   
  .pt_end_o(n_pt_almost_done_o)
	
);

packet_tracker pt_s ( 

  .clk(clk), 
  .reset(reset),
  .pt_inc_i(rrp_s_priority_read_o_temp),   
  .pt_end_o(s_pt_almost_done_o)
	
);

packet_tracker pt_w ( 

  .clk(clk), 
  .reset(reset),
  .pt_inc_i(rrp_w_priority_read_o_temp),   
  .pt_end_o(w_pt_almost_done_o)
	
);

packet_tracker pt_e ( 

  .clk(clk), 
  .reset(reset),
  .pt_inc_i(rrp_e_priority_read_o_temp),   
  .pt_end_o(e_pt_almost_done_o)
	
);

packet_tracker pt_l ( 

  .clk(clk), 
  .reset(reset),
  .pt_inc_i(rrp_l_priority_read_o_temp),   
  .pt_end_o(l_pt_almost_done_o)
	
);


yx_processor yx_proc_n (
	
  .yx_addr_header_i(yx_n_addr_header_i), 
  .yx_addr_router_i(yx_addr_router_i),
  .yx_addr_o(yx_n_addr_o_temp)

);

yx_processor yx_proc_s (
	
  .yx_addr_header_i(yx_s_addr_header_i), 
  .yx_addr_router_i(yx_addr_router_i),
  .yx_addr_o(yx_s_addr_o_temp)

);

yx_processor yx_proc_w (
	
  .yx_addr_header_i(yx_w_addr_header_i), 
  .yx_addr_router_i(yx_addr_router_i),
  .yx_addr_o(yx_w_addr_o_temp)

);

yx_processor yx_proc_e (
	
  .yx_addr_header_i(yx_e_addr_header_i), 
  .yx_addr_router_i(yx_addr_router_i),
  .yx_addr_o(yx_e_addr_o_temp)

);

yx_processor yx_proc_l (
	
  .yx_addr_header_i(yx_l_addr_header_i), 
  .yx_addr_router_i(yx_addr_router_i),
  .yx_addr_o(yx_l_addr_o_temp)

);

always_comb begin 

nhr_n_write_i_temp = (ib_empty_n_i * n_pt_almost_done_o);
nhr_s_write_i_temp = (ib_empty_s_i * s_pt_almost_done_o);  
nhr_w_write_i_temp = (ib_empty_w_i * w_pt_almost_done_o);  
nhr_e_write_i_temp = (ib_empty_e_i * e_pt_almost_done_o);  
nhr_l_write_i_temp = (ib_empty_l_i * l_pt_almost_done_o);  

end 

nexthop_register nexthop_n (

       .clk(clk), 
       .reset(reset),
       .nhr_address_i(yx_n_addr_o_temp),
       .nhr_write_i(nhr_n_write_i_temp),  
       .nhr_address_o(nhr_n_addr_o_temp)

); 

nexthop_register nexthop_s (

       .clk(clk), 
       .reset(reset),
       .nhr_address_i(yx_s_addr_o_temp),
       .nhr_write_i(nhr_s_write_i_temp),  
       .nhr_address_o(nhr_s_addr_o_temp)

); 

nexthop_register nexthop_w (

       .clk(clk), 
       .reset(reset),
       .nhr_address_i(yx_w_addr_o_temp),
       .nhr_write_i(nhr_w_write_i_temp),  
       .nhr_address_o(nhr_w_addr_o_temp)

); 

nexthop_register nexthop_e (

       .clk(clk), 
       .reset(reset),
       .nhr_address_i(yx_e_addr_o_temp),
       .nhr_write_i(nhr_e_write_i_temp),  
       .nhr_address_o(nhr_e_addr_o_temp)

); 

nexthop_register nexthop_l (

       .clk(clk), 
       .reset(reset),
       .nhr_address_i(yx_l_addr_o_temp),
       .nhr_write_i(nhr_l_write_i_temp),  
       .nhr_address_o(nhr_l_addr_o_temp)

); 

n_rr_processor nproc(

	.clk(clk), 
	.reset(reset), 

	.s_rrp_n_nexthop_addr_i(nhr_s_addr_o_temp),
	.w_rrp_n_nexthop_addr_i(nhr_w_addr_o_temp),
	.e_rrp_n_nexthop_addr_i(nhr_e_addr_o_temp),
	.l_rrp_n_nexthop_addr_i(nhr_l_addr_o_temp),
	.rr_register_change_order_i(rr_n_register_change_order_i), 

	.rrp_n_priority_to_cs_o (rrp_n_priority_to_cs_o_temp),
	.rrp_n_priority_n_o (rrp_n_priority_n_o_temp),
	.rrp_n_priority_s_o (rrp_n_priority_s_o_temp), 
	.rrp_n_priority_w_o (rrp_n_priority_w_o_temp), 
	.rrp_n_priority_e_o (rrp_n_priority_e_o_temp), 
	.rrp_n_priority_l_o (rrp_n_priority_l_o_temp)

);

s_rr_processor sproc(

	.clk(clk), 
	.reset(reset), 

	.n_rrp_s_nexthop_addr_i(nhr_n_addr_o_temp),
	.w_rrp_s_nexthop_addr_i(nhr_w_addr_o_temp),
	.e_rrp_s_nexthop_addr_i(nhr_e_addr_o_temp),
	.l_rrp_s_nexthop_addr_i(nhr_l_addr_o_temp),
	.rr_register_change_order_i(rr_s_register_change_order_i), 

	.rrp_s_priority_to_cs_o (rrp_s_priority_to_cs_o_temp),
	.rrp_s_priority_n_o (rrp_s_priority_n_o_temp),
	.rrp_s_priority_s_o (rrp_s_priority_s_o_temp), 
	.rrp_s_priority_w_o (rrp_s_priority_w_o_temp), 
	.rrp_s_priority_e_o (rrp_s_priority_e_o_temp), 
	.rrp_s_priority_l_o (rrp_s_priority_l_o_temp)

);

w_rr_processor wproc(

	.clk(clk), 
	.reset(reset), 

	.n_rrp_w_nexthop_addr_i(nhr_n_addr_o_temp),
	.s_rrp_w_nexthop_addr_i(nhr_s_addr_o_temp),
	.e_rrp_w_nexthop_addr_i(nhr_e_addr_o_temp),
	.l_rrp_w_nexthop_addr_i(nhr_l_addr_o_temp),
	.rr_register_change_order_i(rr_w_register_change_order_i), 

	.rrp_w_priority_to_cs_o (rrp_w_priority_to_cs_o_temp),
	.rrp_w_priority_n_o (rrp_w_priority_n_o_temp),
	.rrp_w_priority_s_o (rrp_w_priority_s_o_temp), 
	.rrp_w_priority_w_o (rrp_w_priority_w_o_temp), 
	.rrp_w_priority_e_o (rrp_w_priority_e_o_temp), 
	.rrp_w_priority_l_o (rrp_w_priority_l_o_temp)

);

e_rr_processor eproc(

	.clk(clk), 
	.reset(reset), 

	.n_rrp_e_nexthop_addr_i(nhr_n_addr_o_temp),
	.s_rrp_e_nexthop_addr_i(nhr_s_addr_o_temp),
	.w_rrp_e_nexthop_addr_i(nhr_w_addr_o_temp),
	.l_rrp_e_nexthop_addr_i(nhr_l_addr_o_temp),
	.rr_register_change_order_i(rr_e_register_change_order_i), 

	.rrp_e_priority_to_cs_o (rrp_e_priority_to_cs_o_temp),
	.rrp_e_priority_n_o (rrp_e_priority_n_o_temp),
	.rrp_e_priority_s_o (rrp_e_priority_s_o_temp), 
	.rrp_e_priority_w_o (rrp_e_priority_w_o_temp), 
	.rrp_e_priority_e_o (rrp_e_priority_e_o_temp), 
	.rrp_e_priority_l_o (rrp_e_priority_l_o_temp)

);

l_rr_processor lproc(

	.clk(clk), 
	.reset(reset), 

	.n_rrp_l_nexthop_addr_i(nhr_n_addr_o_temp),
	.s_rrp_l_nexthop_addr_i(nhr_s_addr_o_temp),
	.w_rrp_l_nexthop_addr_i(nhr_w_addr_o_temp),
	.e_rrp_l_nexthop_addr_i(nhr_e_addr_o_temp),
	.rr_register_change_order_i(rr_l_register_change_order_i), 

	.rrp_l_priority_to_cs_o (rrp_l_priority_to_cs_o_temp),
	.rrp_l_priority_n_o (rrp_l_priority_n_o_temp),
	.rrp_l_priority_s_o (rrp_l_priority_s_o_temp), 
	.rrp_l_priority_w_o (rrp_l_priority_w_o_temp), 
	.rrp_l_priority_e_o (rrp_l_priority_e_o_temp), 
	.rrp_l_priority_l_o (rrp_l_priority_l_o_temp)

);

mux_5to1_1bit mux_change_order_n (
	
 .sel_i(rrp_n_priority_to_cs_o_temp), 
 .data_n_i(1'b0), 
 .data_s_i(s_pt_almost_done_o),
 .data_w_i(w_pt_almost_done_o),
 .data_e_i(e_pt_almost_done_o),
 .data_l_i(l_pt_almost_done_o),

 .data_o(rr_n_register_change_order_i)
);  

mux_5to1_1bit mux_change_order_s (
	
 .sel_i(rrp_s_priority_to_cs_o_temp), 
 .data_n_i(n_pt_almost_done_o), 
 .data_s_i(1'b0),
 .data_w_i(w_pt_almost_done_o),
 .data_e_i(e_pt_almost_done_o),
 .data_l_i(l_pt_almost_done_o),

 .data_o(rr_s_register_change_order_i)
);  

mux_5to1_1bit mux_change_order_w (
	
 .sel_i(rrp_n_priority_to_cs_o_temp), 
 .data_n_i(n_pt_almost_done_o), 
 .data_s_i(s_pt_almost_done_o),
 .data_w_i(1'b0),
 .data_e_i(e_pt_almost_done_o),
 .data_l_i(l_pt_almost_done_o),

 .data_o(rr_w_register_change_order_i)
);  

mux_5to1_1bit mux_change_order_e (
	
 .sel_i(rrp_n_priority_to_cs_o_temp), 
 .data_n_i(n_pt_almost_done_o), 
 .data_s_i(s_pt_almost_done_o),
 .data_w_i(w_pt_almost_done_o),
 .data_e_i(1'b0),
 .data_l_i(l_pt_almost_done_o),

 .data_o(rr_e_register_change_order_i)
);  

mux_5to1_1bit mux_change_order_l (
	
 .sel_i(rrp_n_priority_to_cs_o_temp), 
 .data_n_i(n_pt_almost_done_o), 
 .data_s_i(s_pt_almost_done_o),
 .data_w_i(w_pt_almost_done_o),
 .data_e_i(e_pt_almost_done_o),
 .data_l_i(1'b0),

 .data_o(rr_l_register_change_order_i)
);  

always_comb begin 

rrp_n_priority_read_o_temp = (~cc_credit_n_i)*(rrp_s_priority_n_o_temp + rrp_w_priority_n_o_temp + rrp_e_priority_n_o_temp + rrp_l_priority_n_o_temp) ;  
rrp_s_priority_read_o_temp = (~cc_credit_s_i)*(rrp_n_priority_s_o_temp + rrp_w_priority_s_o_temp + rrp_e_priority_s_o_temp + rrp_l_priority_s_o_temp) ; 
rrp_w_priority_read_o_temp = (~cc_credit_w_i)*(rrp_n_priority_w_o_temp + rrp_s_priority_w_o_temp + rrp_e_priority_w_o_temp + rrp_l_priority_w_o_temp) ;   
rrp_e_priority_read_o_temp = (~cc_credit_e_i)*(rrp_n_priority_e_o_temp + rrp_s_priority_e_o_temp + rrp_w_priority_e_o_temp + rrp_l_priority_e_o_temp) ;  
rrp_l_priority_read_o_temp = (~cc_credit_l_i)*(rrp_n_priority_l_o_temp + rrp_s_priority_l_o_temp + rrp_w_priority_l_o_temp + rrp_e_priority_l_o_temp) ;  

cc_credit_n_o_temp = rrp_n_priority_s_o_temp + rrp_n_priority_w_o_temp + rrp_n_priority_w_o_temp + rrp_n_priority_l_o_temp;
cc_credit_s_o_temp = rrp_s_priority_n_o_temp + rrp_s_priority_w_o_temp + rrp_s_priority_e_o_temp + rrp_s_priority_l_o_temp;
cc_credit_w_o_temp = rrp_w_priority_n_o_temp + rrp_w_priority_s_o_temp + rrp_w_priority_e_o_temp + rrp_w_priority_l_o_temp;
cc_credit_e_o_temp = rrp_e_priority_n_o_temp + rrp_e_priority_s_o_temp + rrp_e_priority_w_o_temp + rrp_e_priority_l_o_temp;
cc_credit_l_o_temp = rrp_l_priority_n_o_temp + rrp_l_priority_s_o_temp + rrp_l_priority_w_o_temp + rrp_l_priority_e_o_temp;

end 

assign demux_nhr_n_addr_o = nhr_n_addr_o_temp; 
assign demux_nhr_s_addr_o = nhr_s_addr_o_temp; 
assign demux_nhr_w_addr_o = nhr_w_addr_o_temp; 
assign demux_nhr_e_addr_o = nhr_e_addr_o_temp; 
assign demux_nhr_l_addr_o = nhr_l_addr_o_temp; 

assign cc_credit_n_o = cc_credit_n_o_temp;
assign cc_credit_s_o = cc_credit_s_o_temp; 
assign cc_credit_w_o = cc_credit_w_o_temp; 
assign cc_credit_e_o = cc_credit_e_o_temp; 
assign cc_credit_l_o = cc_credit_l_o_temp;  

assign rrp_n_priority_read_o = rrp_n_priority_read_o_temp; 
assign rrp_n_priority_to_cs_o = rrp_n_priority_to_cs_o_temp;  

assign rrp_s_priority_read_o = rrp_s_priority_read_o_temp; 
assign rrp_s_priority_to_cs_o = rrp_s_priority_to_cs_o_temp;  

assign rrp_w_priority_read_o = rrp_w_priority_read_o_temp; 
assign rrp_w_priority_to_cs_o = rrp_w_priority_to_cs_o_temp;  

assign rrp_e_priority_read_o = rrp_e_priority_read_o_temp; 
assign rrp_e_priority_to_cs_o = rrp_e_priority_to_cs_o_temp;  

assign rrp_l_priority_read_o = rrp_l_priority_read_o_temp; 
assign rrp_l_priority_to_cs_o = rrp_l_priority_to_cs_o_temp;  

endmodule
