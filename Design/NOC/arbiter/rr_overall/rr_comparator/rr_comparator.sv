
module n_rr_comparator (

input [2:0] s_nexthop_addr_i,
input [2:0] w_nexthop_addr_i,
input [2:0] e_nexthop_addr_i,
input [2:0] l_nexthop_addr_i,

output s_desired_o,
output w_desired_o,
output e_desired_o,
output l_desired_o

);


assign s_desired_o = (s_nexthop_addr_i == 3'b000); 
assign w_desired_o = (w_nexthop_addr_i == 3'b000); 
assign e_desired_o = (e_nexthop_addr_i == 3'b000); 
assign l_desired_o = (l_nexthop_addr_i == 3'b000); 

endmodule
