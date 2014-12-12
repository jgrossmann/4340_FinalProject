
class router;
    
    // Constants to make port identification easier
    // NORTH = 0;
    // SOUTH = 1;
    // WEST = 2;
    // EAST = 3;
    // LOCAL = 4;

	logic x_pos;
	logic y_pos;
	input_buffer buffers [5];
	int cc [5];
    int packet_tracker [5];
    int token [5]; //each token is for an output port, with value indicating input buffer    	
    int buffer_num; //temporary variable
	int zeros [5];  //temporary variable	

	function new(input logic x_cor, y_cor);
		x_pos = x_cor;
		y_pos = y_cor;
      foreach(cc[i]) begin
			buffers[i] = new();
      	cc[i] = 0;
			packet_tracker[i] = 0;
         token[i] = 0;
			zeros[i] = 0;
      end
	endfunction

    function void updateCC(int port, int credit);
        //port is direction of buffer which credit is updating
        //credit is value to add to credit counter (1 or -1)

        cc[port] = cc[port] + credit;
    endfunction

    function int portToken(int port);
        //Grabs the number of the input buffer which has the token for the corresponding port
        return token[port];
    endfunction;

    function void receive(flit f, bit valid, int port);
        //enter port number in which flit is being input
        
        if(valid) begin
            buffers[port].write(f);
        end
    endfunction

    function flit send(int port);
        //enter port number in which to check for flit output
        //return the flit from input buffer that would be output from router port specified
        //return null if no flit is to be sent out port
        //update the credit count of the router that it sends to

        buffer_num = arbiter(port);
        if(buffer_num == -1) begin
            return null;
        end else begin
            cc[port]--;
            packet_tracker[buffer_num] = (packet_tracker[buffer_num] + 1) % 5;
            return buffers[buffer_num].read();
        end
    endfunction

	function int arbiter(int port);
        //port is output port number
        //return the input buffer number of which to read flit
        //return -1 if no flit to send out port
    
        int temp [5];
        if(packet_tracker[port] == 0) begin
            int x_addr;
            int y_addr;
            int priority_port;
				temp = {0,0,0,0,0};
            foreach(buffers[i]) begin
                if(~buffers[i].empty) begin
                    x_addr = buffers[i].getX();
                    y_addr = buffers[i].getY();
                    case (port)     //yx processor
                        0 : if(y_addr < y_pos) temp[i] = 1;
                        1 : if(y_addr > y_pos) temp[i] = 1;
                        2 : if((y_addr == y_pos) && (x_addr < x_pos)) temp[i] = 1;
                        3 : if((y_addr == y_pos) && (x_addr > x_pos)) temp[i] = 1;
                        4 : if((y_addr == y_pos) && (x_addr == x_pos)) temp[i] = 1;
                    endcase
                end
            end
            if(temp == zeros) begin
                return -1;
            end
            
            priority_port = (token[port] + 1) % 5;
            for(int i=0; i<4; i++) begin
                if(temp[priority_port]) begin
                    token[port] = priority_port;
                    return priority_port;
                end else begin
                    priority_port = (priority_port + 1) % 5;
                end
            end

        end else begin
            return token[port];
        end

    endfunction


endclass
