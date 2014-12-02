module test_yx_processor();

	logic [7:0] yx_addr_header_i;
	logic [7:0] yx_addr_router_i;
	logic [2:0] yx_addr_o;
	
	yx_processor yx
		(.yx_addr_header_i,
		.yx_addr_router_i,
		.yx_addr_o
		);
		
	initial begin
		$vcdpluson;
		
		yx_addr_header_i = 8'b00000000;
		yx_addr_router_i = 8'b01000000;
		
		#5
		$display("From (2,0) to (0,0)\n");
		$display("Next hop: %b\n", yx_addr_o);
		
		yx_addr_header_i = 8'b00000000;
		yx_addr_router_i = 8'b10001000;
		
		#5
		$display("From (0,0) to (3,3)\n");
		$display("Next hop: %b\n", yx_addr_o);
		
		
	end
	
endmodule