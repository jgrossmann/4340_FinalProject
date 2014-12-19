
class arbiter_transaction;

    arbiter_environment env;
	int credit_count [5];
    bit reset;
	rand int reset_rand;
	int x_pos;
	int y_pos;
	int packet_tracker [5];
	int valid [5];
	
    bit n_arb_empty_i;
	bit s_arb_empty_i;
	bit e_arb_empty_i;
	bit w_arb_empty_i;
	bit l_arb_empty_i;
	
    bit n_arb_credit_i;
	bit s_arb_credit_i;
	bit w_arb_credit_i;
	bit e_arb_credit_i;
	bit l_arb_credit_i;
	
	bit n_arb_credit_inc;
	bit s_arb_credit_inc;
	bit w_arb_credit_inc;
	bit e_arb_credit_inc;
	bit l_arb_credit_inc;
	
	rand int n_arb_empty_i_rand;
	rand int s_arb_empty_i_rand;
	rand int e_arb_empty_i_rand;
	rand int w_arb_empty_i_rand;
	rand int l_arb_empty_i_rand;
	
    rand int n_arb_credit_i_rand;
	rand int s_arb_credit_i_rand;
	rand int w_arb_credit_i_rand;
	rand int e_arb_credit_i_rand;
	rand int l_arb_credit_i_rand;
	
	rand logic [15:0] n_arb_address_i;
	rand logic [15:0] s_arb_address_i;
	rand logic [15:0] e_arb_address_i;
	rand logic [15:0] w_arb_address_i;
	rand logic [15:0] l_arb_address_i;
	
	logic [15:0] yx_pos;
	
    constraint c {
        n_arb_empty_i_rand >= 0;
		n_arb_empty_i_rand <= 100;
		s_arb_empty_i_rand >= 0;
		s_arb_empty_i_rand <= 100;
		w_arb_empty_i_rand >= 0;
		w_arb_empty_i_rand <= 100;
		e_arb_empty_i_rand >= 0;
		e_arb_empty_i_rand <= 100;
		l_arb_empty_i_rand >= 0;
		l_arb_empty_i_rand <= 100;
		n_arb_credit_i_rand >= 0;
		n_arb_credit_i_rand <= 100;
		s_arb_credit_i_rand >= 0;
		s_arb_credit_i_rand <= 100;
		w_arb_credit_i_rand >= 0;
		w_arb_credit_i_rand <= 100;
		e_arb_credit_i_rand >= 0;
		e_arb_credit_i_rand <= 100;
		l_arb_credit_i_rand >= 0;
		l_arb_credit_i_rand <= 100;
		reset_rand >= 0;
		reset_rand <= 100;
		n_arb_address_i[3:0] <= 4'b0011;
		n_arb_address_i[7:4] <= 4'b0011;
		n_arb_address_i[3:0] >= y_pos;
		s_arb_address_i[3:0] <= 4'b0011;
		s_arb_address_i[7:4] <= 4'b0011;
		s_arb_address_i[3:0] <= y_pos;
		w_arb_address_i[3:0] <= 4'b0011;
		w_arb_address_i[7:4] <= 4'b0011;
		w_arb_address_i[7:4] >= x_pos;
		e_arb_address_i[3:0] <= 4'b0011;
		e_arb_address_i[7:4] <= 4'b0011;
		e_arb_address_i[7:4] <= x_pos;
		l_arb_address_i[3:0] <= 4'b0011;
		l_arb_address_i[7:4] <= 4'b0011;
		l_arb_address_i[3:0] != y_pos;
		l_arb_address_i[7:4] != x_pos;
    }

    function new(input arbiter_environment e);    
        env = e;
		foreach(credit_count[i]) begin
			credit_count[i] = 5;
			packet_tracker[i] = 0;
			valid[i] = 0;
		end
		n_arb_address_i.rand_mode(1);
		s_arb_address_i.rand_mode(1);
		w_arb_address_i.rand_mode(1);
		e_arb_address_i.rand_mode(1);
		l_arb_address_i.rand_mode(1);
		x_pos = e.x_cor;
		y_pos = e.y_cor;
		yx_pos[3:0] = e.y_cor;
		yx_pos[7:4] = e.x_cor;
		yx_pos[15:8] = 8'b00000000;
    endfunction

    function void post_randomize();
		//n_arb_address_i = n_arb_address_i & 0x00110011;
		//s_arb_address_i = s_arb_address_i & 0x00110011;
		//w_arb_address_i = w_arb_address_i & 0x00110011;
		//e_arb_address_i = e_arb_address_i & 0x00110011;
		//l_arb_address_i = l_arb_address_i & 0x00110011;
		n_arb_credit_inc = n_arb_credit_i_rand < env.credit_density;
		s_arb_credit_inc = s_arb_credit_i_rand < env.credit_density;
		w_arb_credit_inc = w_arb_credit_i_rand < env.credit_density;
		e_arb_credit_inc = e_arb_credit_i_rand < env.credit_density;
		l_arb_credit_inc = l_arb_credit_i_rand < env.credit_density;
		n_arb_empty_i = n_arb_empty_i_rand < env.empty_density;
		s_arb_empty_i = s_arb_empty_i_rand < env.empty_density;
		w_arb_empty_i = w_arb_empty_i_rand < env.empty_density;
		e_arb_empty_i = e_arb_empty_i_rand < env.empty_density;
		l_arb_empty_i = l_arb_empty_i_rand < env.empty_density;
		if(valid[0] == 1) begin
			n_arb_empty_i = 0;
		end
		if(valid[1] == 1) begin
			s_arb_empty_i = 0;
		end
		if(valid[2] == 1) begin
			w_arb_empty_i = 0;
		end
		if(valid[3] == 1) begin
			e_arb_empty_i = 0;
		end
		if(valid[4] == 1) begin
			l_arb_empty_i = 0;
		end
		if(valid[0] == 0 && n_arb_empty_i == 0) begin
			valid[0] = 1;
			n_arb_address_i.rand_mode(0);
		end
		if(valid[1] == 0 && s_arb_empty_i == 0) begin
			valid[1] = 1;
			s_arb_address_i.rand_mode(0);
		end
		if(valid[2] == 0 && w_arb_empty_i == 0) begin
			valid[2] = 1;
			w_arb_address_i.rand_mode(0);
		end
		if(valid[3] == 0 && e_arb_empty_i == 0) begin
			valid[3] = 1;
			e_arb_address_i.rand_mode(0);
		end
		if(valid[4] == 0 && l_arb_empty_i == 0) begin
			valid[4] = 1;
			l_arb_address_i.rand_mode(0);
		end
		reset = reset_rand < env.reset_density;
		if(n_arb_credit_inc) begin
			credit_count[0]++;
		end
		if(s_arb_credit_inc) begin
			credit_count[1]++;
		end
		if(w_arb_credit_inc) begin
			credit_count[2]++;
		end
		if(e_arb_credit_inc) begin
			credit_count[3]++;
		end
		if(l_arb_credit_inc) begin
			credit_count[4]++;
		end
		
		if(credit_count[0] == 0) begin
			n_arb_credit_i = 0;
		end else begin
			n_arb_credit_i = 1;
		end
		if(credit_count[1] == 0) begin
			s_arb_credit_i = 0;
		end else begin
			s_arb_credit_i = 1;
		end
		if(credit_count[2] == 0) begin
			w_arb_credit_i = 0;
		end else begin
			w_arb_credit_i = 1;
		end
		if(credit_count[3] == 0) begin
			e_arb_credit_i = 0;
		end else begin
			e_arb_credit_i = 1;
		end
		if(credit_count[4] == 0) begin
			l_arb_credit_i = 0;
		end else begin
			l_arb_credit_i = 1;
		end
		if(reset == 1) begin
			foreach(credit_count[i]) begin
				credit_count[i] = 5;
				packet_tracker[i] = 0;
				valid[i] = 0;
				
			end
			n_arb_address_i.rand_mode(1);
			s_arb_address_i.rand_mode(1);
			w_arb_address_i.rand_mode(1);
			e_arb_address_i.rand_mode(1);
			l_arb_address_i.rand_mode(1);
		end
    endfunction

	function updateCC(int dec[5]);
		foreach(dec[i]) begin
			if(dec[i] == 1) begin
				credit_count[i]--;
			end
		end
	endfunction
	
	function void directTesting1();
		reset = 0;
		n_arb_empty_i = 0;
		s_arb_empty_i = 0;
		e_arb_empty_i = 1;
		w_arb_empty_i = 1;
		l_arb_empty_i = 1;
		
		n_arb_credit_i = 1;
		s_arb_credit_i = 1;
		w_arb_credit_i = 1;
		e_arb_credit_i = 1;
		l_arb_credit_i = 1;
	
		n_arb_address_i = 16'b0000000000110011;
		s_arb_address_i = 16'b0000000000000000;
		e_arb_address_i = 16'b0000000000000000;
		w_arb_address_i = 16'b0000000000000000;
		l_arb_address_i = 16'b0000000000000000;
		
		if(valid[0] == 0 && n_arb_empty_i == 0) begin
			valid[0] = 1;
			n_arb_address_i.rand_mode(0);
		end
		if(valid[1] == 0 && s_arb_empty_i == 0) begin
			valid[1] = 1;
			s_arb_address_i.rand_mode(0);
		end
		if(valid[2] == 0 && w_arb_empty_i == 0) begin
			valid[2] = 1;
			w_arb_address_i.rand_mode(0);
		end
		if(valid[3] == 0 && e_arb_empty_i == 0) begin
			valid[3] = 1;
			e_arb_address_i.rand_mode(0);
		end
		if(valid[4] == 0 && l_arb_empty_i == 0) begin
			valid[4] = 1;
			l_arb_address_i.rand_mode(0);
		end
	
	
	endfunction
	
	function void directTesting2();
		reset = 0;
		n_arb_empty_i = 0;
		s_arb_empty_i = 0;
		e_arb_empty_i = 1;
		w_arb_empty_i = 0;
		l_arb_empty_i = 1;
		
		n_arb_credit_i = 1;
		s_arb_credit_i = 1;
		w_arb_credit_i = 1;
		e_arb_credit_i = 1;
		l_arb_credit_i = 1;
	
		n_arb_address_i = 16'b0000000000110011;
		s_arb_address_i = 16'b0000000000000000;
		e_arb_address_i = 16'b0000000000000000;
		w_arb_address_i = 16'b0000000000110001;
		l_arb_address_i = 16'b0000000000000000;
		
		if(valid[0] == 0 && n_arb_empty_i == 0) begin
			valid[0] = 1;
			n_arb_address_i.rand_mode(0);
		end
		if(valid[1] == 0 && s_arb_empty_i == 0) begin
			valid[1] = 1;
			s_arb_address_i.rand_mode(0);
		end
		if(valid[2] == 0 && w_arb_empty_i == 0) begin
			valid[2] = 1;
			w_arb_address_i.rand_mode(0);
		end
		if(valid[3] == 0 && e_arb_empty_i == 0) begin
			valid[3] = 1;
			e_arb_address_i.rand_mode(0);
		end
		if(valid[4] == 0 && l_arb_empty_i == 0) begin
			valid[4] = 1;
			l_arb_address_i.rand_mode(0);
		end
	
	
	endfunction
	
	function void directTesting3();
		reset = 0;
		n_arb_empty_i = 0;
		s_arb_empty_i = 0;
		e_arb_empty_i = 0;
		w_arb_empty_i = 0;
		l_arb_empty_i = 0;
		
		n_arb_credit_i = 1;
		s_arb_credit_i = 1;
		w_arb_credit_i = 1;
		e_arb_credit_i = 1;
		l_arb_credit_i = 1;
	
		n_arb_address_i = 16'b0000000000000001;
		s_arb_address_i = 16'b0000000000010001;
		e_arb_address_i = 16'b0000000000000000;
		w_arb_address_i = 16'b0000000000110001;
		l_arb_address_i = 16'b0000000000000000;
		
		if(valid[0] == 0 && n_arb_empty_i == 0) begin
			valid[0] = 1;
			n_arb_address_i.rand_mode(0);
		end
		if(valid[1] == 0 && s_arb_empty_i == 0) begin
			valid[1] = 1;
			s_arb_address_i.rand_mode(0);
		end
		if(valid[2] == 0 && w_arb_empty_i == 0) begin
			valid[2] = 1;
			w_arb_address_i.rand_mode(0);
		end
		if(valid[3] == 0 && e_arb_empty_i == 0) begin
			valid[3] = 1;
			e_arb_address_i.rand_mode(0);
		end
		if(valid[4] == 0 && l_arb_empty_i == 0) begin
			valid[4] = 1;
			l_arb_address_i.rand_mode(0);
		end
	
	
	endfunction
	
	function updatePT(int n, int s, int w, int e, int l);
		if(n == 1) begin
			packet_tracker[0] = (packet_tracker[0]+1)%5;
			if(packet_tracker[0] == 0) begin
				valid[0] = 0;
				n_arb_address_i.rand_mode(1);
			end
		end
		if(s == 1) begin
			packet_tracker[1] = (packet_tracker[1]+1)%5;
			if(packet_tracker[1] == 0) begin
				valid[1] = 0;
				s_arb_address_i.rand_mode(1);
			end
		end
		if(w == 1) begin
			packet_tracker[2] = (packet_tracker[2]+1)%5;
			if(packet_tracker[2] == 0) begin
				valid[2] = 0;
				w_arb_address_i.rand_mode(1);
			end
		end
		if(e == 1) begin
			packet_tracker[3] = (packet_tracker[3]+1)%5;
			if(packet_tracker[3] == 0) begin
				valid[3] = 0;
				e_arb_address_i.rand_mode(1);
			end
		end
		if(l == 1) begin
			packet_tracker[4] = (packet_tracker[4]+1)%5;
			if(packet_tracker[4] == 0) begin
				valid[4] = 0;
				l_arb_address_i.rand_mode(1);
			end
		end

	endfunction
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

endclass
