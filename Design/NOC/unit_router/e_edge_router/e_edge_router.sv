module e_edge_router
(
	input [15 : 0] n_data_i,
	input [15 : 0] s_data_i,
	input [15 : 0] w_data_i,
	input [15 : 0] l_data_i,
	input n_valid_i,
	input s_valid_i,
	input w_valid_i,
	input l_valid_i,
	input n_credit_i,
	input s_credit_i,
	input w_credit_i,
	input l_credit_i,
	output [15 : 0] n_data_o,
	output [15 : 0] s_data_o,
	output [15 : 0] w_data_o,
	output [15 : 0] l_data_o,
	output n_valid_o,
	output s_valid_o,
	output w_valid_o,
	output l_valid_o,
	output n_credit_o,
	output s_credit_o,
	output w_credit_o,
	output l_credit_o,
	input clk,
	input reset
);

endmodule
