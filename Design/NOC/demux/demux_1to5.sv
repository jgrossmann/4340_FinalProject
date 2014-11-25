
module demux_1to5 

(

input [15:0] data_i, 
input [2:0] sel_i, 
input enable_i, 

output [15:0] data_n_o, 
output [15:0] data_s_o,
output [15:0] data_w_o,
output [15:0] data_e_o,
output [15:0] data_l_o

); 

logic [15:0] data_n_o_temp; 
logic [15:0] data_s_o_temp; 
logic [15:0] data_w_o_temp; 
logic [15:0] data_e_o_temp; 
logic [15:0] data_l_o_temp;

always_comb begin 


if (enable_i) begin 
   
   case (sel_i)
   
   3'b000 : data_n_o_temp = data_i; 
   3'b001 : data_s_o_temp = data_i; 
   3'b010 : data_w_o_temp = data_i; 
   3'b011 : data_e_o_temp = data_i; 
   3'b100 : data_l_o_temp = data_i; 
   
   default : begin 
                   data_n_o_temp = 16'bxxxx_xxxx_xxxx_xxxx; 
                   data_s_o_temp = 16'bxxxx_xxxx_xxxx_xxxx;  
                   data_w_o_temp = 16'bxxxx_xxxx_xxxx_xxxx; 
                   data_e_o_temp = 16'bxxxx_xxxx_xxxx_xxxx;
                   data_l_o_temp = 16'bxxxx_xxxx_xxxx_xxxx;               
             end
   endcase
   
end 

else begin 
   data_n_o_temp = 16'bzzzz_zzzz_zzzz_zzzz; 
   data_s_o_temp = 16'bzzzz_zzzz_zzzz_zzzz;
   data_w_o_temp = 16'bzzzz_zzzz_zzzz_zzzz; 
   data_e_o_temp = 16'bzzzz_zzzz_zzzz_zzzz; 
   data_l_o_temp = 16'bzzzz_zzzz_zzzz_zzzz; 
end 

end 
   
assign data_n_o_temp = data_n_o; 
assign data_s_o_temp = data_s_o; 
assign data_w_o_temp = data_w_o; 
assign data_e_o_temp = data_e_o; 
assign data_l_o_temp = data_l_o; 

endmodule 

   
   