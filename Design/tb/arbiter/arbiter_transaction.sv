
class arbiter_transaction;

    arbiter_environment env;
	int credit_count [5];
    bit reset;
	rand int reset_rand;
	int x_pos;
	int y_pos;
	
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
	
	rand logic [7:0] n_arb_address_i;
	rand logic [7:0] s_arb_address_i;
	rand logic [7:0] e_arb_address_i;
	rand logic [7:0] w_arb_address_i;
	rand logic [7:0] l_arb_address_i;
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
		end
		x_pos = e.x_cor;
		y_pos = e.y_cor;
    endfunction

    function void post_randomize();
		//n_arb_address_i = n_arb_address_i & 0x00110011;
		//s_arb_address_i = s_arb_address_i & 0x00110011;
		//w_arb_address_i = w_arb_address_i & 0x00110011;
		//e_arb_address_i = e_arb_address_i & 0x00110011;
		//l_arb_address_i = l_arb_address_i & 0x00110011;
		n_arb_credit_i = n_arb_credit_i_rand < env.credit_density;
		s_arb_credit_i = s_arb_credit_i_rand < env.credit_density;
		w_arb_credit_i = w_arb_credit_i_rand < env.credit_density;
		e_arb_credit_i = e_arb_credit_i_rand < env.credit_density;
		l_arb_credit_i = l_arb_credit_i_rand < env.credit_density;
		n_arb_empty_i = n_arb_empty_i_rand < env.empty_density;
		s_arb_empty_i = s_arb_empty_i_rand < env.empty_density;
		w_arb_empty_i = w_arb_empty_i_rand < env.empty_density;
		e_arb_empty_i = e_arb_empty_i_rand < env.empty_density;
		l_arb_empty_i = l_arb_empty_i_rand < env.empty_density;
		reset = reset_rand < env.reset_density;
		if(credit_count[0] == 5) begin
			n_arb_credit_i = 0;
		end
		if(credit_count[1] == 5) begin
			s_arb_credit_i = 0;
		end
		if(credit_count[2] == 5) begin
			w_arb_credit_i = 0;
		end
		if(credit_count[3] == 5) begin
			e_arb_credit_i = 0;
		end
		if(credit_count[4] == 5) begin
			l_arb_credit_i = 0;
		end
		if(reset == 1) begin
			foreach(credit_count[i]) begin
				credit_count[i] = 5;
			end
		end
    endfunction

	function updateCC(int dec[5]);
		foreach(dec[i]) begin
			if(dec[i] == 1) begin
				credit_count[i]--;
			end
		end
	endfunction
	
	

endclass
