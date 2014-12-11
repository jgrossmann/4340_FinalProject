
module l_rr_comparator (

input [2:0] n_nexthop_addr_i,
input [2:0] s_nexthop_addr_i,
input [2:0] w_nexthop_addr_i,
input [2:0] e_nexthop_addr_i,

output n_desired_o,
output s_desired_o,
output w_desired_o,
output e_desired_o

);

assign n_desired_o = (n_nexthop_addr_i == 3'b100); 
assign s_desired_o = (s_nexthop_addr_i == 3'b100); 
assign w_desired_o = (w_nexthop_addr_i == 3'b100); 
assign e_desired_o = (e_nexthop_addr_i == 3'b100); 

endmodule
