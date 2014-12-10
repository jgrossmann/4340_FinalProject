
class arbiter_transaction;

    arbiter_environment env;
	int credit_count [5];
    rand bit reset;
	int x_pos;
	int y_pos;
	
    rand bit n_arb_empty_i;
	rand bit s_arb_empty_i;
	rand bit e_arb_empty_i;
	rand bit w_arb_empty_i;
	rand bit l_arb_empty_i;
	
    rand bit n_arb_credit_i;
	rand bit s_arb_credit_i;
	rand bit w_arb_credit_i;
	rand bit e_arb_credit_i;
	rand bit l_arb_credit_i;
	
	rand logic [7:0] n_arb_address_i;
	rand logic [7:0] s_arb_address_i;
	rand logic [7:0] e_arb_address_i;
	rand logic [7:0] w_arb_address_i;
	rand logic [7:0] l_arb_address_i;
    constraint c {
        reset dist { 0:=(100 - env.reset_density), 1:=env.reset_density };
        n_arb_empty_i dist { 0:=(100 - env.empty_density), 1:=env.empty_density };
		s_arb_empty_i dist { 0:=(100 - env.empty_density), 1:=env.empty_density };
		w_arb_empty_i dist { 0:=(100 - env.empty_density), 1:=env.empty_density };
		e_arb_empty_i dist { 0:=(100 - env.empty_density), 1:=env.empty_density };
		l_arb_empty_i dist { 0:=(100 - env.empty_density), 1:=env.empty_density };
        n_arb_credit_i dist { 0:=(100 - env.credit_density), 1:=env.credit_density };
		s_arb_credit_i dist { 0:=(100 - env.credit_density), 1:=env.credit_density };
		w_arb_credit_i dist { 0:=(100 - env.credit_density), 1:=env.credit_density };
		e_arb_credit_i dist { 0:=(100 - env.credit_density), 1:=env.credit_density };
		l_arb_credit_i dist { 0:=(100 - env.credit_density), 1:=env.credit_density };
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
    endfunction

	function updateCC(int dec[5]);
		foreach(dec[i]) begin
			if(dec[i] == 1) begin
				credit_count[i]--;
			end
		end
	endfunction
	
	

endclass
