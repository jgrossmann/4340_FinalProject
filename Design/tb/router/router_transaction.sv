
class router_transaction;

    router_environment env;
	int credit_count_i [5];
	int credit_count_e [5];
	int packet_tracker [5];
    bit reset;
	rand int reset_rand;
	int x_pos;
	int y_pos;
	
    bit n_valid_i;
	bit s_valid_i;
	bit e_valid_i;
	bit w_valid_i;
	bit l_valid_i;
	
    bit n_credit_i;
	bit s_credit_i;
	bit w_credit_i;
	bit e_credit_i;
	bit l_credit_i;
	
	rand int n_valid_i_rand;
	rand int s_valid_i_rand;
	rand int e_valid_i_rand;
	rand int w_valid_i_rand;
	rand int l_valid_i_rand;
	
    rand int n_credit_i_rand;
	rand int s_credit_i_rand;
	rand int w_credit_i_rand;
	rand int e_credit_i_rand;
	rand int l_credit_i_rand;
	
	flit n_f_i;
	flit s_f_i;
	flit w_f_i;
	flit e_f_i;
	flit l_f_i;
	
	/*flit n_f_o;
	flit s_f_o;
	flit w_f_o;
	flit e_f_o;
	flit l_f_o;*/
	
    constraint c {
        n_valid_i_rand >= 0;
		n_valid_i_rand <= 100;
		s_valid_i_rand >= 0;
		s_valid_i_rand <= 100;
		w_valid_i_rand >= 0;
		w_valid_i_rand <= 100;
		e_valid_i_rand >= 0;
		e_valid_i_rand <= 100;
		l_valid_i_rand >= 0;
		l_valid_i_rand <= 100;
		n_credit_i_rand >= 0;
		n_credit_i_rand <= 100;
		s_credit_i_rand >= 0;
		s_credit_i_rand <= 100;
		w_credit_i_rand >= 0;
		w_credit_i_rand <= 100;
		e_credit_i_rand >= 0;
		e_credit_i_rand <= 100;
		l_credit_i_rand >= 0;
		l_credit_i_rand <= 100;
		reset_rand >= 0;
		reset_rand <= 100;
    }

    function new(input router_environment e);    
        env = e;
		foreach(credit_count_i[i]) begin
			credit_count_i[i] = 5;
			credit_count_e[i] = 5;
			packet_tracker[i] = 0;
		end
		x_pos = e.x_cor;
		y_pos = e.y_cor;
		n_f_i = new(0);
		s_f_i = new(0);
		w_f_i = new(0);
		e_f_i = new(0);
		l_f_i = new(0);
    endfunction

    function void post_randomize();
		n_credit_i = n_credit_i_rand < env.n_credit_density;
		s_credit_i = s_credit_i_rand < env.s_credit_density;
		w_credit_i = w_credit_i_rand < env.w_credit_density;
		e_credit_i = e_credit_i_rand < env.e_credit_density;
		l_credit_i = l_credit_i_rand < env.l_credit_density;
		n_valid_i = n_valid_i_rand < env.n_valid_density;
		s_valid_i = s_valid_i_rand < env.s_valid_density;
		w_valid_i = w_valid_i_rand < env.w_valid_density;
		e_valid_i = e_valid_i_rand < env.e_valid_density;
		l_valid_i = l_valid_i_rand < env.l_valid_density;
		reset = reset_rand < env.reset_density;
		if(credit_count_e[0] == 5) begin
			n_credit_i = 0;
		end
		if(credit_count_e[1] == 5) begin
			s_credit_i = 0;
		end
		if(credit_count_e[2] == 5) begin
			w_credit_i = 0;
		end
		if(credit_count_e[3] == 5) begin
			e_credit_i = 0;
		end
		if(credit_count_e[4] == 5) begin
			l_credit_i = 0;
		end
		if(credit_count_i[0] == 0) begin
			n_valid_i = 0;
		end
		if(credit_count_i[1] == 0) begin
			s_valid_i = 0;
		end
		if(credit_count_i[2] == 0) begin
			w_valid_i = 0;
		end
		if(credit_count_i[3] == 0) begin
			e_valid_i = 0;
		end
		if(credit_count_i[4] == 0) begin
			l_valid_i = 0;
		end
		if(reset == 1) begin
			foreach(credit_count_i[i]) begin
				credit_count_i[i] = 5;
				credit_count_e[i] = 5;
			end
		end
		if(n_valid_i) begin
			n_f_i.randomize();
			if(packet_tracker[0] == 0) begin
				n_f_i.changeType(0);
			end else begin
				n_f_i.changeType(1);
			end
			packet_tracker[0] = (packet_tracker[0] + 1) % 5;
			credit_count_i[0]--;
		end
		if(s_valid_i) begin
			s_f_i.randomize();
			if(packet_tracker[1] == 0) begin
				s_f_i.changeType(0);
			end else begin
				s_f_i.changeType(1);
			end
			packet_tracker[1] = (packet_tracker[1] + 1) % 5;
			credit_count_i[1]--;
		end
		if(w_valid_i) begin
			w_f_i.randomize();
			if(packet_tracker[2] == 0) begin
				w_f_i.changeType(0);
			end else begin
				w_f_i.changeType(1);
			end
			packet_tracker[2] = (packet_tracker[2] + 1) % 5;
			credit_count_i[2]--;
		end
		if(e_valid_i) begin
			e_f_i.randomize();
			if(packet_tracker[3] == 0) begin
				e_f_i.changeType(0);
			end else begin
				e_f_i.changeType(1);
			end
			packet_tracker[3] = (packet_tracker[3] + 1) % 5;
			credit_count_i[3]--;
		end
		if(l_valid_i) begin
			l_f_i.randomize();
			if(packet_tracker[4] == 0) begin
				l_f_i.changeType(0);
			end else begin
				l_f_i.changeType(1);
			end
			packet_tracker[4] = (packet_tracker[4] + 1) % 5;
			credit_count_i[4]--;
		end
		if(n_credit_i) begin
			credit_count_e[0]++;
		end
		if(s_credit_i) begin
			credit_count_e[1]++;
		end
		if(w_credit_i) begin
			credit_count_e[2]++;
		end
		if(e_credit_i) begin
			credit_count_e[3]++;
		end
		if(l_credit_i) begin
			credit_count_e[4]++;
		end
		
    endfunction

	function updateCC(int inc_i[5], int dec_e[5]);
		if(reset == 1) begin
			foreach(credit_count_i[i]) begin
				credit_count_i[i] = 5;
				credit_count_e[i] = 5;
			end
			return;
		end
	
		foreach(dec_e[i]) begin
			if(dec_e[i] == 1) begin
				credit_count_e[i]--;
			end
			if(inc_i[i] == 1) begin
				credit_count_i[i]++;
			end
		end
	endfunction
	
	

endclass
