
//`include "./nexthop_register/enable_eff_nr.sv"

module n_nexthop_register (

input clk, 
input reset,
input ib_empty_i, 
input pt_almost_done_i, 
input [2:0] nhr_address_i,
input nhr_write_i,  
output [2:0] nhr_address_o
	
);
	
logic [2:0] data_o_temp; 

logic [2:0] nhr_address_i_temp;

logic nhr_write_i_temp; 

enable_eff_nr #(.DATA_WIDTH(3)) ff (
	
	.clk(clk),
	.reset(reset),
	.write_enable_i(nhr_write_i_temp),
	.data_o(data_o_temp),
	.data_i(nhr_address_i_temp)
	);

always_comb begin
	if(pt_almost_done_i | ib_empty_i | reset) begin
		nhr_address_i_temp = 3'b000; 
		nhr_write_i_temp = 1'b1; 
	end
	
	else begin
	
	nhr_address_i_temp = nhr_address_i; 
	nhr_write_i_temp = nhr_write_i; 
	end
end

assign nhr_address_o = data_o_temp;  

endmodule
