
//`include "./rr_overall/rr_comparator/w_rr_comparator.sv" 
//`include "./rr_overall/rr_register/rr_register_0001.sv"
//`include "./rr_overall/rr_register/rr_register_0010.sv"
//`include "./rr_overall/rr_register/rr_register_0100.sv"
//`include "./rr_overall/rr_register/rr_register_1000.sv"
//`include "./rr_overall/priorityencoder.sv"

module w_rr_processor (

input clk, 
input reset, 
input [2:0] n_rrp_w_nexthop_addr_i,
input [2:0] s_rrp_w_nexthop_addr_i,
input [2:0] e_rrp_w_nexthop_addr_i,
input [2:0] l_rrp_w_nexthop_addr_i,
input rr_register_change_order_i, 

output rrp_w_priority_to_cs_o,
output rrp_w_priority_n_o,
output rrp_w_priority_s_o, 
output rrp_w_priority_w_o, 
output rrp_w_priority_e_o, 
output rrp_w_priority_l_o

);

logic rrp_w_priority_n_o_temp;
logic rrp_w_priority_s_o_temp;
logic rrp_w_priority_w_o_temp;
logic rrp_w_priority_e_o_temp;
logic rrp_w_priority_l_o_temp;
logic rrp_w_priority_to_cs_o_temp;

logic [3:0] rr_register_0001_order; 
logic [3:0] rr_register_0010_order; 
logic [3:0] rr_register_0100_order; 
logic [3:0] rr_register_1000_order; 


w_rr_comparator wcomp(

       .n_nexthop_addr_i (n_rrp_w_nexthop_addr_i),
       .s_nexthop_addr_i (s_rrp_w_nexthop_addr_i), 
       .e_nexthop_addr_i (e_rrp_w_nexthop_addr_i), 
       .l_nexthop_addr_i (l_rrp_w_nexthop_addr_i), 
       .n_desired_o (n_to_w_desire), 
       .s_desired_o (s_to_w_desire),
       .e_desired_o (e_to_w_desire),
       .l_desired_o (l_to_w_desire)

);

rr_register_0001 rrr_0001(

       .clk (clk),
       .reset (reset), 
       .change_order_i (rr_register_change_order_i), 
       .priority_order_o (rr_register_0001_order)

);

rr_register_0010 rrr_0010(

       .clk (clk),
       .reset (reset), 
       .change_order_i (rr_register_change_order_i), 
       .priority_order_o (rr_register_0010_order)

);

rr_register_0100 rrr_0100(

       .clk (clk),
       .reset (reset), 
       .change_order_i (rr_register_change_order_i), 
       .priority_order_o (rr_register_0100_order)

);

rr_register_1000 rrr_1000(

       .clk (clk),
       .reset (reset), 
       .change_order_i (rr_register_change_order_i), 
       .priority_order_o (rr_register_1000_order)

);

 logic rr_priority_n_i = (n_to_w_desire == rr_register_1000_order[3]);  
 logic rr_priority_s_i = (s_to_w_desire == rr_register_0100_order[2]);  
 logic rr_priority_e_i = (e_to_w_desire == rr_register_0010_order[1]);  
 logic rr_priority_l_i = (l_to_w_desire == rr_register_0001_order[0]);  

priorityencoder priority_enc(

	.rr_priority_n_i (rr_priority_n_i), 
        .rr_priority_s_i (rr_priority_s_i), 
        .rr_priority_w_i (1'b0), 
        .rr_priority_e_i (rr_priority_e_i), 
        .rr_priority_l_i (rr_priority_l_i),
        .rr_priority_to_cs_o (rrp_w_priority_to_cs_o_temp),
	.rr_priority_n_o (rrp_w_priority_n_o_temp),
        .rr_priority_s_o (rrp_w_priority_s_o_temp), 
        .rr_priority_w_o (rrp_w_priority_w_o_temp), 
        .rr_priority_e_o (rrp_w_priority_e_o_temp), 
        .rr_priority_l_o (rrp_w_priority_l_o_temp)

);


assign rrp_w_priority_n_o = rrp_w_priority_n_o_temp;  
assign rrp_w_priority_s_o = rrp_w_priority_s_o_temp;  
assign rrp_w_priority_w_o = rrp_w_priority_w_o_temp;  
assign rrp_w_priority_e_o = rrp_w_priority_e_o_temp;  
assign rrp_w_priority_l_o = rrp_w_priority_l_o_temp;  
assign rrp_w_priority_to_cs_o = rrp_w_priority_to_cs_o_temp;  

endmodule
