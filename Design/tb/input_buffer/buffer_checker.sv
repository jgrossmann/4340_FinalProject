class buffer_checker;

    input_buffer_class buffer;
    logic [15:0] data_o;
    bit valid_o;
    bit empty_o;
    bit write_next;
    flit write_flit;

    function new();
        buffer = new();
        write_next = 0;
    endfunction

    function goldenResult(bit write, bit read, bit reset, flit f);
        //Find out if reset is synchronous or asynchronous        
       
        if(reset) begin
            buffer.reset();
            data_o = buffer.peek();
            write_next = 0;
            valid_o = 0;
            empty_o = buffer.empty;
        end else begin
            
            if(write_next)
                buffer.write(write_flit);
                write_next = 0;
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
            end        
        end
    endfunction

    function void compareOutput(logic[15:0] data, bit valid, bit empty);
        if((data != data_o) || (valid != valid_o) || (empty != empty_o)) begin
            $display("TestFailed!\n");
            $display("Golden Model output:\n Data: %b\n Valid: %b\n Empty: %b\n", data_o, valid_o, empty_o);
            $display("Input Buffer output:\n Data: %b\n Valid: %b\n Empty: %b\n", data, valid, empty);
        end
    endfunction

endclass
