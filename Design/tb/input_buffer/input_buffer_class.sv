`timescale 1ns/1ps

class input_buffer_class;
    flit buffer [5];
    int read_pointer;
    int write_pointer;
	logic [15:0] data_o;
    bit valid_o;
    bit empty_o;
    bit write_next;
    flit write_flit;
    buffer_stats stats;
    bit reset_next;
	int valid_flits;
	bit read_prev;

    function new(buffer_stats s);
        stats = s;
		valid_flits = 0;
        write_next = 0;
		reset_next = 0;
		read_prev = 0;
		empty_o = 1;
    endfunction;

    function void reset();

        foreach(buffer[i]) begin
            buffer[i] = new(0);
				buffer[i].data = 16'b0000000000000000;
        end

        read_pointer = 0;
        write_pointer = 0;
        empty_o = 1;
		valid_flits = 0;
		read_prev = 0;

    endfunction

    function flit peek();
        return buffer[read_pointer];
    endfunction

    function int full();
        if(~empty_o) begin
            return read_pointer == write_pointer;
        end else begin
            return 0;
        end
    endfunction

    function void write(input flit f);
        if(~full()) begin
            buffer[write_pointer] = new f;
            write_pointer = (write_pointer + 1) % 5;
			empty_o = 0;
			valid_flits++;
        end
    endfunction

    function flit read();
        flit temp_buffer = null;
        if(~empty_o) begin
            temp_buffer = buffer[read_pointer];
            //read_pointer = (read_pointer + 1) % 5;
				read_prev = 1;
				valid_flits--;
        end else begin
				$display("says buffer is empty so bad read");
			end
        return temp_buffer;
    endfunction 

    function int getX();
        return buffer[read_pointer].x;
    endfunction

    function int getY();
        return buffer[read_pointer].y;
    endfunction

	function int check_empty();
		return ((read_pointer == write_pointer) & (valid_flits == 0));
	endfunction
   
	function updateWrite(bit write, flit f);
		if(write_next) begin
            this.write(write_flit);
            write_next = 0;
            stats.flits_written++;
        end
		if(write) begin
            write_next = 1;
            write_flit = new f;
        end
	endfunction
	
	function updateRead(bit read);
		if(read_prev) begin
            read_prev = 0;
            read_pointer = (read_pointer + 1) % 5;
        end
		valid_o = 0;
        if(read) begin
            data_o = this.read().data;
            valid_o = 1;
            stats.flits_read++;
        end      
	endfunction
   
    function update(bit write, bit read, bit reset, flit f);
        //Find out if reset is synchronous or asynchronous               

        if(reset_next) begin
            this.reset();
				data_o = this.peek().data;
            write_next = 0;
            valid_o = 0;
            stats.resets++;
            reset_next = reset;
        end

		if(read_prev) begin
            read_prev = 0;
            read_pointer = (read_pointer + 1) % 5;
        end

		if(write_next) begin
            this.write(write_flit);
            write_next = 0;
            stats.flits_written++;
        end

		empty_o = this.check_empty();
			
		if(reset) begin
            reset_next = 1;
        end            


        if(write) begin
            write_next = 1;
            write_flit = new f;
        end
		if(this.peek() != null) begin
			data_o = this.peek().data;
		end else
				data_o = null;
            
		valid_o = 0;         
   
        if(read) begin
            data_o = this.read().data;
            valid_o = 1;
            stats.flits_read++;
        end        
        
	endfunction
         
 function void compareOutput(logic[15:0] data, bit valid, bit empty,logic[2:0] buf_ram_raddr_o, logic[2:0] buf_ram_waddr_o, logic[4:0] valid_flit_o);
        if((data != data_o) || (valid != valid_o) || (empty != empty_o)) begin
            $display("Test Failed!\n");
				$display("Buffer data:\n 0: %b\n 1: %b\n 2: %b\n 3: %b\n 4: %b\n", buffer[0].data, buffer[1].data, buffer[2].data, buffer[3].data, buffer[4].data);
            $display("Golden Model output:\n Data: %b\n Valid: %b\n Empty: %b\n", data_o, valid_o, empty_o);
            $display("Read pointer: %d\nWrite pointer: %d\nvalid flits: %d", read_pointer, write_pointer, valid_flits);
				$display("Input Buffer output:\n Data: %b\n Valid: %b\n Empty: %b\n ram write address: %b\n ram read address: %b\nvalid flits: %b\n", data, valid, empty, buf_ram_waddr_o, buf_ram_raddr_o, valid_flit_o);
            stats.total_tests_failed++;
        end else begin
				//$display("Test Passed!\n");
				//$display("Buffer data:\n 0: %b\n 1: %b\n 2: %b\n 3: %b\n 4: %b\n", buffer[0].data, buffer[1].data, buffer[2].data, buffer[3].data, buffer[4].data);
				//$display("Golden Model output:\n Data: %b\n Valid: %b\n Empty: %b\n", data_o, valid_o, empty_o);
            //$display("Read pointer: %d\nWrite pointer: %d\nvalid flits: %d", read_pointer, write_pointer, valid_flits);
				//$display("Input Buffer output:\n Data: %b\n Valid: %b\n Empty: %b\n ram write address: %b\n ram read address: %b\nvalid flits: %b\n", data, valid, empty, buf_ram_waddr_o, buf_ram_raddr_o, valid_flit_o);
			end
        stats.total_tests++;
    endfunction


endclass
