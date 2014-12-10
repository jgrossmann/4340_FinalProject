`timescale 1ns/1ps
`include "arbiter_environment.sv"
`include "arbiter_transaction.sv"
`include "arbiter_class.sv"
program arbiter_tb (arbiter_interface.bench ds);

    arbiter_transaction trans;
    //arbiter_checker golden_model;
    arbiter_environment env;
    //arbiter_stats stats;
	arbiter_class my_arbiter;
	
    
    initial begin
        env = new();
        $srandom(env.random_seed);
		env.randomize();
        trans = new(env);
        //golden_model = new();
        my_arbiter = new(env.x_cor, env.y_cor);
        //stats = new();
		repeat(1) begin 
		
		end
        repeat(10) begin
            @(ds.cb)  
			$display("%t\n",$realtime);
			trans.randomize();
			//trans.reset = 1;
			my_arbiter.update_model(trans);
			trans.updateCC(my_arbiter.sending);
			$display("x location = %d\n", env.x_cor);
			$display("y location = %d\n", env.y_cor);
			$display("Inputs:\n");
			$display("north empty %b\n", trans.n_arb_empty_i);
			$display("south empty %b\n", trans.s_arb_empty_i);
			$display("west empty %b\n", trans.w_arb_empty_i);
			$display("east empty %b\n", trans.e_arb_empty_i);
			$display("local empty %b\n", trans.l_arb_empty_i);
			$display("north credit %b\n", trans.n_arb_credit_i);
			$display("south credit %b\n", trans.s_arb_credit_i);
			$display("west credit %b\n", trans.w_arb_credit_i);
			$display("east credit %b\n", trans.e_arb_credit_i);
			$display("local credit %b\n", trans.l_arb_credit_i);
			$display("north address %b\n", trans.n_arb_address_i);
			$display("south address %b\n", trans.s_arb_address_i);
			$display("west address %b\n", trans.w_arb_address_i);
			$display("east address %b\n", trans.e_arb_address_i);
			$display("local address %b\n", trans.l_arb_address_i);
			$display("Results:\n");
			$display("north mux %b\n", my_arbiter.n_arb_mux_sel);
			$display("south mux %b\n", my_arbiter.s_arb_mux_sel);
			$display("west mux %b\n", my_arbiter.w_arb_mux_sel);
			$display("east mux %b\n", my_arbiter.e_arb_mux_sel);
			$display("local mux %b\n", my_arbiter.l_arb_mux_sel);
			$display("north demux %b\n", my_arbiter.n_arb_demux_sel);
			$display("south demux %b\n", my_arbiter.s_arb_demux_sel);
			$display("west demux %b\n", my_arbiter.w_arb_demux_sel);
			$display("east demux %b\n", my_arbiter.e_arb_demux_sel);
			$display("local demux %b\n", my_arbiter.l_arb_demux_sel);
			$display("north read %b\n", my_arbiter.n_read);
			$display("south read %b\n", my_arbiter.s_read);
			$display("west read %b\n", my_arbiter.w_read);
			$display("east read %b\n", my_arbiter.e_read);
			$display("local read %b\n", my_arbiter.l_read);
			
        end
    end

endprogram
