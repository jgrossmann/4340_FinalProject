`timescale 1ns/1ps

module test_top.sv();

    bit clk = 0;
    always #5 clk = ~clk;
    
    arbiter_interface ifc(clk);
	arbiter dut(ifc.dut);
    arbiter_testbench bench(ifc.bench);
endmodule
