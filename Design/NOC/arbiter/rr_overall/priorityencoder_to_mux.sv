
module priorityencoder_to_mux(
		input clk,
	    input rr_priority_n_i, 
        input rr_priority_s_i, 
        input rr_priority_w_i, 
        input rr_priority_e_i, 
        input rr_priority_l_i,
		input rr_change_order_i,
        output [2:0] rr_priority_to_cs_o
);

logic [4:0] rr_priority_i_temp; 

logic [2:0] rr_priority_to_cs_o_temp; 

logic [4:0] data_i_temp; 
logic [4:0] data_o_temp; 
 
 eff_p_to_mux #(.DATA_WIDTH(5)) ff (
	
 	.clk(clk),
 	.data_o(data_o_temp),
 	.data_i(data_i_temp)
 	);

 always_comb begin

 rr_priority_i_temp [4] = rr_priority_n_i;
 rr_priority_i_temp [3] = rr_priority_s_i; 
 rr_priority_i_temp [2] = rr_priority_w_i; 
 rr_priority_i_temp [1] = rr_priority_e_i;
 rr_priority_i_temp [0] = rr_priority_l_i;  
 

 if(rr_change_order_i | (rr_priority_i_temp == 5'b00000)) begin
 	data_i_temp = 5'b11111;
// end else begin
//	data_i_temp = data_o_temp;
 end
 
 
 		rr_priority_i_temp = rr_priority_i_temp & data_o_temp;
		casex (rr_priority_i_temp)
			5'b1xxxx:  begin 
				rr_priority_to_cs_o_temp = 3'b000; 
				data_i_temp = 5'b10000;
			end 

			5'b01xxx:  begin 
				rr_priority_to_cs_o_temp = 3'b001;
				data_i_temp = 5'b01000; 
			end

            5'b001xx:  begin 
				rr_priority_to_cs_o_temp = 3'b010;
				data_i_temp = 5'b00100; 
			end

 			5'b0001x:  begin 
				rr_priority_to_cs_o_temp = 3'b011;
				data_i_temp = 5'b00010; 
			end

			5'b00001:  begin 
				rr_priority_to_cs_o_temp = 3'b100;
				data_i_temp = 5'b00001;
			end
			
			5'b00000:  begin 
				rr_priority_to_cs_o_temp = 3'bxxx;
				data_i_temp = 5'b11111; 
			end

		endcase

end 

assign rr_priority_to_cs_o = rr_priority_to_cs_o_temp; 

endmodule
