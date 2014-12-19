`timescale 1ns/1ps
`include "arbiter_interface.sv"
`include "arbiter_testbench.sv"
`include "../../NOC/arbiter/arbiter_test.sv"
`include "../../NOC/arbiter/rr_overall/rr_comparator/n_rr_comparator.sv" 
`include "../../NOC/arbiter/rr_overall/rr_comparator/s_rr_comparator.sv" 
`include "../../NOC/arbiter/rr_overall/rr_comparator/w_rr_comparator.sv" 
`include "../../NOC/arbiter/rr_overall/rr_comparator/e_rr_comparator.sv" 
`include "../../NOC/arbiter/rr_overall/rr_comparator/l_rr_comparator.sv" 
`include "../../NOC/arbiter/rr_overall/priorityencoder.sv" 
`include "../../NOC/arbiter/rr_overall/priorityencoder_to_mux.sv" 
`include "../../NOC/arbiter/rr_overall/mux_5to1.sv" 
`include "../../NOC/arbiter/rr_overall/mux_5to1_1bit.sv" 

`include "../../NOC/arbiter/rr_overall/rr_register/eff_rr_0001.sv" 
`include "../../NOC/arbiter/rr_overall/rr_register/rr_register_0001.sv" 
`include "../../NOC/arbiter/rr_overall/rr_register/eff_rr_0010.sv" 
`include "../../NOC/arbiter/rr_overall/rr_register/rr_register_0010.sv" 
`include "../../NOC/arbiter/rr_overall/rr_register/eff_rr_0100.sv" 
`include "../../NOC/arbiter/rr_overall/rr_register/rr_register_0100.sv" 
`include "../../NOC/arbiter/rr_overall/rr_register/eff_rr_1000.sv" 
`include "../../NOC/arbiter/rr_overall/rr_register/rr_register_1000.sv" 
`include "../../NOC/arbiter/rr_overall/eff_p_to_mux.sv" 

`include "../../NOC/arbiter/rr_overall/n_rr_processor.sv" 
`include "../../NOC/arbiter/rr_overall/s_rr_processor.sv" 
`include "../../NOC/arbiter/rr_overall/w_rr_processor.sv" 
`include "../../NOC/arbiter/rr_overall/e_rr_processor.sv" 
`include "../../NOC/arbiter/rr_overall/l_rr_processor.sv" 

`include "../../NOC/arbiter/nexthop_register/enable_eff_nr.sv"
`include "../../NOC/arbiter/nexthop_register/n_nexthop_register.sv" 
`include "../../NOC/arbiter/nexthop_register/s_nexthop_register.sv" 
`include "../../NOC/arbiter/nexthop_register/w_nexthop_register.sv" 
`include "../../NOC/arbiter/nexthop_register/e_nexthop_register.sv" 
`include "../../NOC/arbiter/nexthop_register/l_nexthop_register.sv" 
`include "../../NOC/arbiter/yx_processor/yx_processor.sv" 

`include "../../NOC/arbiter/packet_tracker/packet_tracker.sv" 
`include "../../NOC/arbiter/packet_tracker/eff_pt.sv" 

module arbiter_top();

    bit clk = 0;
    always #5 clk = ~clk;
    
    arbiter_interface ifc(clk);
	arbiter_test dut(ifc.dut);
    arbiter_tb bench(ifc.bench);
endmodule
