`timescale 1ns/1ps
`include "transaction.sv"
`include "checker.sv"
`include "noc_class.sv"
`include "environment.sv"
`include "flit.sv"

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
