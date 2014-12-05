program buffer_testbench(buffer_interface.bench ifc);

    buffer_transaction trans;
    buffer_checker golden_model;
    input_buffer_class buffer;
    buffer_environment env;

    initial begin
        env = new();
        trans = new(env);
        golden_model = new();
        buffer = new();
        repeat(10000) begin
            @(ifc.cb)    
            $display("%t\n",$realtime);
        end
    end

endprogram
