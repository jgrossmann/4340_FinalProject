
//`include "./nexthop_register/enable_eff_nr.sv"

module nexthop_register (

input clk, 
input reset,
input [2:0] nhr_address_i,
input nhr_write_i,  
output [2:0] nhr_address_o
	
);
	
logic [2:0] data_o_temp; 

enable_eff_nr #(.DATA_WIDTH(3)) ff (
	
	.clk(clk),
	.reset(reset),
	.write_enable_i(nhr_write_i),
	.data_o(data_o_temp),
	.data_i(nhr_address_i)
	);

assign nhr_address_o = data_o_temp;  

endmodule
