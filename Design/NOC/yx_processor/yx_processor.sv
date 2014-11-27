
module yx_processor (

input yx_addr_header_i, 
input yx_addr_router_i,
output yx_addr_o

);
	
logic [2:0] yx_addr_o_temp; 


always_comb begin 

if yx_addr_header_i [3:0] > yx_addr_router_i [3:0] begin 

yx_addr_o_temp = 3'b001; 

end else if yx_addr_header_i [3:0] < yx_addr_router_i [3:0]

yx_addr_o_temp = 3'b000;

end else if yx_addr_header_i [7:4] > yx_addr_router_i [7:4]

yx_addr_o_temp = 3'b011;

end else if yx_addr_header_i [7:4] < yx_addr_router_i [7:4]

yx_addr_o_temp = 3'b010;

end else 

yx_addr_o_temp = 3'b100;



end 

assign yx_addr_o = yx_addr_o_temp; 

endmodule