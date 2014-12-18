`timescale 1ns/1ps
`include "flit.sv"
`include "../input_buffer/buffer_stats.sv"
`include "../input_buffer/input_buffer_class.sv"
`include "../arbiter/arbiter_environment.sv"
`include "../arbiter/arbiter_transaction.sv"
`include "../arbiter/arbiter_class.sv"
`include "router_interface.sv"
`include "router_environment.sv"
`include "router_transaction.sv"
`include "router_class.sv"
`include "router_testbench.sv"

//`include "router_stats.sv"


module router_top();

    bit clk=0;
    always #5 clk = ~clk;
    
    router_interface ifc(clk);
    //router dut(ifc.dut);
    router_testbench bench(ifc.bench);
endmodule
