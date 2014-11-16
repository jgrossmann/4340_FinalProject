`timescale 1ns/1ps

// testbench program
program tb (ifc.bench ds);

	initial begin
		repeat(10000) begin
			$display("%t\n",$realtime);
		end
	end

endprogram