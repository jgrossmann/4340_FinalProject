
class arbiter_class;

    //int cc [5];
    int packet_tracker [5];
	int pti [5];
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
	int n_x_addr_temp;
	int n_y_addr_temp;
	int s_x_addr_temp;
	int s_y_addr_temp;
	int w_x_addr_temp;
	int w_y_addr_temp;
	int e_x_addr_temp;
	int e_y_addr_temp;
	int l_x_addr_temp;
	int l_y_addr_temp;
	int valid [5];
	//int y_pos;
	//int x_pos;
	int empty [5];
	logic n_read;
	logic s_read;
	logic e_read;
	logic w_read;
	logic l_read;
	logic [2:0] n_arb_mux_sel;
	logic [2:0] s_arb_mux_sel;
	logic [2:0] e_arb_mux_sel;
	logic [2:0] w_arb_mux_sel;
	logic [2:0] l_arb_mux_sel;
	logic [2:0] n_arb_demux_sel;
	logic [2:0] s_arb_demux_sel;
	logic [2:0] e_arb_demux_sel;
	logic [2:0] w_arb_demux_sel;
	logic [2:0] l_arb_demux_sel;
	
	int dec [5];

	int nexthop [5];
	
	arbiter_transaction pack;
	
	
	//int sending [5];
	int dir;
	

    function new();
        foreach(packet_tracker[i]) begin
			//cc[i] = 5;
			packet_tracker[i] = 0;
			token[i] = 4;
			empty[i] = 0;
			pti[i] = 0;
			valid[i] = -1;
			//sending[i] = 0;
			//x_pos = x;
			//y_pos = y;
      end
    endfunction;
	
	function void update_model (
		arbiter_transaction packet
	);

		
		n_read = 0;
		s_read = 0;
		w_read = 0;
		e_read = 0;
		l_read = 0;
		foreach(dec[i]) begin
			dec[i] = 0;
		end
		if(packet.reset == 1) begin
			reset();
			return;
		end
		empty[0] = packet.n_arb_empty_i;
		//$display("%d\n", packet.n_arb_empty_i);
		empty[1] = packet.s_arb_empty_i;
		//$display("%d\n", packet.s_arb_empty_i);
		empty[2] = packet.w_arb_empty_i;
		//$display("%d\n", packet.w_arb_empty_i);
		empty[3] = packet.e_arb_empty_i;
		//$display("%d\n", packet.e_arb_empty_i);
		empty[4] = packet.l_arb_empty_i;
		//$display("%d\n", packet.l_arb_empty_i);
		/*if(packet.n_arb_credit_i) begin
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
		end*/
		
		n_x_addr = n_x_addr_temp;
		n_y_addr = n_y_addr_temp;
		if(valid[0] == 0) begin
			valid[0] = 1;
		end
		s_x_addr = s_x_addr_temp;
		s_y_addr = s_y_addr_temp;
		if(valid[1] == 0) begin
			valid[1] = 1;
		end
		w_x_addr = w_x_addr_temp;
		w_y_addr = w_y_addr_temp;
		if(valid[2] == 0) begin
			valid[2] = 1;
		end
		e_x_addr = e_x_addr_temp;
		e_y_addr = e_y_addr_temp;
		if(valid[3] == 0) begin
			valid[3] = 1;
		end
		l_x_addr = l_x_addr_temp;
		l_y_addr = l_y_addr_temp;
		if(valid[4] == 0) begin
			valid[4] = 1;
		end
		
		if(pti[0] == 0 && empty[0] == 0) begin
			n_y_addr_temp = packet.n_arb_address_i[3:0];
			n_x_addr_temp = packet.n_arb_address_i[7:4];
			if(valid[0] == -1) begin
				valid[0] = 0;
			end
		end
		if(pti[1] == 0 && empty[1] == 0) begin
			s_y_addr_temp = packet.s_arb_address_i[3:0];
			s_x_addr_temp = packet.s_arb_address_i[7:4];
			if(valid[1] == -1) begin
				valid[1] = 0;
			end
		end
		if(pti[2] == 0 && empty[2] == 0) begin
			w_y_addr_temp = packet.w_arb_address_i[3:0];
			w_x_addr_temp = packet.w_arb_address_i[7:4];
			if(valid[2] == -1) begin
				valid[2] = 0;
			end
		end
		if(pti[3] == 0 && empty[3] == 0) begin
			e_y_addr_temp = packet.e_arb_address_i[3:0];
			e_x_addr_temp = packet.e_arb_address_i[7:4];
			if(valid[3] == -1) begin
				valid[3] = 0;
			end
		end
		if(pti[4] == 0 && empty[4] == 0) begin
			l_y_addr_temp = packet.l_arb_address_i[3:0];
			l_x_addr_temp = packet.l_arb_address_i[7:4];
			if(valid[4] == -1) begin
				valid[4] = 0;
			end
		end
		
		
		
		pack = packet;
		
		nexthop[0] = getDirection(n_x_addr_temp, n_y_addr_temp);
		nexthop[1] = getDirection(s_x_addr_temp, s_y_addr_temp);
		nexthop[2] = getDirection(w_x_addr_temp, w_y_addr_temp);
		nexthop[3] = getDirection(e_x_addr_temp, e_y_addr_temp);
		nexthop[4] = getDirection(l_x_addr_temp, l_y_addr_temp);		
			
		
		for(int i = 0; i < 5; i++) begin
			//sending[i] = 0;
			dir = arbiter_func(i, packet);
			if(dir >= 0) begin
				//$display("incrementing packet tracker for %d when searching $d\n", dir, i);
				packet_tracker[i] = (packet_tracker[i] + 1) % 5;
				pti[dir] = (pti[dir] + 1) % 5;
				valid[dir]++;
				if(valid[dir]==6) begin
					valid[dir] = -1;
				end
				//sending[i] = 1;
				case(dir)
					0 : n_read = 1;
					1 : s_read = 1;
					2 : w_read = 1;
					3 : e_read = 1;
					4 : l_read = 1;
				endcase
				case(dir)
					0 : n_arb_demux_sel = i;
					1 : s_arb_demux_sel = i;
					2 : w_arb_demux_sel = i;
					3 : e_arb_demux_sel = i;
					4 : l_arb_demux_sel = i;
				endcase
				case(i)
					0 : n_arb_mux_sel = dir;
					1 : s_arb_mux_sel = dir;
					2 : w_arb_mux_sel = dir;
					3 : e_arb_mux_sel = dir;
					4 : l_arb_mux_sel = dir;				
				endcase
				dec[i] = 1;
			end
			
		end
	
	endfunction

    function int arbiter_func(int port, arbiter_transaction packet);
        //port is output port number
        //return the input buffer number of which to read flit
        //return -1 if no flit to send out port
		
		int counter;
        int temp [5];
		int zeros [5];
		
		if(port == 0 && packet.n_arb_credit_i == 0) begin
			return -1;
		end else if(port == 1 && packet.s_arb_credit_i == 0) begin
			return -1;
		end else if(port == 2 && packet.w_arb_credit_i == 0) begin
			return -1;
		end else if(port == 3 && packet.e_arb_credit_i == 0) begin
			return -1;
		end else if(port == 4 && packet.l_arb_credit_i == 0) begin
			return -1;
		end
		/*if(cc[port] == 0) begin
			return -1;
		end*/
		
        if(packet_tracker[port] == 0) begin
            int x_addr;
            int y_addr;
            int priority_port;
			temp = {0,0,0,0,0};
			zeros = {0,0,0,0,0};
			
            for(int i = 0; i < 5; i++) begin
                if(empty[i] == 0 && valid[i] > 0) begin
                    case(i)
						0 : x_addr = n_x_addr;
						1 : x_addr = s_x_addr;
						2 : x_addr = w_x_addr;
						3 : x_addr = e_x_addr;
						4 : x_addr = l_x_addr;
					endcase
					case(i)
						0 : y_addr = n_y_addr;
						1 : y_addr = s_y_addr;
						2 : y_addr = w_y_addr;
						3 : y_addr = e_y_addr;
						4 : y_addr = l_y_addr;
					endcase
                    case (port)     //yx processor
                        0 : if(y_addr < packet.yx_pos[3:0]) temp[i] = 1;
                        1 : if(y_addr > packet.yx_pos[3:0]) temp[i] = 1;
                        2 : if((y_addr == packet.yx_pos[3:0]) && (x_addr < packet.yx_pos[7:4])) temp[i] = 1;
                        3 : if((y_addr == packet.yx_pos[3:0]) && (x_addr > packet.yx_pos[7:4])) temp[i] = 1;
                        4 : if((y_addr == packet.yx_pos[3:0]) && (x_addr == packet.yx_pos[7:4])) temp[i] = 1;
                    endcase
                end
            end
			counter = 0;
			foreach(temp[i]) begin
				if(temp[i] == zeros[i]) begin
					counter++;
				end
			end
            if(counter == 5) begin
                return -1;
            end
            
            priority_port = (token[port] + 1) % 5;
            for(int i=0; i<4; i++) begin
                if(temp[priority_port]) begin
                    token[port] = priority_port;
					//$display("from = %d, to = %d\n", priority_port, port);
                    return priority_port;
                end else begin
                    priority_port = (priority_port + 1) % 5;
                end
            end

        end else begin
			//$display("got here\n");
			if(empty[token[port]] == 0) begin
				return token[port];
			end else begin
				return -1;
			end
        end

    endfunction
	
	function void reset();
		 foreach(packet_tracker[i]) begin
			//cc[i] = 5;
			packet_tracker[i] = 0;
			pti[i] = 0;
			token[i] = 4;
			empty[i] = 0;
			//sending[i] = 0;
      end
	endfunction
	
	function int getDirection(int x, int y);
		if(y > pack.yx_pos[3:0]) begin
			return 1;
		end
		if(y < pack.yx_pos[3:0]) begin
			return 0;
		end
		if(x > pack.yx_pos[7:4]) begin
			return 3;
		end
		if(x < pack.yx_pos[7:4]) begin
			return 2;
		end
		return 4;
	endfunction
	
	/*function void updateCC(int dec[5]);
		foreach(dec[i]) begin
			if(dec[i] == 1) begin
				cc[i]--;
			end
		end
	endfunction*/
            
endclass
