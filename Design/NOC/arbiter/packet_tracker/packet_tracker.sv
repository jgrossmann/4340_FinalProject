
//`include "eff_pt.sv"

module packet_tracker (

input clk, 
input reset,
input pt_inc_i,  
output pt_end_o,
output pt_empty_o

);
	
logic [2:0] data_i_temp; 
logic [2:0] data_o_temp; 


eff_pt #(.DATA_WIDTH(3)) ff (
	
	.clk(clk),
    .reset(reset),
	.data_o(data_o_temp),
	.data_i(data_i_temp)
	);

always_comb begin 

if (reset) begin

	data_i_temp = 3'b000;  
	
// end else if (pt_inc_i & data_o_temp == 3'b100) begin
 
end else if (data_o_temp == 3'b100) begin 

   data_i_temp = 3'b000 ;
  
end else if (pt_inc_i) begin 

   data_i_temp = data_o_temp + 1 ;
   
end else if(data_o_temp == 3'b000) begin

data_i_temp = 3'b000;

end 
end

assign pt_end_o = (data_o_temp == 3'b100);  
assign pt_empty_o = (data_o_temp == 3'b000); 

endmodule
