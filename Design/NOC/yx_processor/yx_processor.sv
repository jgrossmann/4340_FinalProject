
module yx_processor (

input [7:0] yx_addr_header_i, 
input [7:0] yx_addr_router_i,
output [2:0] yx_addr_o

);
	
logic [2:0] yx_addr_o_temp;
//logic [7:0] yx_addr_header_i_temp = yx_addr_header_i;
//logic [7:0] yx_addr_router_i_temp = yx_addr_router_i;
logic [3:0] y_addr_subtract; 
logic [3:0] x_addr_subtract; 

always_comb begin 

y_addr_subtract = yx_addr_header_i [3:0] - yx_addr_router_i [3:0]; 
x_addr_subtract = yx_addr_header_i [7:4] - yx_addr_router_i [7:4]; 

// If the MSB of y_addr_subtract is 0, then it should go 

if (yx_addr_header_i == yx_addr_router_i) begin
 
yx_addr_o_temp = 3'b100; // "local" output direction 

end else if (!(yx_addr_header_i [3:0] == yx_addr_router_i [3:0]) ) begin 

if (~y_addr_subtract [3]) begin 

yx_addr_o_temp = 3'b001; // "south" output direction 

end else if (y_addr_subtract [3]) begin

yx_addr_o_temp = 3'b000; // "north" output direction 

end 

end else if (~x_addr_subtract[3]) begin

yx_addr_o_temp = 3'b011; // "east" output direction 

end else if (x_addr_subtract[3]) begin

yx_addr_o_temp = 3'b010; // "west" output direction 

end 

else

yx_addr_o_temp = 3'b111; // testing

end  

assign yx_addr_o = yx_addr_o_temp; 

endmodule
