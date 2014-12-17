`timescale 1ns/1ps

class buffer_transaction;

    buffer_environment env;
    int packet_tracker;
    flit f;
	 int buf_credit;
	 bit write_next;
	 bit reset_next;
    rand bit reset;
    rand bit read;
    rand bit write;
    constraint c {
        reset dist { 0:=(100 - env.reset_density), 1:=env.reset_density };
        write dist { 0:=(100 - env.write_density), 1:=env.write_density };
        read dist { 0:=(100 - env.read_density), 1:=env.read_density };
    }

    function new(input buffer_environment e);    
        env = e;
        packet_tracker = 0;
        f = new(0);
		  buf_credit = 5;
		  reset_next = 0;
		  write_next = 0;
    endfunction

    function void pre_randomize();
// Sets flit type based on the packet tracker of each port
        if(packet_tracker == 0) begin
            f.flit_type = 0;
            f.x.rand_mode(1); //randomize address if new packet
            f.y.rand_mode(1);
        end else if(packet_tracker == 1) begin
            f.flit_type = 1;
            f.x.rand_mode(0);
            f.y.rand_mode(0);
        end
        f.randomize();
    endfunction

    function void post_randomize();
//Updates the packet tracker if the next flit to be sent is valid
		  if(reset_next) begin
            packet_tracker = 0;
				reset_next = 0;
				buf_credit = 5;
				write_next = 0;
		  end

		  if(reset) begin
				reset_next = 1;
			end
			
		   if(write_next) begin
            buf_credit--;
            write_next = 0;
         end

	
        if(write) begin
				if(buf_credit == 0) begin
					write = 0;
				end else begin
            	packet_tracker = (packet_tracker + 1) % 5;
					write_next = 1;
				end
        end

			if(read) begin
				if(buf_credit >= 5) begin
					read = 0;
				end else begin
					buf_credit++;
				end
			end
		  
    endfunction


endclass
