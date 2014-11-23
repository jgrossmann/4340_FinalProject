
module demux_1to4 

(

input [15:0] data_i, 
input [1:0] sel_i, 
input enable_i, 

output [15:0] data_0_o, 
output [15:0] data_1_o,
output [15:0] data_2_o,
output [15:0] data_3_o,

) 

logic [15:0] data_0_o_temp; 
logic [15:0] data_1_o_temp; 
logic [15:0] data_2_o_temp; 
logic [15:0] data_3_o_temp; 

always_comb_begin 


if (enable_i) begin 
   
   casex (sel_i)
   
   2'b00 : data_0_o_temp = data_i; 
   2'b01 : data_1_o_temp = data_i; 
   2'b10 : data_2_o_temp = data_i; 
   2'b11 : data_3_o_temp = data_i; 
   
   endcase
   
end 

else begin 

   data_0_o_temp = 16'bzzzz_zzzz_zzzz_zzzz; 
   data_1_o_temp = 16'bzzzz_zzzz_zzzz_zzzz;
   data_2_o_temp = 16'bzzzz_zzzz_zzzz_zzzz; 
   data_3_o_temp = 16'bzzzz_zzzz_zzzz_zzzz; 
     
end 
   
assign data_0_o_temp = data_0_o; 
assign data_1_o_temp = data_0_o; 
assign data_2_o_temp = data_0_o; 
assign data_3_o_temp = data_0_o; 

endmodule 

   
   