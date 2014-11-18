`timescale 1ns/1ps
`include "tb/transaction.sv"
`include "tb/checker.sv"
`include "tb/noc_class.sv"
`include "tb/environment.sv"

// testbench program
program tb (ifc.bench ds);

	transaction trans;
	checker golden_model;
	network noc;
	environment env;
	initial begin
		trans = new();
		golden_model = new();
		noc = new();
		repeat(10000) begin
			@(ds.cb);
			$display("%t\n",$realtime);
		end
	end

endprogram
