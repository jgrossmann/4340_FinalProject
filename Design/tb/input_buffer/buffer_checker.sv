`timescale 1ns/1ps

class buffer_checker;

    input_buffer_class buffer;
    logic [15:0] data_o;
    bit valid_o;
    bit empty_o;
    bit write_next;
    flit write_flit;
    buffer_stats stats;
    bit reset_next;

    function new(buffer_stats s);
        buffer = new();
        stats = s;
        write_next = 0;
    endfunction

    function goldenResult(bit write, bit read, bit reset, flit f);
        //Find out if reset is synchronous or asynchronous               

        if(reset_next) begin
            buffer.reset();
            data_o = buffer.peek();
            write_next = 0;
            valid_o = 0;
            empty_o = buffer.empty;
            stats.resets++;
            reset_next = reset;
        end else begin
            if(reset) begin
                reset_next = 1;
            end            

            if(write_next) begin
                buffer.write(write_flit);
                write_next = 0;
                stats.flits_written++;
            end

            if(write) begin
                write_next = 1;
                write_flit = f;
            end

            data_o = buffer.peek().data;
            valid_o = 0;
            empty_o = buffer.empty;         
   
            if(read) begin
                data_o = buffer.read().data;
                valid_o = 1;
                empty_o = buffer.empty;
                stats.flits_read++;
            end        
        end
    endfunction

    function void compareOutput(logic[15:0] data, bit valid, bit empty);
        if((data != data_o) || (valid != valid_o) || (empty != empty_o)) begin
            $display("TestFailed!\n");
            $display("Golden Model output:\n Data: %b\n Valid: %b\n Empty: %b\n", data_o, valid_o, empty_o);
            $display("Input Buffer output:\n Data: %b\n Valid: %b\n Empty: %b\n", data, valid, empty);
            stats.total_tests_failed++;
        end
        stats.total_tests++;
    endfunction

endclass
