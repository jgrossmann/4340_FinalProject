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
`include "../../NOC/arbiter/arbiter.sv"
`include "../../NOC/arbiter/rr_overall/eff_p_to_mux.sv"
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

// Files for input buffer 
`include "../../NOC/input_buffer/ram.sv"
`include "../../NOC/input_buffer/rw_pointer.sv"
`include "../../NOC/input_buffer/input_buffer.sv"
`include "../../NOC/input_buffer/mux_ram.sv"
`include "../../NOC/input_buffer/decoder_ram.sv"
`include "../../NOC/input_buffer/ff_ram.sv"
`include "../../NOC/input_buffer/eff_pointer.sv"

// Files for cross-bar switch 
`include "../../NOC/crossbar_switch/demux/cs_demux_1to5.sv"
`include "../../NOC/crossbar_switch/mux/cs_mux_5to1.sv"
`include "../../NOC/crossbar_switch/crossbar_switch_inner.sv"

// Files for credit-counter 

`include "../../NOC/credit_counter/eff_cc.sv"
`include "../../NOC/credit_counter/credit_counter.sv"

// This is the unit-router module for routers 

`include "../../NOC/unit_router/n_edge_router/n_edge_router.sv"
`include "../../NOC/unit_router/s_edge_router/s_edge_router.sv"
`include "../../NOC/unit_router/w_edge_router/w_edge_router.sv"
`include "../../NOC/unit_router/e_edge_router/e_edge_router.sv"
`include "../../NOC/unit_router/sw_corner_router/sw_corner_router.sv"
`include "../../NOC/unit_router/se_corner_router/se_corner_router.sv"
`include "../../NOC/unit_router/nw_corner_router/nw_corner_router.sv"
`include "../../NOC/unit_router/ne_corner_router/ne_corner_router.sv"
`include "../../NOC/unit_router/inner_router/inner_router.sv"

`include "../../NOC/eff_router_address.sv"
`include "../../NOC/noc.sv"


//`include "noc_stats.sv"


module noc_top();

    bit clk=0;
    always #5 clk = ~clk;
    
    ifc ifc(clk);
    noc dut(ifc.dut);
    noc_testbench bench(ifc.bench);
endmodule
