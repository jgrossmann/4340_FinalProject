module rw_pointer_test();

	bit clk;
	always begin
		#5 clk = 0;
		#5 clk = 1;
	end
	logic read;
	logic [2:0] read_addr;
	bit reset;

	rw_pointer readptr(.clk, .reset, .rwptr_inc_i(read), .rwptr_addr_o(read_addr));

	initial begin
		$vcdpluson;
		reset = 1;
		read = 1;
		#15;
		reset = 0;
		#50;
		$display("Resetting read pointer");
		$display("Address output: %b\n", read_addr);
		$finish;
	end

endmodule
