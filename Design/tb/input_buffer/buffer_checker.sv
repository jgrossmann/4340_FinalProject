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
				if(buffer.peek() != null) begin
					data_o = buffer.peek().data;
				end else begin
					data_o = null;
				end
            write_next = 0;
            valid_o = 0;
            empty_o = buffer.empty;
            stats.resets++;
            reset_next = reset;
        end else begin
				empty_o = buffer.empty;
            if(reset) begin
                reset_next = 1;
            end            

            if(write_next) begin
                buffer.write(write_flit);
                write_next = 0;
                stats.flits_written++;
					 empty_o = buffer.empty;
            end

            if(write) begin
                write_next = 1;
                write_flit = new f;
            end
				
				if(buffer.peek() != null) begin
					data_o = buffer.peek().data;
				end else begin
					data_o = null;
				end
            valid_o = 0;         
   
            if(read) begin
                data_o = buffer.read().data;
                valid_o = 1;
                stats.flits_read++;
            end        
        end
    endfunction

    function void compareOutput(logic[15:0] data, bit valid, bit empty,logic[2:0] buf_ram_raddr_o, logic[2:0] buf_ram_waddr_o);
        if((data != data_o) || (valid != valid_o) || (empty != empty_o)) begin
            $display("Test Failed!\n");
            $display("Golden Model output:\n Data: %b\n Valid: %b\n Empty: %b\n", data_o, valid_o, empty_o);
            $display("Input Buffer output:\n Data: %b\n Valid: %b\n Empty: %b\n ram write address: %b\n ram read address: %b\n", data, valid, empty, buf_ram_waddr_o, buf_ram_raddr_o);
            stats.total_tests_failed++;
        end else begin
				$display("Test Passed!\n");
				$display("Golden Model output:\n Data: %b\n Valid: %b\n Empty: %b\n", data_o, valid_o, empty_o);
            $display("Input Buffer output:\n Data: %b\n Valid: %b\n Empty: %b\n ram write address: %b\n ram read address: %b\n", data, valid, empty, buf_ram_waddr_o, buf_ram_raddr_o);
			end
        stats.total_tests++;
    endfunction

endclass
