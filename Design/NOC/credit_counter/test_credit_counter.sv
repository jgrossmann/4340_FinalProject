module test_credit_counter();

	reg clk;
	logic reset;
	logic cc_dec_i;
	logic cc_inc_i;
	logic cc_credit_o;

	always begin
                #5 clk = 1;
                #5 clk = 0;
        end


	credit_counter cc
		(.clk,
		.reset,
		.cc_dec_i,
		.cc_inc_i,
		.cc_credit_o
		);
		
	initial begin
		$vcdpluson
		
		reset = 1;
		
		#5 $display("Resetting\n");
		$display("Credit output: %b\n", cc_credit_o);
	
		cc_dec_i = 1'b0;
		cc_inc_i = 1'b1;
		reset = 1'b0;
		
		#5 $display("Incrementing\n");
		$display("Credit output: %b\n", cc_credit_o);
		
		cc_dec_i = 1'b0;
		cc_inc_i = 1'b1;
		reset = 1'b0;
		
		#5 $display("Incrementing\n");
		$display("Credit output: %b\n", cc_credit_o);
		
		cc_dec_i = 1'b1;
		cc_inc_i = 1'b1;
		reset = 1'b0;
		
		#5 $display("Incrementing and decrementing\n");
		$display("Credit output: %b\n", cc_credit_o);
		
		cc_dec_i = 1'b0;
		cc_inc_i = 1'b0;
		reset = 1'b0;
		
		#5 $display("Nothing\n");
		$display("Credit output: %b\n", cc_credit_o);
		
		cc_dec_i = 1'b1;
		cc_inc_i = 1'b0;
		reset = 1'b0;
		
		#5 $display("Decrementing\n");
		$display("Credit output: %b\n", cc_credit_o);
		
		cc_dec_i = 1'b1;
		cc_inc_i = 1'b0;
		reset = 1'b0;
		
		#5 $display("Decrementing\n");
		$display("Credit output: %b\n", cc_credit_o);
		
		cc_dec_i = 1'b1;
		cc_inc_i = 1'b0;
		reset = 1'b0;
		
		#5 $display("Decrementing\n");
		$display("Credit output: %b\n", cc_credit_o);
		
	end
		
endmodule




















