
module yx_processor (

input [7:0] yx_addr_header_i, 
input [7:0] yx_addr_router_i,
output [2:0] yx_addr_o

);
	
logic [2:0] yx_addr_o_temp;
logic [7:0] yx_addr_header_i_temp = yx_addr_header_i;
logic [7:0] yx_addr_router_i_temp = yx_addr_router_i;

always_comb begin 

if (yx_addr_header_i_temp [3:0] > yx_addr_router_i_temp [3:0]) begin 

yx_addr_o_temp = 3'b001; 

end else if (yx_addr_header_i_temp [3:0] < yx_addr_router_i_temp [3:0]) begin

yx_addr_o_temp = 3'b000;

end else if (yx_addr_header_i_temp [7:4] > yx_addr_router_i_temp [7:4]) begin

yx_addr_o_temp = 3'b011;

end else if (yx_addr_header_i_temp [7:4] < yx_addr_router_i_temp [7:4]) begin

yx_addr_o_temp = 3'b010;

end else 

yx_addr_o_temp = 3'b100;



end 

assign yx_addr_o = yx_addr_o_temp; 

endmodule