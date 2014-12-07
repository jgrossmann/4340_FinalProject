`include "../flit.sv"
`include "buffer_stats.sv"
`include "buffer_environment.sv"
`include "buffer_checker.sv"
`include "input_buffer_class.sv"
`include "buffer_transaction.sv"
`include "buffer_testbench.sv"


program buffer_testbench(buffer_interface.bench ifc);

    buffer_transaction t;
    buffer_checker golden_model;
    buffer_environment env;
    buffer_stats stats;
    
    initial begin
        env = new();
        $srandom(env.random_seed);
        if(env.auto_config) begin
            env.randomize();
            env.max_cycles = 10000;
        end
            
        t = new(env);
        trans.randomize();
        buffer = new();
        stats = new();
        golden_model = new(stats);

        //Reset buffer first
        t.reset = 1;
        t.sendData(ifc, golden_model);
        @(ifc.cb);
        t.write_next = 1'b0;
        golden_model.compareOutput(ifc.cb.buf_data_o, ifc.cb.buf_valid_o, ifc.cb.buf_empty.o);
        
        repeat(env.max_cycles) begin
            t.randomize();
            t.sendData(ifc, golden_model);
            $display("%t\n",$realtime);
            @(ds.cb);
                        //checks the golden model against actual buffer
            golden_model.compareOutput(ifc.cb.buf_data_o, ifc.cb.buf_valid_o, ifc.cb.buf_empty_o);
        end
        stats.sim_time_end = $realtime;
        stats.results();
    end

endprogram
