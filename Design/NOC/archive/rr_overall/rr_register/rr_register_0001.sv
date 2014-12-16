
`include "./rr_register/eff_rr_0001.sv"

module rr_register_0001 (

input clk, 
input reset,
input change_order_i,  
output priority_order_o

);
	
logic [3:0] data_i_temp; 
logic [3:0] data_o_temp; 


eff_rr_0001 #(.DATA_WIDTH(3)) ff (
	
	.clk(clk),
	.data_o(data_o_temp),
	.data_i(data_i_temp)
	);

always_comb begin 

if (reset) begin

	data_i_temp = 4'b0001;  
	
end else if (change_order_i) begin 

   data_i_temp [0] = data_o_temp [1] ;
   data_i_temp [1] = data_o_temp [2] ;
   data_i_temp [2] = data_o_temp [3] ;
   data_i_temp [3] = data_o_temp [0] ;      
   
end 

end 

assign priority_order_o = data_o_temp ; 

endmodule
