program arbiter_testbench(arbiter_interface.bench ifc);

    arbiter_transaction trans;
    arbiter_checker golden_model;
    arbiter_environment env;
    arbiter_stats stats;
	arbiter_class arbiter;
	rand int x_cor;
	rand int y_cor;
	
	constraint c {
        0 <= x <= 3;
		0 <= y <= 3;
    }
    
    initial begin
        env = new();
        this.srandom(env.random_seed);
		x_cor.randomize();
		y_cor.randomize();
        trans = new(env, x_cor, y_cor);
        golden_model = new();
        arbiter = new(x_cor, y_cor);
        stats = new();
        repeat(10000) begin
            @(ifc.cb)    
            $display("%t\n",$realtime);
        end
    end

endprogram
