
`include "eff_pointer.sv"

module rw_pointer (

input clk, 
input reset,
input rwptr_inc_i,  
output [2:0] rwptr_addr_o

);
	
logic [2:0] data_i_temp; 
logic [2:0] data_o_temp; 


eff_pointer #(.DATA_WIDTH(3)) ff (
	
	.clk(clk),
        .reset(reset),
	.data_o(data_o_temp),
	.data_i(data_i_temp)
	);

always_comb begin 

if (reset) begin

	data_i_temp = 3'b000;  
	
end else if (rwptr_inc_i & data_o_temp == 3'b100) begin 

   data_i_temp = 3'b000 ;
   
end else if (rwptr_inc_i) begin 

   data_i_temp = data_o_temp + 1 ;
   
end 

end 

assign rwptr_addr_o = data_o_temp;  

endmodule
