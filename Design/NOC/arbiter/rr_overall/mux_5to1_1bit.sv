
module mux_5to1_1bit 

(
	
input [2:0]  sel_i, 
input data_n_i, 
input data_s_i,
input data_w_i,
input data_e_i,
input data_l_i,

output data_o
); 

logic data_o_temp; 


always_comb begin 
   
   case (sel_i)
   
   3'b000 : data_o_temp = data_n_i ; 
   3'b001 : data_o_temp = data_s_i ; 
   3'b010 : data_o_temp = data_w_i ; 
   3'b011 : data_o_temp = data_e_i ;
   3'b100 : data_o_temp = data_l_i ;
   
   default : begin 
                   data_o_temp = 1'bx;            
             end
   endcase

end 
   
assign data_o = data_o_temp; 


endmodule 

   
   
