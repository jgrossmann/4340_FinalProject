module test_packet_tracker();

	reg clk;
	logic reset;
	logic pt_inc_i; 
	logic pt_end_o;
	
	always begin
        #5 clk = 1;
        #5 clk = 0;
    end
	
	packet_tracker pt
		(.clk,
		.reset,
		.pt_inc_i,
		.pt_end_o
		);
		
	initial begin
		$vcdpluson;
		
		reset = 1;
		
		#10 $display("Resetting\n");
		$display("Output: %b\n", pt_end_o);
		
		pt_inc_i = 1;
		reset = 0;
		
		#10 $display("Incrementing\n");
		$display("Output: %b\n", pt_end_o);
		
		pt_inc_i = 1;
		
		#10 $display("Incrementing\n");
		$display("Output: %b\n", pt_end_o);
		
		pt_inc_i = 1;
		
		#10 $display("Incrementing\n");
		$display("Output: %b\n", pt_end_o);
		
		pt_inc_i = 1;
		
		#10 $display("Incrementing\n");
		$display("Output: %b\n", pt_end_o);
		
		pt_inc_i = 1;
		
		#10 $display("Incrementing\n");
		$display("Output: %b\n", pt_end_o);
		
		pt_inc_i = 1;
		
		#10 $display("Incrementing\n");
		$display("Output: %b\n", pt_end_o);
		reset = 1;
		pt_inc_i = 1;
		
		#10 $display("Resetting\n");
		$display("Output: %b\n", pt_end_o);
		reset = 0;
		pt_inc_i = 1;
		
		#10 $display("Incrementing\n");
		$display("Output: %b\n", pt_end_o);
		
		pt_inc_i = 1;
		
		#10 $display("Incrementing\n");
		$display("Output: %b\n", pt_end_o);
		
		pt_inc_i = 1;
		
		#10 $display("Incrementing\n");
		$display("Output: %b\n", pt_end_o);
		
		pt_inc_i = 1;
		
		#10 $display("Incrementing\n");
		$display("Output: %b\n", pt_end_o);
		
		pt_inc_i = 1;
		
		#10 $display("Incrementing\n");
		$display("Output: %b\n", pt_end_o);
		
		$finish;
		
	end
	
endmodule