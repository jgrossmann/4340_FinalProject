
`include "eff.sv"

module credit_counter (

input clk, 
input reset,
input cc_dec_i,  
input cc_inc_i, 
output cc_credit_o
	
	);
	
logic [2:0] data_i_temp; 
logic [2:0] data_o_temp; 


eff #(.DATA_WIDTH(3)) ff (
	
	.clk(clk),
	.data_o(data_o_temp),
	.data_i(data_i_temp)
	);

always_comb begin 

if (reset) begin

	data_i_temp = 3'b101;  
	

end else if (cc_inc_i & ~cc_dec_i) begin 

   data_i_temp = data_o_temp + 1 ; 

end else if (cc_dec_i & ~cc_inc_i) begin 
   
   data_i_temp = data_o_temp -1 ;
   
end else if (cc_inc_i ~^ cc_dec_i) begin 

   data_i_temp = data_o_temp ; 
  
end 

end 


assign cc_credit_o = ~ (data_o_temp == 3'b000);  

endmodule