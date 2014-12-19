
module mux_5to1 

(
	
input [2:0]  sel_i, 
input [3:0] data_n_i, 
input [3:0] data_s_i,
input [3:0] data_w_i,
input [3:0] data_e_i,
input [3:0] data_l_i,

output [3:0] data_o
); 

logic [3:0] data_o_temp; 


always_comb begin 
   
   case (sel_i)
   
   3'b000 : data_o_temp = data_n_i ; 
   3'b001 : data_o_temp = data_s_i ; 
   3'b010 : data_o_temp = data_w_i ; 
   3'b011 : data_o_temp = data_e_i ;
   3'b100 : data_o_temp = data_l_i ;
   
   default : begin 
                   data_o_temp = 4'b0000;            
             end
   endcase

end 
   
assign data_o = data_o_temp; 


endmodule 

   
   
