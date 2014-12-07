program arbiter_testbench(arbiter_interface.bench ifc);

    arbiter_transaction trans;
    arbiter_checker golden_model;
    arbiter_environment env;
    arbiter_stats stats;
	arbiter_class arbiter;
    
    initial begin
        env = new();
        this.srandom(env.random_seed);
        trans = new(env);
        golden_model = new();
        arbiter = new();
        stats = new();
        repeat(10000) begin
            @(ifc.cb)    
            $display("%t\n",$realtime);
        end
    end

endprogram
