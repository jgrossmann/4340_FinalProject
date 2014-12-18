
//`include "./nexthop_register/enable_eff_nr.sv"

module e_nexthop_register (

input clk, 
input reset,
input ib_empty_i, 
input [2:0] nhr_address_i,
input nhr_write_i,  
output [2:0] nhr_address_o
	
);
	
logic [2:0] data_o_temp; 

logic [2:0] nhr_address_i_temp; 

enable_eff_nr #(.DATA_WIDTH(3)) ff (
	
	.clk(clk),
	.reset(reset),
	.write_enable_i(nhr_write_i),
	.data_o(data_o_temp),
	.data_i(nhr_address_i_temp)
	);

always_comb begin
	if(ib_empty_i | reset) begin
		nhr_address_i_temp = 3'b011; 
	end
	
	else begin
	
	nhr_address_i_temp = nhr_address_i; 
	
	end
end

assign nhr_address_o = data_o_temp;  

endmodule
