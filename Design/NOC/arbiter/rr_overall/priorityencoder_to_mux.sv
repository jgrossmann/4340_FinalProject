
module priorityencoder_to_mux(

	    input rr_priority_n_i, 
        input rr_priority_s_i, 
        input rr_priority_w_i, 
        input rr_priority_e_i, 
        input rr_priority_l_i,
        output rr_priority_to_cs_o
);

logic [4:0] rr_priority_i_temp; 
 
 logic rr_priority_to_cs_o_temp; 

	always_comb begin

 rr_priority_i_temp [4] = rr_priority_n_i; 
 rr_priority_i_temp [3] = rr_priority_s_i; 
 rr_priority_i_temp [2] = rr_priority_w_i; 
 rr_priority_i_temp [1] = rr_priority_e_i;
 rr_priority_i_temp [0] = rr_priority_l_i;  

		casex (rr_priority_i_temp)
			5'b1xxxx:  begin 
				rr_priority_to_cs_o_temp = 3'b000; 
			end 

			5'b01xxx:  begin 
				rr_priority_to_cs_o_temp = 3'b001; 
			end

                        5'b001xx:  begin 
				rr_priority_to_cs_o_temp = 3'b010; 
			end

 			5'b0001x:  begin 
				rr_priority_to_cs_o_temp = 3'b011; 
			end

			5'b00001:  begin 
				rr_priority_to_cs_o_temp = 3'b100; 
			end

		endcase

	end

assign rr_priority_to_cs_o = rr_priority_to_cs_o_temp; 

endmodule
