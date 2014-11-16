`timescale 1ns/1ps
`include "interface.sv"
`include "NOC/noc.sv"
`include "tb/bench.sv"

module top();
	bit clk = 0;
	always #5 clk = ~clk;

	initial $vcdpluson;

	ifc ifc(clk); // instantiate the interface file
	noc dut(ifc.dut); 
	tb bench(ifc.bench);
endmodule