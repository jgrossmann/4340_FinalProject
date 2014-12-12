
module priorityencoder(

	    input rr_priority_n_i, 
        input rr_priority_s_i, 
        input rr_priority_w_i, 
        input rr_priority_e_i, 
        input rr_priority_l_i,
        output rr_priority_to_cs_o,
	    output rr_priority_n_o,
        output rr_priority_s_o, 
        output rr_priority_w_o, 
        output rr_priority_e_o, 
        output rr_priority_l_o
);

logic [4:0] rr_priority_i_temp; 
 
logic [4:0] rr_priority_o_temp ; 
logic rr_priority_to_cs_o_temp; 

	always_comb begin

 rr_priority_i_temp [4] = rr_priority_n_i; 
 rr_priority_i_temp [3] = rr_priority_s_i; 
 rr_priority_i_temp [2] = rr_priority_w_i; 
 rr_priority_i_temp [1] = rr_priority_e_i;
 rr_priority_i_temp [0] = rr_priority_l_i;  

		casex (rr_priority_i_temp)
			5'b1xxxx:  begin 
 				rr_priority_o_temp =5'b10000;
				rr_priority_to_cs_o_temp = 3'b000; 
			end 

			5'b01xxx:  begin 
				rr_priority_o_temp =5'b01000;
				rr_priority_to_cs_o_temp = 3'b001; 
			end

                        5'b001xx:  begin 
				rr_priority_o_temp =5'b00100;
				rr_priority_to_cs_o_temp = 3'b010; 
			end

 			5'b0001x:  begin 
				rr_priority_o_temp =5'b00010;
				rr_priority_to_cs_o_temp = 3'b011; 
			end

			5'b00001:  begin 
				rr_priority_o_temp =5'b00001;
				rr_priority_to_cs_o_temp = 3'b100; 
			end

		endcase

	end

assign rr_priority_n_o = rr_priority_o_temp [4];
assign rr_priority_s_o = rr_priority_o_temp [3];
assign rr_priority_w_o = rr_priority_o_temp [2];
assign rr_priority_e_o = rr_priority_o_temp [1];
assign rr_priority_l_o = rr_priority_o_temp [0];
assign rr_priority_to_cs_o = rr_priority_to_cs_o_temp; 

endmodule
