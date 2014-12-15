`include "../arbiter/rr_overall/rr_comparator/n_rr_comparator.sv" 
`include "../arbiter/rr_overall/rr_comparator/s_rr_comparator.sv" 
`include "../arbiter/rr_overall/rr_comparator/w_rr_comparator.sv" 
`include "../arbiter/rr_overall/rr_comparator/e_rr_comparator.sv" 
`include "../arbiter/rr_overall/rr_comparator/l_rr_comparator.sv" 
`include "../arbiter/rr_overall/priorityencoder.sv" 
`include "../arbiter/rr_overall/priorityencoder_to_mux.sv" 
`include "../arbiter/rr_overall/mux_5to1.sv" 
`include "../arbiter/rr_overall/mux_5to1_1bit.sv" 

`include ".././arbiter/rr_overall/rr_register/eff_rr_0001.sv" 
`include ".././arbiter/rr_overall/rr_register/rr_register_0001.sv" 
`include ".././arbiter/rr_overall/rr_register/eff_rr_0010.sv" 
`include ".././arbiter/rr_overall/rr_register/rr_register_0010.sv" 
`include ".././arbiter/rr_overall/rr_register/eff_rr_0100.sv" 
`include ".././arbiter/rr_overall/rr_register/rr_register_0100.sv" 
`include ".././arbiter/rr_overall/rr_register/eff_rr_1000.sv" 
`include ".././arbiter/rr_overall/rr_register/rr_register_1000.sv" 

`include ".././arbiter/rr_overall/n_rr_processor.sv" 
`include ".././arbiter/rr_overall/s_rr_processor.sv" 
`include ".././arbiter/rr_overall/w_rr_processor.sv" 
`include ".././arbiter/rr_overall/e_rr_processor.sv" 
`include ".././arbiter/rr_overall/l_rr_processor.sv" 

`include ".././arbiter/nexthop_register/enable_eff_nr.sv"
`include ".././arbiter/nexthop_register/nexthop_register.sv" 
`include ".././arbiter/yx_processor/yx_processor.sv" 

`include ".././arbiter/packet_tracker/packet_tracker.sv" 
`include ".././arbiter/packet_tracker/eff_pt.sv" 


module inner_router
(
	input [15 : 0] n_data_i,
	input [15 : 0] e_data_i,
	input [15 : 0] s_data_i,
	input [15 : 0] w_data_i,
	input [15 : 0] l_data_i,
	input n_valid_i,
	input e_valid_i,
	input s_valid_i,
	input w_valid_i,
	input l_valid_i,
	input n_credit_i,
	input e_credit_i,
	input s_credit_i,
	input w_credit_i,
	input l_credit_i,
	output [15 : 0] n_data_o,
	output [15 : 0] e_data_o,
	output [15 : 0] s_data_o,
	output [15 : 0] w_data_o,
	output [15 : 0] l_data_o,
	output n_valid_o,
	output e_valid_o,
	output s_valid_o,
	output w_valid_o,
	output l_valid_o,
	output n_credit_o,
	output e_credit_o,
	output s_credit_o,
	output w_credit_o,
	output l_credit_o,
	input clk,
	input reset
);

endmodule
