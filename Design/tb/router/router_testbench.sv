`timescale 1ns/1ps
`include "router_environment.sv"
`include "router_transaction.sv"
`include "router_class.sv"
`include "router_stats.sv"

program router_tb (router_interface.bench ds);

    router_transaction trans;
    router_environment env;
   router_stats stats;
	router_class my_router;
	
    
    initial begin
        env = new();
        $srandom(env.random_seed);
			if(env.auto_config) begin
				env.randomize();
				env.max_cycles = 10000;
			end
        trans = new(env);
        my_router = new(env.x_cor, env.y_cor);
		checker = new(my_router);
        //stats = new();
		repeat(1) begin 
			@(ds.cb)  
			$display("%t\n",$realtime);
			trans.randomize();
			trans.post_randomize();
			trans.reset = 1;
			my_router.update_model(trans);
			trans.updateCC(my_router.sending);
			my_router.updateCC(my_router.sending);
			$display("%d %d\n", trans.n_arb_empty_i_rand, trans.s_arb_empty_i_rand);
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
			$display("north mux %b\n", my_router.n_arb_mux_sel);
			$display("south mux %b\n", my_router.s_arb_mux_sel);
			$display("west mux %b\n", my_router.w_arb_mux_sel);
			$display("east mux %b\n", my_router.e_arb_mux_sel);
			$display("local mux %b\n", my_router.l_arb_mux_sel);
			$display("north demux %b\n", my_router.n_arb_demux_sel);
			$display("south demux %b\n", my_router.s_arb_demux_sel);
			$display("west demux %b\n", my_router.w_arb_demux_sel);
			$display("east demux %b\n", my_router.e_arb_demux_sel);
			$display("local demux %b\n", my_router.l_arb_demux_sel);
			$display("north read %b\n", my_router.n_read);
			$display("south read %b\n", my_router.s_read);
			$display("west read %b\n", my_router.w_read);
			$display("east read %b\n", my_router.e_read);
			$display("local read %b\n", my_router.l_read);
		end
        repeat(5) begin
            @(ds.cb)  
			$display("%t\n",$realtime);
			trans.randomize();
			trans.post_randomize();
			//trans.reset = 1;
			my_router.update_model(trans);
			trans.updateCC(my_router.sending);
			my_router.updateCC(my_router.sending);
			$display("%d %d\n", trans.n_arb_empty_i_rand, trans.s_arb_empty_i_rand);
			$display("%d %d\n", trans.n_arb_credit_i_rand, trans.s_arb_credit_i_rand);
			$display("%d %d\n", env.empty_density, env.credit_density);
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
			$display("north mux %b\n", my_router.n_arb_mux_sel);
			$display("south mux %b\n", my_router.s_arb_mux_sel);
			$display("west mux %b\n", my_router.w_arb_mux_sel);
			$display("east mux %b\n", my_router.e_arb_mux_sel);
			$display("local mux %b\n", my_router.l_arb_mux_sel);
			$display("north demux %b\n", my_router.n_arb_demux_sel);
			$display("south demux %b\n", my_router.s_arb_demux_sel);
			$display("west demux %b\n", my_router.w_arb_demux_sel);
			$display("east demux %b\n", my_router.e_arb_demux_sel);
			$display("local demux %b\n", my_router.l_arb_demux_sel);
			$display("north read %b\n", my_router.n_read);
			$display("south read %b\n", my_router.s_read);
			$display("west read %b\n", my_router.w_read);
			$display("east read %b\n", my_router.e_read);
			$display("local read %b\n", my_router.l_read);
			$display("north credit %d\n", my_router.cc[0]);
			$display("south credit %d\n", my_router.cc[1]);
			$display("west credit %d\n", my_router.cc[2]);
			$display("east credit %d\n", my_router.cc[3]);
			$display("local credit %d\n", my_router.cc[4]);
        end
    end

endprogram
