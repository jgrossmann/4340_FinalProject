program buffer_testbench(buffer_interface.bench ifc);

    buffer_transaction trans;
    buffer_checker golden_model;
    buffer_environment env;
    buffer_stats stats;
    
    initial begin
        env = new();
        this.srandom(env.random_seed);
        trans = new(env);
        golden_model = new();
        buffer = new();
        stats = new();
        repeat(10000) begin
            @(ifc.cb)    
            $display("%t\n",$realtime);
        end
    end

endprogram
