`timescale 1ns/1ps


program router_testbench (router_interface.bench ds);

    router_transaction trans;
    router_environment env;
	//router_stats stats;
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
		//checker = new(my_router);
        //stats = new();
		repeat(1) begin   
			$display("%t\n",$realtime);
			trans.randomize();
			trans.reset = 1;
			trans.reset_func();
			@(ds.cb)
			my_router.updateRouter(trans);
			trans.updateCC(my_router.credit_o ,my_router.valid);
			$display("x location = %d\n", env.x_cor);
			$display("y location = %d\n", env.y_cor);
			$display("Inputs:\n");
			$display("north valid %b\n", trans.n_valid_i);
			$display("south valid %b\n", trans.s_valid_i);
			$display("west valid %b\n", trans.w_valid_i);
			$display("east valid %b\n", trans.e_valid_i);
			$display("local valid %b\n", trans.l_valid_i);
			$display("north credit %b\n", trans.n_credit_i);
			$display("south credit %b\n", trans.s_credit_i);
			$display("west credit %b\n", trans.w_credit_i);
			$display("east credit %b\n", trans.e_credit_i);
			$display("local credit %b\n", trans.l_credit_i);
			if(trans.n_valid_i == 1) begin
				if(trans.n_f_i.flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to north buffer\n", trans.n_f_i.x, trans.n_f_i.y);
				end else begin
					$display("Body flit with data %b to north buffer\n", trans.n_f_i.data);
				end
			end
			if(trans.s_valid_i == 1) begin
				if(trans.s_f_i.flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to south buffer\n", trans.s_f_i.x, trans.s_f_i.y);
				end else begin
					$display("Body flit with data %b to south buffer\n", trans.s_f_i.data);
				end
			end
			if(trans.w_valid_i == 1) begin
				if(trans.w_f_i.flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to west buffer\n", trans.w_f_i.x, trans.w_f_i.y);
				end else begin
					$display("Body flit with data %b to west buffer\n", trans.w_f_i.data);
				end
			end
			if(trans.e_valid_i == 1) begin
				if(trans.e_f_i.flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to east buffer\n", trans.e_f_i.x, trans.e_f_i.y);
				end else begin
					$display("Body flit with data %b to east buffer\n", trans.e_f_i.data);
				end
			end
			if(trans.l_valid_i == 1) begin
				if(trans.l_f_i.flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to local buffer\n", trans.l_f_i.x, trans.l_f_i.y);
				end else begin
					$display("Body flit with data %b to local buffer\n", trans.l_f_i.data);
				end
			end
			$display("Results:\n");
			$display("north valid %d\n", my_router.valid[0]);
			$display("south valid %d\n", my_router.valid[1]);
			$display("west valid %d\n", my_router.valid[2]);
			$display("east valid %d\n", my_router.valid[3]);
			$display("local valid %d\n", my_router.valid[4]);
			$display("north credit out %d\n", my_router.credit_o[0]);
			$display("south credit out %d\n", my_router.credit_o[1]);
			$display("west credit out %d\n", my_router.credit_o[2]);
			$display("east credit out %d\n", my_router.credit_o[3]);
			$display("local credit out %d\n", my_router.credit_o[4]);
			if(my_router.valid[0] == 1) begin
				if(my_router.outputs[0].flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to north output\n", my_router.outputs[0].x, my_router.outputs[0].y);
				end else begin
					$display("Body flit with data %b to north output\n", my_router.outputs[0].data);
				end
			end
			if(my_router.valid[1] == 1) begin
				if(my_router.outputs[1].flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to south output\n", my_router.outputs[1].x, my_router.outputs[1].y);
				end else begin
					$display("Body flit with data %b to south output\n", my_router.outputs[1].data);
				end
			end
			if(my_router.valid[2] == 1) begin
				if(my_router.outputs[2].flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to west output\n", my_router.outputs[2].x, my_router.outputs[2].y);
				end else begin
					$display("Body flit with data %b to west output\n", my_router.outputs[2].data);
				end
			end
			if(my_router.valid[3] == 1) begin
				if(my_router.outputs[3].flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to east output\n", my_router.outputs[3].x, my_router.outputs[3].y);
				end else begin
					$display("Body flit with data %b to east output\n", my_router.outputs[3].data);
				end
			end
			if(my_router.valid[4] == 1) begin
				if(my_router.outputs[4].flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to local output\n", my_router.outputs[4].x, my_router.outputs[4].y);
				end else begin
					$display("Body flit with data %b to local output\n", my_router.outputs[4].data);
				end
			end
		end
        repeat(5) begin
			$display("%t\n",$realtime);
			trans.randomize();
			//trans.reset = 1;
			@(ds.cb)  
			my_router.updateRouter(trans);
			trans.updateCC(my_router.credit_o ,my_router.valid);
			$display("%d %d\n", trans.n_valid_i_rand, trans.s_valid_i_rand);
			$display("x location = %d\n", env.x_cor);
			$display("y location = %d\n", env.y_cor);
			$display("Inputs:\n");
			$display("north valid %b\n", trans.n_valid_i);
			$display("south valid %b\n", trans.s_valid_i);
			$display("west valid %b\n", trans.w_valid_i);
			$display("east valid %b\n", trans.e_valid_i);
			$display("local valid %b\n", trans.l_valid_i);
			$display("north credit %b\n", trans.n_credit_i);
			$display("south credit %b\n", trans.s_credit_i);
			$display("west credit %b\n", trans.w_credit_i);
			$display("east credit %b\n", trans.e_credit_i);
			$display("local credit %b\n", trans.l_credit_i);
			if(trans.n_valid_i == 1) begin
				if(trans.n_f_i.flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to north buffer\n", trans.n_f_i.x, trans.n_f_i.y);
				end else begin
					$display("Body flit with data %b to north buffer\n", trans.n_f_i.data);
				end
			end
			if(trans.s_valid_i == 1) begin
				if(trans.s_f_i.flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to south buffer\n", trans.s_f_i.x, trans.s_f_i.y);
				end else begin
					$display("Body flit with data %b to south buffer\n", trans.s_f_i.data);
				end
			end
			if(trans.w_valid_i == 1) begin
				if(trans.w_f_i.flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to west buffer\n", trans.w_f_i.x, trans.w_f_i.y);
				end else begin
					$display("Body flit with data %b to west buffer\n", trans.w_f_i.data);
				end
			end
			if(trans.e_valid_i == 1) begin
				if(trans.e_f_i.flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to east buffer\n", trans.e_f_i.x, trans.e_f_i.y);
				end else begin
					$display("Body flit with data %b to east buffer\n", trans.e_f_i.data);
				end
			end
			if(trans.l_valid_i == 1) begin
				if(trans.l_f_i.flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to local buffer\n", trans.l_f_i.x, trans.l_f_i.y);
				end else begin
					$display("Body flit with data %b to local buffer\n", trans.l_f_i.data);
				end
			end
			$display("Results:\n");
			$display("north valid %d\n", my_router.valid[0]);
			$display("south valid %d\n", my_router.valid[1]);
			$display("west valid %d\n", my_router.valid[2]);
			$display("east valid %d\n", my_router.valid[3]);
			$display("local valid %d\n", my_router.valid[4]);
			$display("north credit out %d\n", my_router.credit_o[0]);
			$display("south credit out %d\n", my_router.credit_o[1]);
			$display("west credit out %d\n", my_router.credit_o[2]);
			$display("east credit out %d\n", my_router.credit_o[3]);
			$display("local credit out %d\n", my_router.credit_o[4]);
			if(my_router.valid[0] == 1) begin
				if(my_router.outputs[0].flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to north output\n", my_router.outputs[0].x, my_router.outputs[0].y);
				end else begin
					$display("Body flit with data %b to north output\n", my_router.outputs[0].data);
				end
			end
			if(my_router.valid[1] == 1) begin
				if(my_router.outputs[1].flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to south output\n", my_router.outputs[1].x, my_router.outputs[1].y);
				end else begin
					$display("Body flit with data %b to south output\n", my_router.outputs[1].data);
				end
			end
			if(my_router.valid[2] == 1) begin
				if(my_router.outputs[2].flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to west output\n", my_router.outputs[2].x, my_router.outputs[2].y);
				end else begin
					$display("Body flit with data %b to west output\n", my_router.outputs[2].data);
				end
			end
			if(my_router.valid[3] == 1) begin
				if(my_router.outputs[3].flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to east output\n", my_router.outputs[3].x, my_router.outputs[3].y);
				end else begin
					$display("Body flit with data %b to east output\n", my_router.outputs[3].data);
				end
			end
			if(my_router.valid[4] == 1) begin
				if(my_router.outputs[4].flit_type == 0) begin
					$display("Header flit with address x = %d, y = %d to local output\n", my_router.outputs[4].x, my_router.outputs[4].y);
				end else begin
					$display("Body flit with data %b to local output\n", my_router.outputs[4].data);
				end
			end
        end
    end

endprogram
