
module demux_1to2

(

input [15:0] data_i, 
input [1:0] sel_i, 
input enable_i, 

output [15:0] data_0_o, 
output [15:0] data_1_o,

) 

logic [15:0] data_0_o_temp; 
logic [15:0] data_1_o_temp;  

always_comb_begin 


if (enable_i) begin 
   
   case (sel_i)
   
   2'b00 : data_0_o_temp = data_i; 
   2'b01 : data_1_o_temp = data_i; 
   
   default : begin 
                   data_0_o_temp = 16'bxxxx_xxxx_xxxx_xxxx; 
                   data_1_o_temp = 16'bxxxx_xxxx_xxxx_xxxx;  
             end 
   endcase
   
end 

else begin 

   data_0_o_temp = 16'bzzzz_zzzz_zzzz_zzzz; 
   data_1_o_temp = 16'bzzzz_zzzz_zzzz_zzzz;
      
end 
   
assign data_0_o_temp = data_0_o; 
assign data_1_o_temp = data_0_o; 
 

endmodule 

   
   