`timescale 1ns/1ps
`include "../router/flit.sv"
`include "../input_buffer/buffer_stats.sv"
`include "../input_buffer/input_buffer_class.sv"
`include "../arbiter/arbiter_environment.sv"
`include "../arbiter/arbiter_transaction.sv"
`include "../arbiter/arbiter_class.sv"
`include "../router/router_environment.sv"
`include "../router/router_transaction.sv"
`include "../router/router_class.sv"
`include "../../interface.sv"
`include "noc_environment.sv"
`include "noc_transaction.sv"
`include "noc_class.sv"
`include "noc_testbench.sv"
`include "../../NOC/noc.sv"

//`include "noc_stats.sv"


module noc_top();

    bit clk=0;
    always #5 clk = ~clk;
    
    ifc ifc(clk);
    noc dut(ifc.dut);
    noc_testbench bench(ifc.bench);
endmodule
