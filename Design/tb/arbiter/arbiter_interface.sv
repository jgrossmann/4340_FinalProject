interface arbiter_interface(input bit clk);

    logic reset;
    logic [7:0] n_arb_address_i;
	logic [7:0] s_arb_address_i;
	logic [7:0] e_arb_address_i;
	logic [7:0] w_arb_address_i;
	logic [7:0] l_arb_address_i;
	logic n_arb_empty_i;
	logic s_arb_empty_i;
	logic e_arb_empty_i;
	logic w_arb_empty_i;
	logic l_arb_empty_i;
	logic n_arb_credit_i;
	logic s_arb_credit_i;
	logic e_arb_credit_i;
	logic w_arb_credit_i;
	logic l_arb_credit_i;
	logic [7:0] yx_pos_i;
	logic n_arb_dec_o;
	logic s_arb_dec_o;
	logic e_arb_dec_o;
	logic w_arb_dec_o;
	logic l_arb_dec_o;
	logic [2:0] n_arb_mux_sel_o; //where is it coming from
	logic [2:0] s_arb_mux_sel_o;
	logic [2:0] e_arb_mux_sel_o;
	logic [2:0] w_arb_mux_sel_o;
	logic [2:0] l_arb_mux_sel_o;
	logic [2:0] n_arb_demux_sel_o; //where it is going to
	logic [2:0] s_arb_demux_sel_o;
	logic [2:0] e_arb_demux_sel_o;
	logic [2:0] w_arb_demux_sel_o;
	logic [2:0] l_arb_demux_sel_o;
	logic n_arb_read_o;
	logic s_arb_read_o;
	logic e_arb_read_o;
	logic w_arb_read_o;
	logic l_arb_read_o;
	
    clocking cb @(posedge clk);
        output reset;
        output n_arb_address_i;
		output s_arb_address_i;
		output e_arb_address_i;
		output w_arb_address_i;
		output l_arb_address_i;
		output n_arb_empty_i;
		output s_arb_empty_i;
		output e_arb_empty_i;
		output w_arb_empty_i;
		output l_arb_empty_i;
		output n_arb_credit_i;
		output s_arb_credit_i;
		output e_arb_credit_i;
		output w_arb_credit_i;
		output l_arb_credit_i;
		output yx_pos_i;
		input n_arb_dec_o;
		input s_arb_dec_o;
		input e_arb_dec_o;
		input w_arb_dec_o;
		input l_arb_dec_o;
		input n_arb_mux_sel_o;
		input s_arb_mux_sel_o;
		input e_arb_mux_sel_o;
		input w_arb_mux_sel_o;
		input l_arb_mux_sel_o;
		input n_arb_demux_sel_o;
		input s_arb_demux_sel_o;
		input e_arb_demux_sel_o;
		input w_arb_demux_sel_o;
		input l_arb_demux_sel_o;
		input n_arb_read_o;
		input s_arb_read_o;
		input e_arb_read_o;
		input w_arb_read_o;
		input l_arb_read_o;
    endclocking

    modport bench(clocking cb);
    modport dut (
        input clk,
        input reset,
		input n_arb_address_i,
		input s_arb_address_i,
		input e_arb_address_i,
		input w_arb_address_i,
		input l_arb_address_i,
		input n_arb_empty_i,
		input s_arb_empty_i,
		input e_arb_empty_i,
		input w_arb_empty_i,
		input l_arb_empty_i,
		input n_arb_credit_i,
		input s_arb_credit_i,
		input e_arb_credit_i,
		input w_arb_credit_i,
		input l_arb_credit_i,
		input yx_pos_i,
		output n_arb_dec_o,
		output s_arb_dec_o,
		output e_arb_dec_o,
		output w_arb_dec_o,
		output l_arb_dec_o,
		output n_arb_mux_sel_o,
		output s_arb_mux_sel_o,
		output e_arb_mux_sel_o,
		output w_arb_mux_sel_o,
		output l_arb_mux_sel_o,
		output n_arb_demux_sel_o,
		output s_arb_demux_sel_o,
		output e_arb_demux_sel_o,
		output w_arb_demux_sel_o,
		output l_arb_demux_sel_o,
		output n_arb_read_o,
		output s_arb_read_o,
		output e_arb_read_o,
		output w_arb_read_o,
		output l_arb_read_o
    );

endinterface
