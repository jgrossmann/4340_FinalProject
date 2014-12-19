module test_nexthop_register();

	reg clk;
	logic reset;
	logic nhr_address_i;
	logic nhr_write_i;
	logic nhr_address_o;
	
	always begin
        #5 clk = 1;
        #5 clk = 0;
    end
	
	nexthop_register nr
		(.clk,
		.reset,
		.nhr_address_i,
		.nhr_write_i,
		.nhr_address_o
	);
		
	initial begin
		$vcdpluson;
		
		reset = 1;
		
		#10 $display("Resetting\n");
		$display("Output: %b\n", nhr_address_o);
		
		reset = 0;
		nhr_address_i = 3'b011;
		nhr_write_i = 1;
		
		#10 $display("Writing east\n");
		$display("Output: %b\n", nhr_address_o);
		
		#10 $display("Nothing\n");
		$display("Output: %b\n", nhr_address_o);

		$finish;

	end
	


endmodule	
	    