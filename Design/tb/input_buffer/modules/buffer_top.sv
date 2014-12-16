`timescale 1ns/1ps

module test_top();

    bit clk=0;
    always #5 clk = ~clk;
    
    buffer_interface ifc(clk);
   input_buffer_test dut(ifc.dut);
    buffer_testbench bench(ifc.bench);
endmodule
