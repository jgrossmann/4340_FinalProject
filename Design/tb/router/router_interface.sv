interface ifc (input bit clk);
	logic reset;
	logic n_valid_i;
	logic s_valid_i;
	logic w_valid_i;
	logic e_valid_i;
	logic l_valid_i;
	logic n_valid_o;
	logic s_valid_o;
	logic w_valid_o;
	logic e_valid_o;
	logic l_valid_o;
	logic n_credit_i;
	logic s_credit_i;
	logic w_credit_i;
	logic e_credit_i;
	logic l_credit_i;
	logic n_credit_o;
	logic s_credit_o;
	logic w_credit_o;
	logic e_credit_o;
	logic l_credit_o;
	logic [15:0] n_data_i;
	logic [15:0] s_data_i;
	logic [15:0] w_data_i;
	logic [15:0] e_data_i;
	logic [15:0] l_data_i;
	logic [15:0] n_data_o;
	logic [15:0] s_data_o;
	logic [15:0] w_data_o;
	logic [15:0] e_data_o;
	logic [15:0] l_data_o;
	logic [15:0] yx_addr_router_i;

	clocking cb @(posedge clk);
	
	output reset;
	output yx_addr_router_i;
	output n_data_i;
	output s_data_i;
	output w_data_i;
	output e_data_i;
	output l_data_i;
	output n_valid_i;
	output s_valid_i;
	output w_valid_i;
	output e_valid_i;
	output l_valid_i;
	output n_credit_i;
	output s_credit_i;
	output w_credit_i;
	output e_credit_i;
	output l_credit_i;
	input n_data_o;
	input s_data_o;
	input w_data_o;
	input e_data_o;
	input l_data_o;
	input n_valid_o;
	input s_valid_o;
	input w_valid_o;
	input e_valid_o;
	input l_valid_o;
	input n_credit_o;
	input s_credit_o;
	input w_credit_o;
	input e_credit_o;
	input l_credit_o;
	
	endclocking

	modport bench (clocking cb);

	modport dut (
		input yx_addr_router_i,
		input clk,
		input reset,
		input n_data_i,
		input s_data_i,
		input w_data_i,
		input e_data_i,
		input l_data_i,
		input n_valid_i,
		input s_valid_i,
		input w_valid_i,
		input e_valid_i,
		input l_valid_i,
		input n_credit_i,
		input s_credit_i,
		input w_credit_i,
		input e_credit_i,
		input l_credit_i,
		output n_data_o,
		output s_data_o,
		output w_data_o,
		output e_data_o,
		output l_data_o,
		output n_valid_o,
		output s_valid_o,
		output w_valid_o,
		output e_valid_o,
		output l_valid_o,
		output n_credit_o,
		output s_credit_o,
		output w_credit_o,
		output e_credit_o,
		output l_credit_o
	);

endinterface
