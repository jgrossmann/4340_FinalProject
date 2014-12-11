`include "./rr_overall/rr_comparator/n_rr_comparator.sv" 
`include "./rr_overall/rr_comparator/s_rr_comparator.sv" 
`include "./rr_overall/rr_comparator/w_rr_comparator.sv" 
`include "./rr_overall/rr_comparator/e_rr_comparator.sv" 
`include "./rr_overall/rr_comparator/l_rr_comparator.sv" 
`include "./rr_overall/priorityencoder.sv" 

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

`include "./rr_overall/nexthop_register/enable_eff_nr.sv"
`include "./rr_overall/nexthop_register/nexthop_register.sv" 
`include "./yx_processor/yx_processor.sv" 


module arbiter (

input clk, 
input reset, 

input [7:0] yx_addr_router_i,

input [7:0] yx_n_addr_header_i,
input [7:0] yx_s_addr_header_i, 
input [7:0] yx_w_addr_header_i,
input [7:0] yx_e_addr_header_i, 
input [7:0] yx_l_addr_header_i, 

input nhr_n_write_i,  
input nhr_s_write_i,  
input nhr_w_write_i,  
input nhr_e_write_i,  
input nhr_l_write_i,  

input rr_n_register_change_order_i,
input rr_s_register_change_order_i, 
input rr_w_register_change_order_i, 
input rr_e_register_change_order_i, 
input rr_l_register_change_order_i, 

output rrp_n_priority_to_cs_o,
output rrp_n_priority_n_o,
output rrp_n_priority_s_o, 
output rrp_n_priority_w_o, 
output rrp_n_priority_e_o, 
output rrp_n_priority_l_o,

output rrp_s_priority_to_cs_o,
output rrp_s_priority_n_o,
output rrp_s_priority_s_o, 
output rrp_s_priority_w_o, 
output rrp_s_priority_e_o, 
output rrp_s_priority_l_o,

output rrp_w_priority_to_cs_o,
output rrp_w_priority_n_o,
output rrp_w_priority_s_o, 
output rrp_w_priority_w_o, 
output rrp_w_priority_e_o, 
output rrp_w_priority_l_o,

output rrp_e_priority_to_cs_o,
output rrp_e_priority_n_o,
output rrp_e_priority_s_o, 
output rrp_e_priority_w_o, 
output rrp_e_priority_e_o, 
output rrp_e_priority_l_o,

output rrp_l_priority_to_cs_o,
output rrp_l_priority_n_o,
output rrp_l_priority_s_o, 
output rrp_l_priority_w_o, 
output rrp_l_priority_e_o, 
output rrp_l_priority_l_o

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

logic rrp_n_priority_n_o_temp;
logic rrp_n_priority_s_o_temp;
logic rrp_n_priority_w_o_temp;
logic rrp_n_priority_e_o_temp;
logic rrp_n_priority_l_o_temp;
logic rrp_n_priority_to_cs_o_temp;

logic rrp_s_priority_n_o_temp;
logic rrp_s_priority_s_o_temp;
logic rrp_s_priority_w_o_temp;
logic rrp_s_priority_e_o_temp;
logic rrp_s_priority_l_o_temp;
logic rrp_s_priority_to_cs_o_temp;

logic rrp_w_priority_n_o_temp;
logic rrp_w_priority_s_o_temp;
logic rrp_w_priority_w_o_temp;
logic rrp_w_priority_e_o_temp;
logic rrp_w_priority_l_o_temp;
logic rrp_w_priority_to_cs_o_temp;

logic rrp_e_priority_n_o_temp;
logic rrp_e_priority_s_o_temp;
logic rrp_e_priority_w_o_temp;
logic rrp_e_priority_e_o_temp;
logic rrp_e_priority_l_o_temp;
logic rrp_e_priority_to_cs_o_temp;

logic rrp_l_priority_n_o_temp;
logic rrp_l_priority_s_o_temp;
logic rrp_l_priority_w_o_temp;
logic rrp_l_priority_e_o_temp;
logic rrp_l_priority_l_o_temp;
logic rrp_l_priority_to_cs_o_temp;

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

nexthop_register nexthop_n (

       .clk(clk), 
       .reset(reset),
       .nhr_address_i(yx_n_addr_o_temp),
       .nhr_write_i(nhr_n_write_i),  
       .nhr_address_o(nhr_n_addr_o_temp)

); 

nexthop_register nexthop_s (

       .clk(clk), 
       .reset(reset),
       .nhr_address_i(yx_s_addr_o_temp),
       .nhr_write_i(nhr_s_write_i),  
       .nhr_address_o(nhr_s_addr_o_temp)

); 

nexthop_register nexthop_w (

       .clk(clk), 
       .reset(reset),
       .nhr_address_i(yx_w_addr_o_temp),
       .nhr_write_i(nhr_w_write_i),  
       .nhr_address_o(nhr_w_addr_o_temp)

); 

nexthop_register nexthop_e (

       .clk(clk), 
       .reset(reset),
       .nhr_address_i(yx_e_addr_o_temp),
       .nhr_write_i(nhr_e_write_i),  
       .nhr_address_o(nhr_e_addr_o_temp)

); 

nexthop_register nexthop_l (

       .clk(clk), 
       .reset(reset),
       .nhr_address_i(yx_l_addr_o_temp),
       .nhr_write_i(nhr_l_write_i),  
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

assign rrp_n_priority_n_o = rrp_n_priority_n_o_temp;  
assign rrp_n_priority_s_o = rrp_n_priority_s_o_temp;  
assign rrp_n_priority_w_o = rrp_n_priority_w_o_temp;  
assign rrp_n_priority_e_o = rrp_n_priority_e_o_temp;  
assign rrp_n_priority_l_o = rrp_n_priority_l_o_temp;  
assign rrp_n_priority_to_cs_o = rrp_n_priority_to_cs_o_temp;  

assign rrp_s_priority_n_o = rrp_s_priority_n_o_temp;  
assign rrp_s_priority_s_o = rrp_s_priority_s_o_temp;  
assign rrp_s_priority_w_o = rrp_s_priority_w_o_temp;  
assign rrp_s_priority_e_o = rrp_s_priority_e_o_temp;  
assign rrp_s_priority_l_o = rrp_s_priority_l_o_temp;  
assign rrp_s_priority_to_cs_o = rrp_s_priority_to_cs_o_temp;  

assign rrp_w_priority_n_o = rrp_w_priority_n_o_temp;  
assign rrp_w_priority_s_o = rrp_w_priority_s_o_temp;  
assign rrp_w_priority_w_o = rrp_w_priority_w_o_temp;  
assign rrp_w_priority_e_o = rrp_w_priority_e_o_temp;  
assign rrp_w_priority_l_o = rrp_w_priority_l_o_temp;  
assign rrp_w_priority_to_cs_o = rrp_w_priority_to_cs_o_temp;  

assign rrp_e_priority_n_o = rrp_e_priority_n_o_temp;  
assign rrp_e_priority_s_o = rrp_e_priority_s_o_temp;  
assign rrp_e_priority_w_o = rrp_e_priority_w_o_temp;  
assign rrp_e_priority_e_o = rrp_e_priority_e_o_temp;  
assign rrp_e_priority_l_o = rrp_e_priority_l_o_temp;  
assign rrp_e_priority_to_cs_o = rrp_e_priority_to_cs_o_temp;  

assign rrp_l_priority_n_o = rrp_l_priority_n_o_temp;  
assign rrp_l_priority_s_o = rrp_l_priority_s_o_temp;  
assign rrp_l_priority_w_o = rrp_l_priority_w_o_temp;  
assign rrp_l_priority_e_o = rrp_l_priority_e_o_temp;  
assign rrp_l_priority_l_o = rrp_l_priority_l_o_temp;  
assign rrp_l_priority_to_cs_o = rrp_l_priority_to_cs_o_temp;  

endmodule
