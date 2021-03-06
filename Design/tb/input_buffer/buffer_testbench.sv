`timescale 1ns/1ps
`include "modules/buffer_interface.sv"
`include "modules/input_buffer_test.sv"
`include "../flit.sv"
`include "buffer_stats.sv"
`include "buffer_environment.sv"
`include "input_buffer_class.sv"
`include "buffer_transaction.sv"

program buffer_testbench(buffer_interface.bench ifc);

    buffer_transaction t;
    input_buffer_class golden_model;
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
        t.randomize();
		  t.write_next = 0;
        stats = new();
        golden_model = new(stats);
		  @(ifc.cb);			
        //Reset buffer first
        t.reset = 1;
		  t.write = 0;
		  t.read = 0;
		  ifc.cb.reset <= t.reset;
		  ifc.cb.buf_write_i <= t.write;
		  ifc.cb.buf_read_i <= t.read;
		  ifc.cb.buf_data_i <= t.f.data;
		  golden_model.update(t.write, t.read, t.reset, t.f);
//		  $display("New Test Data:\nreset: %b\nwrite: %b\nread: %b\ndata: %b\n", t.reset, t.write, t.read, t.f.data);

		  @(ifc.cb);
		  t.reset = 0;
		  ifc.cb.reset <= t.reset;
		  golden_model.update(t.write, t.read, t.reset, t.f);
		  @(ifc.cb);		  
        golden_model.compareOutput(ifc.cb.buf_data_o, ifc.cb.buf_valid_o, ifc.cb.buf_empty_o, ifc.cb.buf_ram_raddr_o, ifc.cb.buf_ram_waddr_o, ifc.cb.valid_flit_o);
        
        repeat(env.max_cycles) begin
            t.randomize();
//				$display("New Test Data:\nreset: %b\nwrite: %b\nread: %b\ndata: %b\n", t.reset, t.write, t.read, t.f.data);
				ifc.cb.reset <= t.reset;
        		ifc.cb.buf_write_i <= t.write;
        		ifc.cb.buf_read_i <= t.read;
        		ifc.cb.buf_data_i <= t.f.data;
				golden_model.update(t.write, t.read, t.reset, t.f);
//				$display("%t\n",$realtime);
            @(ifc.cb);
                        //checks the golden model against actual buffer
            golden_model.compareOutput(ifc.cb.buf_data_o, ifc.cb.buf_valid_o, ifc.cb.buf_empty_o, ifc.cb.buf_ram_raddr_o, ifc.cb.buf_ram_waddr_o, ifc.cb.valid_flit_o);
        end
        stats.sim_time_end = $realtime;
        stats.results();
    end

endprogram
