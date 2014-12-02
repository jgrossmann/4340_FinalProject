`timescale 1ns/1ps

// testbench program
program tb (ifc.bench ds);

	transaction trans;
	checker golden_model;
	network noc;
	environment env;
	initial begin
		env = new();
		trans = new(env);
		golden_model = new();
		noc = new();
		repeat(10000) begin
			@(ds.cb);
			$display("%t\n",$realtime);
		end
	end

endprogram
