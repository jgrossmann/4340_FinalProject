module test_priorityencoder();

	logic rr_priority_n_i;
	logic rr_priority_s_i;
	logic rr_priority_w_i;
	logic rr_priority_e_i;
	logic rr_priority_l_i;
	logic [2:0] rr_priority_to_cs_o;
	logic rr_priority_n_o;
	logic rr_priority_s_o;
	logic rr_priority_w_o;
	logic rr_priority_e_o;
	logic rr_priority_l_o;

	priorityencoder pe
		(.rr_priority_n_i,
		.rr_priority_s_i,
		.rr_priority_w_i,
		.rr_priority_e_i,
		.rr_priority_l_i,
		.rr_priority_to_cs_o,
		.rr_priority_n_o,
		.rr_priority_s_o,
		.rr_priority_w_o,
		.rr_priority_e_o,
		.rr_priority_l_o
		);
		
	initial begin
		$vcdpluson;
		
		rr_priority_n_i = 1;
		rr_priority_s_i = 0;
		rr_priority_w_i = 1;
		rr_priority_e_i = 0;
		rr_priority_l_i = 0;
		
		#1 $display("10100\n");
		$display("main output: %b\n", rr_priority_to_cs_o);
		$display("north output %b\n", rr_priority_n_o);
		$display("south output %b\n", rr_priority_s_o);
		$display("west output %b\n", rr_priority_w_o);
		$display("east output %b\n", rr_priority_e_o);
		$display("local output %b\n", rr_priority_l_o);
		
		rr_priority_n_i = 0;
		rr_priority_s_i = 1;
		rr_priority_w_i = 0;
		rr_priority_e_i = 1;
		rr_priority_l_i = 0;
		
		#1 $display("01010\n");
		$display("main output: %b\n", rr_priority_to_cs_o);
		$display("north output %b\n", rr_priority_n_o);
		$display("south output %b\n", rr_priority_s_o);
		$display("west output %b\n", rr_priority_w_o);
		$display("east output %b\n", rr_priority_e_o);
		$display("local output %b\n", rr_priority_l_o);
		
		rr_priority_n_i = 0;
		rr_priority_s_i = 0;
		rr_priority_w_i = 1;
		rr_priority_e_i = 0;
		rr_priority_l_i = 0;
		
		#1 $display("00100\n");
		$display("main output: %b\n", rr_priority_to_cs_o);
		$display("north output %b\n", rr_priority_n_o);
		$display("south output %b\n", rr_priority_s_o);
		$display("west output %b\n", rr_priority_w_o);
		$display("east output %b\n", rr_priority_e_o);
		$display("local output %b\n", rr_priority_l_o);
		
		rr_priority_n_i = 0;
		rr_priority_s_i = 0;
		rr_priority_w_i = 0;
		rr_priority_e_i = 1;
		rr_priority_l_i = 1;
		
		#1 $display("00011\n");
		$display("main output: %b\n", rr_priority_to_cs_o);
		$display("north output %b\n", rr_priority_n_o);
		$display("south output %b\n", rr_priority_s_o);
		$display("west output %b\n", rr_priority_w_o);
		$display("east output %b\n", rr_priority_e_o);
		$display("local output %b\n", rr_priority_l_o);
		
		rr_priority_n_i = 0;
		rr_priority_s_i = 0;
		rr_priority_w_i = 0;
		rr_priority_e_i = 0;
		rr_priority_l_i = 1;
		
		#1 $display("00001\n");
		$display("main output: %b\n", rr_priority_to_cs_o);
		$display("north output %b\n", rr_priority_n_o);
		$display("south output %b\n", rr_priority_s_o);
		$display("west output %b\n", rr_priority_w_o);
		$display("east output %b\n", rr_priority_e_o);
		$display("local output %b\n", rr_priority_l_o);
		
		rr_priority_n_i = 0;
		rr_priority_s_i = 0;
		rr_priority_w_i = 0;
		rr_priority_e_i = 0;
		rr_priority_l_i = 0;
		
		#1 $display("00000\n");
		$display("main output: %b\n", rr_priority_to_cs_o);
		$display("north output %b\n", rr_priority_n_o);
		$display("south output %b\n", rr_priority_s_o);
		$display("west output %b\n", rr_priority_w_o);
		$display("east output %b\n", rr_priority_e_o);
		$display("local output %b\n", rr_priority_l_o);

	
		
	end
		
endmodule




















