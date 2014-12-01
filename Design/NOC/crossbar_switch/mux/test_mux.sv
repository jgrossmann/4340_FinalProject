module test_mux();

	logic [2:0] sel_i;
	logic [15:0] data_n_i;
	logic [15:0] data_s_i;
	logic [15:0] data_w_i;
	logic [15:0] data_e_i;
	logic [15:0] data_l_i;
	logic [15:0] data_o;

	mux_5to1 mux
		(.sel_i,
		.data_n_i,
		.data_s_i,
		.data_w_i,
		.data_e_i,
		.data_l_i,
		.data_o
		);

	initial begin
		$vcdpluson;
		data_n_i = 16'b0000000000000001;
		data_s_i = 16'b0000000000000010;
		data_w_i = 16'b0000000000000100;
		data_e_i = 16'b0000000000001000;
		data_l_i = 16'b0000000000010000;
		$display("Setting Data\n");
		$display("North: %b\n, South: %b\n, West: %b\n, East: %b\n, Local: %b\n", data_n_i, data_s_i, data_w_i, data_e_i, data_l_i);	
		$display("Mux outputs based on select:");
		$display("North: 000\n South: 001\n West: 010\n East: 011\n Local: 100\n");
		
		sel_i = 3'b000;
		#5 $display("Setting select: %b\n", sel_i);
		$display("Output: %b\n", data_o);

		sel_i = 3'b001;
		#5 $display("Setting select: %b\n", sel_i);
      $display("Output: %b\n", data_o);

		sel_i = 3'b010;
		#5 $display("Setting select: %b\n", sel_i);
      $display("Output: %b\n", data_o);

		sel_i = 3'b011;
		#5 $display("Setting select: %b\n", sel_i);
      $display("Output: %b\n", data_o);

		sel_i = 3'b100;
		#5 $display("Setting select: %b\n", sel_i);
      $display("Output: %b\n", data_o);

		data_n_i = 16'b1111111111111111;
		sel_i = 3'b000;
		#5 $display("Setting North data as 1111111111111111"); 
		$display("Setting select: %b\n", sel_i);
      $display("Output: %b\n", data_o);

	end

endmodule
