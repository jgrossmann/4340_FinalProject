`timescale 1ns/1ps
`include "arbiter_interface.sv"
`include "arbiter_testbench.sv"

module arbiter_top();

    bit clk = 0;
    always #5 clk = ~clk;
    
    arbiter_interface ifc(clk);
	//arbiter dut(ifc.dut);
    arbiter_tb bench(ifc.bench);
endmodule
