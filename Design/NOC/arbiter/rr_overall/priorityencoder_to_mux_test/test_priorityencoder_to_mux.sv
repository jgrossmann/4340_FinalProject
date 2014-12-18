module test_priorityencoder_to_mux();

	logic rr_priority_n_i;
	logic rr_priority_s_i;
	logic rr_priority_w_i;
	logic rr_priority_e_i;
	logic rr_priority_l_i;
	logic [2:0] rr_priority_to_cs_o;


	priorityencoder_to_mux pem
		(.rr_priority_n_i,
		.rr_priority_s_i,
		.rr_priority_w_i,
		.rr_priority_e_i,
		.rr_priority_l_i,
		.rr_priority_to_cs_o
		);
		
	initial begin
		$vcdpluson;
		
		rr_priority_n_i = 1;
		rr_priority_s_i = 0;
		rr_priority_w_i = 1;
		rr_priority_e_i = 0;
		rr_priority_l_i = 0;
		
		#1 $display("10100\n");
		$display("output: %b\n", rr_priority_to_cs_o);
		
		rr_priority_n_i = 0;
		rr_priority_s_i = 1;
		rr_priority_w_i = 0;
		rr_priority_e_i = 1;
		rr_priority_l_i = 0;
		
		#1 $display("01010\n");
		$display("output: %b\n", rr_priority_to_cs_o);
		
		rr_priority_n_i = 0;
		rr_priority_s_i = 0;
		rr_priority_w_i = 1;
		rr_priority_e_i = 0;
		rr_priority_l_i = 0;
		
		#1 $display("00100\n");
		$display("output: %b\n", rr_priority_to_cs_o);
		
		rr_priority_n_i = 0;
		rr_priority_s_i = 0;
		rr_priority_w_i = 0;
		rr_priority_e_i = 1;
		rr_priority_l_i = 1;
		
		#1 $display("00011\n");
		$display("output: %b\n", rr_priority_to_cs_o);
		
		rr_priority_n_i = 0;
		rr_priority_s_i = 0;
		rr_priority_w_i = 0;
		rr_priority_e_i = 0;
		rr_priority_l_i = 1;
		
		#1 $display("00001\n");
		$display("output: %b\n", rr_priority_to_cs_o);
		
		rr_priority_n_i = 0;
		rr_priority_s_i = 0;
		rr_priority_w_i = 0;
		rr_priority_e_i = 0;
		rr_priority_l_i = 0;
		
		#1 $display("00000\n");
		$display("output: %b\n", rr_priority_to_cs_o);

	
		
	end
		
endmodule




















