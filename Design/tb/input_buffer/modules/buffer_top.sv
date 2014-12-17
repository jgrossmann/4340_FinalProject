`timescale 1ns/1ps

module test_top();

    bit clk=1;
    always begin
	  	#5 clk = 0;
		#5 clk = 1;
	end
    
    buffer_interface ifc(clk);
   input_buffer_test dut(ifc.dut);
    buffer_testbench bench(ifc.bench);
endmodule
