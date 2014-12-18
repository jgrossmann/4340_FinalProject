
class router_test;

    // Constants to make port identification easier
    // NORTH = 0;
    // SOUTH = 1;
    // WEST = 2;
    // EAST = 3;
    // LOCAL = 4;
	input_buffer_class buffers [5];
	logic x_pos;
	logic y_pos;
	int cc [5];
    int buffer_num; //temporary variable
	arbiter_transaction arb_pack;
	arbiter_class arbiter;
	arbiter_environment arb_env;
	flit outputs [5];
	logic n_credit_o;
	logic s_credit_o;
	logic w_credit_o;
	logic e_credit_o;
	logic l_credit_o;
	int valid [5];

	function new();
		arb_env = new();
		x_pos = arb_env.x_cor;
		y_pos = arb_env.y_cor;
		arb_pack = new(arb_env);
		arbiter = new();
		foreach(cc[i]) begin
			cc[i] = 0;
			buffers[i] = new();
		end
	endfunction

    function void updateCC(int port, int credit);
        //port is direction of buffer which credit is updating
        //credit is value to add to credit counter (1 or -1)

        cc[port] = cc[port] + credit;
    endfunction


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

	
	
	function void updateRouter(router_transaction pack);
		if(pack.reset == 1) begin
			reset();
			return;
		end
		if(pack.n_valid_i) begin
			buffers[0].updateWrite(1, pack.n_f_i);
		end
		if(pack.s_valid_i) begin
			buffers[1].updateWrite(1, pack.s_f_i);
		end
		if(pack.w_valid_i) begin
			buffers[2].updateWrite(1, pack.w_f_i);
		end
		if(pack.e_valid_i) begin
			buffers[3].updateWrite(1, pack.e_f_i);
		end
		if(pack.l_valid_i) begin
			buffers[4].updateWrite(1, pack.l_f_i);
		end
		arb_pack.randomize();
		arb_pack.n_arb_empty_i = buffers[0].check_empty();
		arb_pack.s_arb_empty_i = buffers[1].check_empty();
		arb_pack.w_arb_empty_i = buffers[2].check_empty();
		arb_pack.e_arb_empty_i = buffers[3].check_empty();
		arb_pack.l_arb_empty_i = buffers[4].check_empty();
		arb_pack.n_arb_credit_i = (cc[0] != 0);
		arb_pack.s_arb_credit_i = (cc[1] != 0);
		arb_pack.w_arb_credit_i = (cc[2] != 0);
		arb_pack.e_arb_credit_i = (cc[3] != 0);
		arb_pack.l_arb_credit_i = (cc[4] != 0);
		if(~(buffers[0].check_empty())) begin
			arb_pack.n_arb_address_i = buffers[0].peek().data;
		end
		if(~(buffers[1].check_empty())) begin
			arb_pack.s_arb_address_i = buffers[1].peek().data;
		end
		if(~(buffers[2].check_empty())) begin
			arb_pack.w_arb_address_i = buffers[2].peek().data;
		end
		if(~(buffers[3].check_empty())) begin
			arb_pack.e_arb_address_i = buffers[3].peek().data;
		end
		if(~(buffers[4].check_empty())) begin
			arb_pack.l_arb_address_i = buffers[4].peek().data;
		end
		arbiter.update_model(arb_pack);
		foreach(outputs[i]) begin
			outputs[i] = null;
			valid[i] = 0;
		end
		n_credit_o = 0;
		s_credit_o = 0;
		w_credit_o = 0;
		e_credit_o = 0;
		l_credit_o = 0;
		if(arbiter.n_read == 1) begin
			buffers[0].updateRead(1);
			flit f = buffers[0].peek();
			outputs[arbiter.n_arb_demux_sel] = f;
			n_credit_o = 1;
			cc[arbiter.n_arb_demux_sel]--;
			valid[arbiter.n_arb_demux_sel] = 1;
		end
		if(arbiter.s_read == 1) begin
			buffers[1].updateRead(1);
			flit f = buffers[1].peek();
			outputs[arbiter.s_arb_demux_sel] = f;
			s_credit_o = 1;
			cc[arbiter.s_arb_demux_sel]--;
			valid[arbiter.s_arb_demux_sel] = 1;
		end
		if(arbiter.w_read == 1) begin
			buffers[2].updateRead(1);
			flit f = buffers[2].peek();
			outputs[arbiter.w_arb_demux_sel] = f;
			w_credit_o = 1;
			cc[arbiter.w_arb_demux_sel]--;
			valid[arbiter.w_arb_demux_sel] = 1;
		end
		if(arbiter.e_read == 1) begin
			buffers[3].updateRead(1);
			flit f = buffers[3].peek();
			outputs[arbiter.e_arb_demux_sel] = f;
			e_credit_o = 1;
			cc[arbiter.e_arb_demux_sel]--;
			valid[arbiter.e_arb_demux_sel] = 1;
		end
		if(arbiter.l_read == 1) begin
			buffers[4].updateRead(1);
			flit f = buffers[4].peek();
			outputs[arbiter.l_arb_demux_sel] = f;
			l_credit_o = 1;
			cc[arbiter.l_arb_demux_sel]--;
			valid[arbiter.l_arb_demux_sel] = 1;
		end
		if(pack.n_credit_i == 1) begin
			cc[0]++;
		end
		if(pack.s_credit_i == 1) begin
			cc[1]++;
		end
		if(pack.w_credit_i == 1) begin
			cc[2]++;
		end
		if(pack.e_credit_i == 1) begin
			cc[3]++;
		end
		if(pack.l_credit_i == 1) begin
			cc[4]++;
		end
		
		
	
	endfunction
	
	
	
	


endclass
