//`include "./rr_comparator/n_rr_comparator.sv" 
//`include "./rr_register/rr_register_0001.sv"
//`include "./rr_register/rr_register_0010.sv"
//`include "./rr_register/rr_register_0100.sv"
//`include "./rr_register/rr_register_1000.sv"
//`include "./rr_register/eff_rr_1000.sv" 
//`include "./rr_register/eff_rr_0100.sv" 
//`include "./rr_register/eff_rr_0010.sv"
//`include "./rr_register/eff_rr_0001.sv" 
//`include "./priorityencoder.sv"
//`include "./priorityencoder_to_mux.sv" 
//`include "./mux_5to1.sv" 

module n_rr_processor (

input clk, 
input reset, 
input [2:0] s_rrp_n_nexthop_addr_i,
input [2:0] w_rrp_n_nexthop_addr_i,
input [2:0] e_rrp_n_nexthop_addr_i,
input [2:0] l_rrp_n_nexthop_addr_i,
input rr_register_change_order_i, 

output [2:0] rrp_n_priority_to_cs_o,
output rrp_n_priority_n_o,
output rrp_n_priority_s_o, 
output rrp_n_priority_w_o, 
output rrp_n_priority_e_o, 
output rrp_n_priority_l_o

);

logic s_to_n_desire; 
logic w_to_n_desire; 
logic e_to_n_desire; 
logic l_to_n_desire;

logic rrp_n_priority_n_o_temp;
logic rrp_n_priority_s_o_temp;
logic rrp_n_priority_w_o_temp;
logic rrp_n_priority_e_o_temp;
logic rrp_n_priority_l_o_temp;
logic rrp_n_priority_to_cs_o_temp;

logic [3:0] rr_register_0001_order; 
logic [3:0] rr_register_0010_order; 
logic [3:0] rr_register_0100_order; 
logic [3:0] rr_register_1000_order; 

logic s_to_n_desire; 
logic w_to_n_desire; 
logic e_to_n_desire; 
logic l_to_n_desire; 


n_rr_comparator ncomp(

       .s_nexthop_addr_i (s_rrp_n_nexthop_addr_i),
       .w_nexthop_addr_i (w_rrp_n_nexthop_addr_i), 
       .e_nexthop_addr_i (e_rrp_n_nexthop_addr_i), 
       .l_nexthop_addr_i (l_rrp_n_nexthop_addr_i), 
       .s_desired_o (s_to_n_desire), 
       .w_desired_o (w_to_n_desire),
       .e_desired_o (e_to_n_desire),
       .l_desired_o (l_to_n_desire)

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

 logic [3:0] rr_priority_1000_i; 
 logic [3:0] rr_priority_0100_i; 
 logic [3:0] rr_priority_0010_i;
 logic [3:0] rr_priority_0001_i; 
 logic rr_priority_1000_all; 
 logic rr_priority_0100_all; 
 logic rr_priority_0010_all; 
 logic rr_priority_0001_all;
 
 always_comb begin 
 
 rr_priority_1000_i [3] = (s_to_n_desire == rr_register_1000_order[3]);  
 rr_priority_1000_i [2] = (w_to_n_desire == rr_register_1000_order[2]);  
 rr_priority_1000_i [1] = (e_to_n_desire == rr_register_1000_order[1]);  
 rr_priority_1000_i [0] = (l_to_n_desire == rr_register_1000_order[0]);  
 rr_priority_1000_all = rr_priority_1000_i[3] + rr_priority_1000_i[2] + rr_priority_1000_i[1] + rr_priority_1000_i[0]; 
 
 rr_priority_0100_i [3] = (s_to_n_desire == rr_register_0100_order[3]);  
 rr_priority_0100_i [2] = (w_to_n_desire == rr_register_0100_order[2]);  
 rr_priority_0100_i [1] = (e_to_n_desire == rr_register_0100_order[1]);  
 rr_priority_0100_i [0] = (l_to_n_desire == rr_register_0100_order[0]);  
 rr_priority_0100_all = rr_priority_0100_i [3] + rr_priority_0100_i [2] + rr_priority_0100_i [1] + rr_priority_0100_i [0];
 
 rr_priority_0010_i [3] = (s_to_n_desire == rr_register_0010_order[3]);  
 rr_priority_0010_i [2] = (w_to_n_desire == rr_register_0010_order[2]);  
 rr_priority_0010_i [1] = (e_to_n_desire == rr_register_0010_order[1]);  
 rr_priority_0010_i [0] = (l_to_n_desire == rr_register_0010_order[0]);  
 rr_priority_0010_all = rr_priority_0010_i [3] + rr_priority_0010_i [2] + rr_priority_0010_i [1] + rr_priority_0010_i [0];
 
 rr_priority_0001_i [3] = (s_to_n_desire == rr_register_0001_order[3]);  
 rr_priority_0001_i [2] = (w_to_n_desire == rr_register_0001_order[2]);  
 rr_priority_0001_i [1] = (e_to_n_desire == rr_register_0001_order[1]);  
 rr_priority_0001_i [0] = (l_to_n_desire == rr_register_0001_order[0]);  
 rr_priority_0001_all = rr_priority_0001_i [3] + rr_priority_0001_i [2] + rr_priority_0001_i [1] + rr_priority_0001_i [0];
 
 end 
 
 logic [2:0] priority_mux_select; 
 logic [3:0] priority_mux_o; 
 
 priorityencoder_to_mux priority_enc_to_mux(

  	      .rr_priority_n_i (1'b0), 
          .rr_priority_s_i (rr_priority_1000_all), 
          .rr_priority_w_i (rr_priority_0100_all), 
          .rr_priority_e_i (rr_priority_0100_all), 
          .rr_priority_l_i (rr_priority_0001_all),
          .rr_priority_to_cs_o (priority_mux_select)

 );
 
 mux_5to1 priority_mux (
 
 .sel_i(priority_mux_select), 
 .data_n_i(4'b0000), 
 .data_s_i(rr_register_1000_order),
 .data_w_i(rr_register_1000_order),
 .data_e_i(rr_register_1000_order),
 .data_l_i(rr_register_1000_order),
 .data_o(priority_mux_o)
 
 ); 

priorityencoder priority_enc(

	    .rr_priority_n_i (1'b0), 
        .rr_priority_s_i (priority_mux_o[3]), 
        .rr_priority_w_i (priority_mux_o[2]), 
        .rr_priority_e_i (priority_mux_o[1]), 
        .rr_priority_l_i (priority_mux_o[0]),
        .rr_priority_to_cs_o (rrp_n_priority_to_cs_o_temp),
	    .rr_priority_n_o (rrp_n_priority_n_o_temp),
        .rr_priority_s_o (rrp_n_priority_s_o_temp), 
        .rr_priority_w_o (rrp_n_priority_w_o_temp), 
        .rr_priority_e_o (rrp_n_priority_e_o_temp), 
        .rr_priority_l_o (rrp_n_priority_l_o_temp)

);

assign rrp_n_priority_n_o = rrp_n_priority_n_o_temp;  
assign rrp_n_priority_s_o = rrp_n_priority_s_o_temp;  
assign rrp_n_priority_w_o = rrp_n_priority_w_o_temp;  
assign rrp_n_priority_e_o = rrp_n_priority_e_o_temp;  
assign rrp_n_priority_l_o = rrp_n_priority_l_o_temp;  
assign rrp_n_priority_to_cs_o = rrp_n_priority_to_cs_o_temp;  

endmodule
