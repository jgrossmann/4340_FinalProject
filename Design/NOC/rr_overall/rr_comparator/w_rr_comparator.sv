
module w_rr_comparator (

input [2:0] n_nexthop_addr_i,
input [2:0] s_nexthop_addr_i,
input [2:0] e_nexthop_addr_i,
input [2:0] l_nexthop_addr_i,

output n_desired_o,
output s_desired_o,
output e_desired_o,
output l_desired_o

);

assign n_desired_o = (n_nexthop_addr_i == 3'b010); 
assign s_desired_o = (s_nexthop_addr_i == 3'b010); 
assign e_desired_o = (e_nexthop_addr_i == 3'b010); 
assign l_desired_o = (l_nexthop_addr_i == 3'b010); 

endmodule
