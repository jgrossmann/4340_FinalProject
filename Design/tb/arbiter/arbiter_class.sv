
class arbiter;

    int cc [5];
    int packet_tracker [5];
    int token [5];
	int n_x_addr;
	int n_y_addr;
	int s_x_addr;
	int s_y_addr;
	int w_x_addr;
	int w_y_addr;
	int e_x_addr;
	int e_y_addr;
	int l_x_addr;
	int l_y_addr;
	int y_pos;
	int x_pos;
	int empty [5];
	logic n_read;
	logic s_read;
	logic e_read;
	logic w_read;
	logic l_read;
	

    function new(int x, int y);
        foreach(cc[i]) begin
			cc[i] = 0;
			packet_tracker[i] = 0;
			token[i] = 0;
			empty[i] = 0;
			x_pos = x;
			y_pos = y;
      end
    endfunction;
	
	function void update_model (
		transaction packet
	);
		empty[0] = packet.n_arb_empty_i;
		empty[1] = packet.s_arb_empty_i;
		empty[2] = packet.w_arb_empty_i;
		empty[3] = packet.e_arb_empty_i;
		empty[4] = packet.l_arb_empty_i;
		if(packet.n_arb_credit_i) begin
			cc[0]++;
		end
		if(packet.s_arb_credit_i) begin
			cc[1]++;
		end
		if(packet.w_arb_credit_i) begin
			cc[2]++;
		end
		if(packet.e_arb_credit_i) begin
			cc[3]++;
		end
		if(packet.l_arb_credit_i) begin
			cc[4]++;
		end
		
		n_y_addr = packet.n_arb_address_i[3:0];
		n_x_addr = packet.n_arb_address_i[7:4];
		s_y_addr = packet.s_arb_address_i[3:0];
		s_x_addr = packet.s_arb_address_i[7:4];
		w_y_addr = packet.w_arb_address_i[3:0];
		w_x_addr = packet.w_arb_address_i[7:4];
		e_y_addr = packet.e_arb_address_i[3:0];
		e_x_addr = packet.e_arb_address_i[7:4];
		l_y_addr = packet.l_arb_address_i[3:0];
		l_x_addr = packet.l_arb_address_i[7:4];
		
		int dir;
		for(int i = 0; i < 5; i++) begin
			dir = arbiter_func(i, packet);
			if(dir >= 0) begin
				packet_tracker[dir] = (packet_tracker[dir] + 1) % 5;
			end
			//READ SIGNALS AND SELECT SIGNALS AND UPDATE PACKET TRACKER
		end
	
	endfunction

    function int arbiter_func(int port, transaction packet);
        //port is output port number
        //return the input buffer number of which to read flit
        //return -1 if no flit to send out port
    
        int temp [5];
        if(packet_tracker[port] == 0) begin
            int x_addr;
            int y_addr;
            int priority_port;
				temp = {0,0,0,0,0};
            for(int i = 0; i < 5; i++) begin
                if(~empty[i]) begin
                    case(i)
						0 : x_addr = n_x_addr; y_addr = n_y_addr;
						1 : x_addr = s_x_addr; y_addr = s_y_addr;
						2 : x_addr = w_x_addr; y_addr = w_y_addr;
						3 : x_addr = e_x_addr; y_addr = e_y_addr;
						4 : x_addr = l_x_addr; y_addr = l_y_addr;
                    case (port)     //yx processor
                        0 : if(y_addr > y_pos) temp[i] = 1;
                        1 : if(y_addr < y_pos) temp[i] = 1;
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
