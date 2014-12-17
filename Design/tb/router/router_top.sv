`timescale 1ns/1ps
`include "router_testbench.sv"


module test_top();

    bit clk=0;
    always #5 clk = ~clk;
    
    router_interface ifc(clk);
    router dut(ifc.dut);
    router_testbench bench(ifc.bench);
endmodule
