`timescale 1ns/1ps
`include "arbiter_environment.sv"
`include "arbiter_transaction.sv"
`include "arbiter_class.sv"
program arbiter_tb (arbiter_interface.bench ds);

    arbiter_transaction trans;
    //arbiter_checker checker;
    arbiter_environment env;
    //arbiter_stats stats;
	arbiter_class my_arbiter;
	
    
    initial begin
        env = new();
        $srandom(env.random_seed);
		env.randomize();
        trans = new(env);
        my_arbiter = new();
		//checker = new(my_arbiter);
        //stats = new();
		repeat(1) begin 
			$display("Inputs:\n");
			$display("Tokens before inputs");
			$display("north token:");
			printNextHop((my_arbiter.token[0]+1)%5);
			$display("south token:");
			printNextHop((my_arbiter.token[1]+1)%5);
			$display("west token:");
			printNextHop((my_arbiter.token[2]+1)%5);
			$display("east token:");
			printNextHop((my_arbiter.token[3]+1)%5);
			$display("local token:");
			printNextHop((my_arbiter.token[4]+1)%5);
			trans.randomize();
			//trans.post_randomize();
			trans.reset = 1;
			my_arbiter.update_model(trans);
			ds.cb.reset <= trans.reset;
			ds.cb.n_arb_address_i[7:0] <= trans.n_arb_address_i;
			ds.cb.s_arb_address_i[7:0] <= trans.s_arb_address_i;
			ds.cb.e_arb_address_i[7:0] <= trans.w_arb_address_i;
			ds.cb.w_arb_address_i[7:0] <= trans.e_arb_address_i;
			ds.cb.l_arb_address_i[7:0] <= trans.l_arb_address_i;
			ds.cb.n_arb_empty_i <= trans.n_arb_empty_i;
			ds.cb.s_arb_empty_i <= trans.s_arb_empty_i;
			ds.cb.e_arb_empty_i <= trans.w_arb_empty_i;
			ds.cb.w_arb_empty_i <= trans.e_arb_empty_i;
			ds.cb.l_arb_empty_i <= trans.l_arb_empty_i;
			ds.cb.n_arb_credit_i <= trans.n_arb_credit_i;
			ds.cb.s_arb_credit_i <= trans.s_arb_credit_i;
			ds.cb.e_arb_credit_i <= trans.w_arb_credit_i;
			ds.cb.w_arb_credit_i <= trans.e_arb_credit_i;
			ds.cb.l_arb_credit_i <= trans.l_arb_credit_i;
			ds.cb.yx_pos_i[7:0] <= trans.yx_pos;
			trans.updateCC(my_arbiter.dec);
			@(ds.cb)  
			@(ds.cb)  
			$display("%t\n",$realtime);
			
			//my_arbiter.updateCC(my_arbiter.sending);
			//$display("%d %d\n", trans.n_arb_empty_i_rand, trans.s_arb_empty_i_rand);
			$display("x location = %d\n", env.x_cor);
			$display("y location = %d\n", env.y_cor);
			$display("reset %b\n", trans.reset);
			$display("north input empty %b\n", trans.n_arb_empty_i);
			$display("south input empty %b\n", trans.s_arb_empty_i);
			$display("west input empty %b\n", trans.w_arb_empty_i);
			$display("east input empty %b\n", trans.e_arb_empty_i);
			$display("local input empty %b\n", trans.l_arb_empty_i);
			$display("north output credit %b\n", trans.n_arb_credit_i);
			$display("south output credit %b\n", trans.s_arb_credit_i);
			$display("west output credit %b\n", trans.w_arb_credit_i);
			$display("east output credit %b\n", trans.e_arb_credit_i);
			$display("local output credit %b\n", trans.l_arb_credit_i);
			if(~trans.n_arb_empty_i && (my_arbiter.pti[0] - my_arbiter.n_read) == 0 && trans.reset == 0) begin
				$display("north address %b", trans.n_arb_address_i);
				$display("north next hop: ");
				printNextHop(my_arbiter.nexthop[0]);
				$display("\n");
			end
			if(~trans.s_arb_empty_i && (my_arbiter.pti[1] - my_arbiter.s_read) == 0 && trans.reset == 0) begin
				$display("south address %b", trans.s_arb_address_i);
				$display("south next hop: ");
				printNextHop(my_arbiter.nexthop[1]);
				$display("\n");
			end
			if(~trans.w_arb_empty_i && (my_arbiter.pti[2] - my_arbiter.w_read) == 0 && trans.reset == 0) begin
				$display("west address %b", trans.w_arb_address_i);
				$display("west next hop: ");
				printNextHop(my_arbiter.nexthop[2]);
				$display("\n");
			end
			if(~trans.e_arb_empty_i && (my_arbiter.pti[3] - my_arbiter.e_read) == 0 && trans.reset == 0) begin
				$display("east address %b", trans.e_arb_address_i);
				$display("east next hop: ");
				printNextHop(my_arbiter.nexthop[3]);
				$display("\n");
			end
			if(~trans.l_arb_empty_i && (my_arbiter.pti[4] - my_arbiter.l_read) == 0 && trans.reset == 0) begin
				$display("local address %b", trans.l_arb_address_i);
				$display("local next hop: ");
				printNextHop(my_arbiter.nexthop[4]);
				$display("\n");
			end
			$display("Token after inputs");
			$display("north token:");
			printNextHop(my_arbiter.token[0]);
			$display("south token:");
			printNextHop(my_arbiter.token[1]);
			$display("west token:");
			printNextHop(my_arbiter.token[2]);
			$display("east token:");
			printNextHop(my_arbiter.token[3]);
			$display("local token:");
			printNextHop(my_arbiter.token[4]);
			/*$display("Results:\n");
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
			$display("local read %b\n", my_arbiter.l_read);*/
			checkResults();
		end
		repeat(1) begin 
			$display("Inputs:\n");
			$display("Tokens before inputs");
			$display("north token:");
			printNextHop((my_arbiter.token[0]+1)%5);
			$display("south token:");
			printNextHop((my_arbiter.token[1]+1)%5);
			$display("west token:");
			printNextHop((my_arbiter.token[2]+1)%5);
			$display("east token:");
			printNextHop((my_arbiter.token[3]+1)%5);
			$display("local token:");
			printNextHop((my_arbiter.token[4]+1)%5);
			//trans.randomize();
			trans.directTesting1();
			//trans.post_randomize();
			my_arbiter.update_model(trans);
			ds.cb.reset <= trans.reset;
			ds.cb.n_arb_address_i[7:0] <= trans.n_arb_address_i;
			ds.cb.s_arb_address_i[7:0] <= trans.s_arb_address_i;
			ds.cb.e_arb_address_i[7:0] <= trans.w_arb_address_i;
			ds.cb.w_arb_address_i[7:0] <= trans.e_arb_address_i;
			ds.cb.l_arb_address_i[7:0] <= trans.l_arb_address_i;
			ds.cb.n_arb_empty_i <= trans.n_arb_empty_i;
			ds.cb.s_arb_empty_i <= trans.s_arb_empty_i;
			ds.cb.e_arb_empty_i <= trans.w_arb_empty_i;
			ds.cb.w_arb_empty_i <= trans.e_arb_empty_i;
			ds.cb.l_arb_empty_i <= trans.l_arb_empty_i;
			ds.cb.n_arb_credit_i <= trans.n_arb_credit_i;
			ds.cb.s_arb_credit_i <= trans.s_arb_credit_i;
			ds.cb.e_arb_credit_i <= trans.w_arb_credit_i;
			ds.cb.w_arb_credit_i <= trans.e_arb_credit_i;
			ds.cb.l_arb_credit_i <= trans.l_arb_credit_i;
			ds.cb.yx_pos_i[7:0] <= trans.yx_pos;
			trans.updateCC(my_arbiter.dec);
			@(ds.cb)  
			@(ds.cb)  
			$display("%t\n",$realtime);
			
			//my_arbiter.updateCC(my_arbiter.sending);
			//$display("%d %d\n", trans.n_arb_empty_i_rand, trans.s_arb_empty_i_rand);
			$display("x location = %d\n", env.x_cor);
			$display("y location = %d\n", env.y_cor);
			$display("reset %b\n", trans.reset);
			$display("north input empty %b\n", trans.n_arb_empty_i);
			$display("south input empty %b\n", trans.s_arb_empty_i);
			$display("west input empty %b\n", trans.w_arb_empty_i);
			$display("east input empty %b\n", trans.e_arb_empty_i);
			$display("local input empty %b\n", trans.l_arb_empty_i);
			$display("north output credit %b\n", trans.n_arb_credit_i);
			$display("south output credit %b\n", trans.s_arb_credit_i);
			$display("west output credit %b\n", trans.w_arb_credit_i);
			$display("east output credit %b\n", trans.e_arb_credit_i);
			$display("local output credit %b\n", trans.l_arb_credit_i);
			if(~trans.n_arb_empty_i && (my_arbiter.pti[0] - my_arbiter.n_read) == 0 && trans.reset == 0) begin
				$display("north address %b", trans.n_arb_address_i);
				$display("north next hop: ");
				printNextHop(my_arbiter.nexthop[0]);
				$display("\n");
			end
			if(~trans.s_arb_empty_i && (my_arbiter.pti[1] - my_arbiter.s_read) == 0 && trans.reset == 0) begin
				$display("south address %b", trans.s_arb_address_i);
				$display("south next hop: ");
				printNextHop(my_arbiter.nexthop[1]);
				$display("\n");
			end
			if(~trans.w_arb_empty_i && (my_arbiter.pti[2] - my_arbiter.w_read) == 0 && trans.reset == 0) begin
				$display("west address %b", trans.w_arb_address_i);
				$display("west next hop: ");
				printNextHop(my_arbiter.nexthop[2]);
				$display("\n");
			end
			if(~trans.e_arb_empty_i && (my_arbiter.pti[3] - my_arbiter.e_read) == 0 && trans.reset == 0) begin
				$display("east address %b", trans.e_arb_address_i);
				$display("east next hop: ");
				printNextHop(my_arbiter.nexthop[3]);
				$display("\n");
			end
			if(~trans.l_arb_empty_i && (my_arbiter.pti[4] - my_arbiter.l_read) == 0 && trans.reset == 0) begin
				$display("local address %b", trans.l_arb_address_i);
				$display("local next hop: ");
				printNextHop(my_arbiter.nexthop[4]);
				$display("\n");
			end
			$display("Token after inputs");
			$display("north token:");
			printNextHop(my_arbiter.token[0]);
			$display("south token:");
			printNextHop(my_arbiter.token[1]);
			$display("west token:");
			printNextHop(my_arbiter.token[2]);
			$display("east token:");
			printNextHop(my_arbiter.token[3]);
			$display("local token:");
			printNextHop(my_arbiter.token[4]);
			/*$display("Results:\n");
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
			$display("local read %b\n", my_arbiter.l_read);*/
			checkResults();
		end
		repeat(5) begin 
			$display("Inputs:\n");
			$display("Tokens before inputs");
			$display("north token:");
			printNextHop((my_arbiter.token[0]+1)%5);
			$display("south token:");
			printNextHop((my_arbiter.token[1]+1)%5);
			$display("west token:");
			printNextHop((my_arbiter.token[2]+1)%5);
			$display("east token:");
			printNextHop((my_arbiter.token[3]+1)%5);
			$display("local token:");
			printNextHop((my_arbiter.token[4]+1)%5);
			//trans.randomize();
			trans.directTesting2();
			//trans.post_randomize();
			my_arbiter.update_model(trans);
			ds.cb.reset <= trans.reset;
			ds.cb.n_arb_address_i[7:0] <= trans.n_arb_address_i;
			ds.cb.s_arb_address_i[7:0] <= trans.s_arb_address_i;
			ds.cb.e_arb_address_i[7:0] <= trans.w_arb_address_i;
			ds.cb.w_arb_address_i[7:0] <= trans.e_arb_address_i;
			ds.cb.l_arb_address_i[7:0] <= trans.l_arb_address_i;
			ds.cb.n_arb_empty_i <= trans.n_arb_empty_i;
			ds.cb.s_arb_empty_i <= trans.s_arb_empty_i;
			ds.cb.e_arb_empty_i <= trans.w_arb_empty_i;
			ds.cb.w_arb_empty_i <= trans.e_arb_empty_i;
			ds.cb.l_arb_empty_i <= trans.l_arb_empty_i;
			ds.cb.n_arb_credit_i <= trans.n_arb_credit_i;
			ds.cb.s_arb_credit_i <= trans.s_arb_credit_i;
			ds.cb.e_arb_credit_i <= trans.w_arb_credit_i;
			ds.cb.w_arb_credit_i <= trans.e_arb_credit_i;
			ds.cb.l_arb_credit_i <= trans.l_arb_credit_i;
			ds.cb.yx_pos_i[7:0] <= trans.yx_pos;
			trans.updateCC(my_arbiter.dec);
			@(ds.cb)  
			@(ds.cb)  
			$display("%t\n",$realtime);
			
			//my_arbiter.updateCC(my_arbiter.sending);
			//$display("%d %d\n", trans.n_arb_empty_i_rand, trans.s_arb_empty_i_rand);
			$display("x location = %d\n", env.x_cor);
			$display("y location = %d\n", env.y_cor);
			$display("reset %b\n", trans.reset);
			$display("north input empty %b\n", trans.n_arb_empty_i);
			$display("south input empty %b\n", trans.s_arb_empty_i);
			$display("west input empty %b\n", trans.w_arb_empty_i);
			$display("east input empty %b\n", trans.e_arb_empty_i);
			$display("local input empty %b\n", trans.l_arb_empty_i);
			$display("north output credit %b\n", trans.n_arb_credit_i);
			$display("south output credit %b\n", trans.s_arb_credit_i);
			$display("west output credit %b\n", trans.w_arb_credit_i);
			$display("east output credit %b\n", trans.e_arb_credit_i);
			$display("local output credit %b\n", trans.l_arb_credit_i);
			if(~trans.n_arb_empty_i && (my_arbiter.pti[0] - my_arbiter.n_read) == 0 && trans.reset == 0) begin
				$display("north address %b", trans.n_arb_address_i);
				$display("north next hop: ");
				printNextHop(my_arbiter.nexthop[0]);
				$display("\n");
			end
			if(~trans.s_arb_empty_i && (my_arbiter.pti[1] - my_arbiter.s_read) == 0 && trans.reset == 0) begin
				$display("south address %b", trans.s_arb_address_i);
				$display("south next hop: ");
				printNextHop(my_arbiter.nexthop[1]);
				$display("\n");
			end
			if(~trans.w_arb_empty_i && (my_arbiter.pti[2] - my_arbiter.w_read) == 0 && trans.reset == 0) begin
				$display("west address %b", trans.w_arb_address_i);
				$display("west next hop: ");
				printNextHop(my_arbiter.nexthop[2]);
				$display("\n");
			end
			if(~trans.e_arb_empty_i && (my_arbiter.pti[3] - my_arbiter.e_read) == 0 && trans.reset == 0) begin
				$display("east address %b", trans.e_arb_address_i);
				$display("east next hop: ");
				printNextHop(my_arbiter.nexthop[3]);
				$display("\n");
			end
			if(~trans.l_arb_empty_i && (my_arbiter.pti[4] - my_arbiter.l_read) == 0 && trans.reset == 0) begin
				$display("local address %b", trans.l_arb_address_i);
				$display("local next hop: ");
				printNextHop(my_arbiter.nexthop[4]);
				$display("\n");
			end
			$display("Token after inputs");
			$display("north token:");
			printNextHop(my_arbiter.token[0]);
			$display("south token:");
			printNextHop(my_arbiter.token[1]);
			$display("west token:");
			printNextHop(my_arbiter.token[2]);
			$display("east token:");
			printNextHop(my_arbiter.token[3]);
			$display("local token:");
			printNextHop(my_arbiter.token[4]);
			/*$display("Results:\n");
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
			$display("local read %b\n", my_arbiter.l_read);*/
			checkResults();
		end
        /*repeat(5) begin
            trans.randomize();
			//trans.post_randomize();
			//trans.reset = 1;
			$display("Inputs:\n");
			$display("Token's before inputs:");
			$display("north token:");
			printNextHop((my_arbiter.token[0]+1)%5);
			$display("south token:");
			printNextHop((my_arbiter.token[1]+1)%5);
			$display("west token:");
			printNextHop((my_arbiter.token[2]+1)%5);
			$display("east token:");
			printNextHop((my_arbiter.token[3]+1)%5);
			$display("local token:");
			printNextHop((my_arbiter.token[4]+1)%5);
			my_arbiter.update_model(trans);
			ds.cb.reset <= trans.reset;
			ds.cb.n_arb_address_i[7:0] <= trans.n_arb_address_i;
			ds.cb.s_arb_address_i[7:0] <= trans.s_arb_address_i;
			ds.cb.e_arb_address_i[7:0] <= trans.w_arb_address_i;
			ds.cb.w_arb_address_i[7:0] <= trans.e_arb_address_i;
			ds.cb.l_arb_address_i[7:0] <= trans.l_arb_address_i;
			ds.cb.n_arb_empty_i <= trans.n_arb_empty_i;
			ds.cb.s_arb_empty_i <= trans.s_arb_empty_i;
			ds.cb.e_arb_empty_i <= trans.w_arb_empty_i;
			ds.cb.w_arb_empty_i <= trans.e_arb_empty_i;
			ds.cb.l_arb_empty_i <= trans.l_arb_empty_i;
			ds.cb.n_arb_credit_i <= trans.n_arb_credit_i;
			ds.cb.s_arb_credit_i <= trans.s_arb_credit_i;
			ds.cb.e_arb_credit_i <= trans.w_arb_credit_i;
			ds.cb.w_arb_credit_i <= trans.e_arb_credit_i;
			ds.cb.l_arb_credit_i <= trans.l_arb_credit_i;
			ds.cb.yx_pos_i[7:0] <= trans.yx_pos;
			trans.updateCC(my_arbiter.dec);
			@(ds.cb)
			$display("%t\n",$realtime);
			
			//my_arbiter.updateCC(my_arbiter.sending);
			//$display("%d %d\n", trans.n_arb_empty_i_rand, trans.s_arb_empty_i_rand);
			//$display("%d %d\n", trans.n_arb_credit_i_rand, trans.s_arb_credit_i_rand);
			//$display("%d %d\n", env.empty_density, env.credit_density);
			$display("x location = %d\n", env.x_cor);
			$display("y location = %d\n", env.y_cor);
			
			$display("reset %b\n", trans.reset);
			$display("north input empty %b\n", trans.n_arb_empty_i);
			$display("south input empty %b\n", trans.s_arb_empty_i);
			$display("west input empty %b\n", trans.w_arb_empty_i);
			$display("east input empty %b\n", trans.e_arb_empty_i);
			$display("local input empty %b\n", trans.l_arb_empty_i);
			$display("north output credit %b\n", trans.n_arb_credit_i);
			$display("south output credit %b\n", trans.s_arb_credit_i);
			$display("west output credit %b\n", trans.w_arb_credit_i);
			$display("east output credit %b\n", trans.e_arb_credit_i);
			$display("local output credit %b\n", trans.l_arb_credit_i);
			if(~trans.n_arb_empty_i && (my_arbiter.pti[0] - my_arbiter.n_read) == 0 && trans.reset == 0) begin
				$display("north address %b", trans.n_arb_address_i);
				$display("north next hop: ");
				printNextHop(my_arbiter.nexthop[0]);
				$display("\n");
			end
			if(~trans.s_arb_empty_i && (my_arbiter.pti[1] - my_arbiter.s_read) == 0 && trans.reset == 0) begin
				$display("south address %b", trans.s_arb_address_i);
				$display("south next hop: ");
				printNextHop(my_arbiter.nexthop[1]);
				$display("\n");
			end
			if(~trans.w_arb_empty_i && (my_arbiter.pti[2] - my_arbiter.w_read) == 0 && trans.reset == 0) begin
				$display("west address %b", trans.w_arb_address_i);
				$display("west next hop: ");
				printNextHop(my_arbiter.nexthop[2]);
				$display("\n");
			end
			if(~trans.e_arb_empty_i && (my_arbiter.pti[3] - my_arbiter.e_read) == 0 && trans.reset == 0) begin
				$display("east address %b", trans.e_arb_address_i);
				$display("east next hop: ");
				printNextHop(my_arbiter.nexthop[3]);
				$display("\n");
			end
			if(~trans.l_arb_empty_i && (my_arbiter.pti[4] - my_arbiter.l_read) == 0 && trans.reset == 0) begin
				$display("local address %b", trans.l_arb_address_i);
				$display("local next hop: ");
				printNextHop(my_arbiter.nexthop[4]);
				$display("\n");
			end
			$display("Token after inputs");
			$display("north token:");
			printNextHop(my_arbiter.token[0]);
			$display("south token:");
			printNextHop(my_arbiter.token[1]);
			$display("west token:");
			printNextHop(my_arbiter.token[2]);
			$display("east token:");
			printNextHop(my_arbiter.token[3]);
			$display("local token:");
			printNextHop(my_arbiter.token[4]);
			/*$display("Results:\n");
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
			$display("north credit out %d\n", my_arbiter.dec[0]);
			$display("south credit out %d\n", my_arbiter.dec[1]);
			$display("west credit out %d\n", my_arbiter.dec[2]);
			$display("east credit out %d\n", my_arbiter.dec[3]);
			$display("local credit out %d\n", my_arbiter.dec[4]);
			checkResults();
        end*/
    end
	
	function void printNextHop(int dir);
		case (dir)
			0 : $display("north");
			1 : $display("south");
			2 : $display("west");
			3 : $display("east");
			4 : $display("local");
		endcase
	endfunction
	
	task checkResults();
		$display("Results\n");
		/*$display("%d\n", my_arbiter.dec[0]);
		$display("%d\n", ds.cb.n_arb_dec_o);
		$display("%d\n", ds.cb.s_arb_dec_o);
		$display("%d\n", ds.cb.w_arb_dec_o);
		$display("%d\n", ds.cb.e_arb_dec_o);
		$display("%d\n", ds.cb.l_arb_dec_o);
		$display("%d\n", ds.cb.n_arb_read_o);
		$display("%d\n", ds.cb.s_arb_read_o);
		$display("%d\n", ds.cb.w_arb_read_o);
		$display("%d\n", ds.cb.e_arb_read_o);
		$display("%d\n", ds.cb.l_arb_read_o);
		$display("%d\n", ds.cb.n_arb_mux_sel_o);
		$display("%d\n", ds.cb.s_arb_mux_sel_o);
		$display("%d\n", ds.cb.w_arb_mux_sel_o);
		$display("%d\n", ds.cb.e_arb_mux_sel_o);
		$display("%d\n", ds.cb.l_arb_mux_sel_o);
		$display("%d\n", ds.cb.n_arb_demux_sel_o);
		$display("%d\n", ds.cb.s_arb_demux_sel_o);
		$display("%d\n", ds.cb.w_arb_demux_sel_o);
		$display("%d\n", ds.cb.e_arb_demux_sel_o);
		$display("%d\n", ds.cb.l_arb_demux_sel_o);*/
		
		//if(ds.cb.n_arb_dec_o == my_arbiter.dec[0]) begin
			$display("credit out north: dut = %d bench = %d\n", ds.cb.n_arb_dec_o, my_arbiter.dec[0]);
		//end
		//if(ds.cb.s_arb_dec_o == my_arbiter.dec[1]) begin
			$display("credit out south: dut = %d bench = %d\n", ds.cb.s_arb_dec_o, my_arbiter.dec[1]);
		//end
		//if(ds.cb.w_arb_dec_o != my_arbiter.dec[2]) begin
			$display("credit out west: dut = %d bench = %d\n", ds.cb.w_arb_dec_o, my_arbiter.dec[2]);
		//end
		//if(ds.cb.e_arb_dec_o != my_arbiter.dec[3]) begin
			$display("credit out east: dut = %d bench = %d\n", ds.cb.e_arb_dec_o, my_arbiter.dec[3]);
		//end
		//if(ds.cb.l_arb_dec_o != my_arbiter.dec[4]) begin
			$display("credit out local: dut = %d bench = %d\n", ds.cb.l_arb_dec_o, my_arbiter.dec[4]);
		//end
		
		//if(ds.cb.n_arb_read_o != my_arbiter.n_read) begin
			$display("read out north: dut = %d bench = %d\n", ds.cb.n_arb_read_o, my_arbiter.n_read);
		//end
		//if(ds.cb.s_arb_read_o != my_arbiter.s_read) begin
			$display("read out south: dut = %d bench = %d\n", ds.cb.s_arb_read_o, my_arbiter.s_read);
		//end
		//if(ds.cb.w_arb_read_o != my_arbiter.w_read) begin
			$display("read out west: dut = %d bench = %d\n", ds.cb.w_arb_read_o, my_arbiter.w_read);
		//end
		//if(ds.cb.e_arb_read_o != my_arbiter.e_read) begin
			$display("read out east: dut = %d bench = %d\n", ds.cb.e_arb_read_o, my_arbiter.e_read);
		//end
		//if(ds.cb.l_arb_read_o != my_arbiter.l_read) begin
			$display("read out local: dut = %d bench = %d\n", ds.cb.l_arb_read_o, my_arbiter.l_read);
		//end
		
		//if(my_arbiter.dec[0] == 1) begin
			//if(ds.cb.n_arb_mux_sel_o != my_arbiter.n_arb_mux_sel) begin
				$display("mux out north: dut = %b bench = %b\n", ds.cb.n_arb_mux_sel_o, my_arbiter.n_arb_mux_sel);
			//end
		//end
		//if(my_arbiter.dec[1] == 1) begin
			//if(ds.cb.s_arb_mux_sel_o != my_arbiter.s_arb_mux_sel) begin
				$display("mux out south: dut = %b bench = %b\n", ds.cb.s_arb_mux_sel_o, my_arbiter.s_arb_mux_sel);
			//end
		//end
		//if(my_arbiter.dec[2] == 1) begin
			//if(ds.cb.w_arb_mux_sel_o != my_arbiter.w_arb_mux_sel) begin
				$display("mux out west: dut = %b bench = %b\n", ds.cb.w_arb_mux_sel_o, my_arbiter.w_arb_mux_sel);
			//end
		//end
		//if(my_arbiter.dec[3] == 1) begin
			//if(ds.cb.e_arb_mux_sel_o != my_arbiter.e_arb_mux_sel) begin
				$display("mux out east: dut = %b bench = %b\n", ds.cb.e_arb_mux_sel_o, my_arbiter.e_arb_mux_sel);
			//end
		//end
		//if(my_arbiter.dec[4] == 1) begin
			//if(ds.cb.l_arb_mux_sel_o != my_arbiter.l_arb_mux_sel) begin
				$display("mux out local: dut = %b bench = %b\n", ds.cb.l_arb_mux_sel_o, my_arbiter.l_arb_mux_sel);
			//end
		//end
		
		//if(my_arbiter.n_read == 1) begin
			//if(ds.cb.n_arb_demux_sel_o != my_arbiter.n_arb_demux_sel) begin
				$display("demux out north: dut = %b bench = %b\n", ds.cb.n_arb_demux_sel_o, my_arbiter.n_arb_demux_sel);
			//end
		//end
		//if(my_arbiter.s_read == 1) begin
			//if(ds.cb.s_arb_demux_sel_o != my_arbiter.s_arb_demux_sel) begin
				$display("demux out south: dut = %b bench = %b\n", ds.cb.s_arb_demux_sel_o, my_arbiter.s_arb_demux_sel);
			//end
		//end
		//if(my_arbiter.w_read == 1) begin
			//if(ds.cb.w_arb_demux_sel_o != my_arbiter.w_arb_demux_sel) begin
				$display("demux out west: dut = %b bench = %b\n", ds.cb.w_arb_demux_sel_o, my_arbiter.w_arb_demux_sel);
			//end
		//end
		//if(my_arbiter.e_read == 1) begin
			//if(ds.cb.e_arb_demux_sel_o != my_arbiter.e_arb_demux_sel) begin
				$display("demux out east: dut = %b bench = %b\n", ds.cb.e_arb_demux_sel_o, my_arbiter.e_arb_demux_sel);
			//end
		//end
		//if(my_arbiter.l_read == 1) begin
			//if(ds.cb.l_arb_demux_sel_o != my_arbiter.l_arb_demux_sel) begin
				$display("demux out local: dut = %b bench = %b\n", ds.cb.l_arb_demux_sel_o, my_arbiter.l_arb_demux_sel);
			//end
		//end
		
		
	endtask

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
endprogram
