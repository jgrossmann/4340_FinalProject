class noc_transaction;

    noc_environment env;
	int cc [4][4];
	int packet_tracker [4][4];
    bit reset;
	rand int reset_rand;
	
    int valid_i [4][4];
	
	//int credit_i [4][4];
	
	rand int valid_rand [4][4];
	
    rand int credit_rand [4][4];
	
	flit input_flits [4][4][5];
	
	rand int xys [4][4][2];
	
	int credit_i [4][4];
	int i;
	int j;
	
    constraint c {
		/*for(i = 0; i < 4; i++) begin
			for(j = 0; j < 4; j++) begin
				valid_rand[i][j] >=0;
				valid_rand[i][j] <= 100;
				credit_rand[i][j] >= 0;
				credit_rand[i][j] <= 100;
			end
		end*/
		valid_rand[0][0] >=0;
		valid_rand[0][0] <= 100;
		credit_rand[0][0] >= 0;
		credit_rand[0][0] <= 100;
		valid_rand[0][1] >=0;
		valid_rand[0][1] <= 100;
		credit_rand[0][1] >= 0;
		credit_rand[0][1] <= 100;
		valid_rand[0][2] >=0;
		valid_rand[0][2] <= 100;
		credit_rand[0][2] >= 0;
		credit_rand[0][2] <= 100;
		valid_rand[0][3] >=0;
		valid_rand[0][3] <= 100;
		credit_rand[0][3] >= 0;
		credit_rand[0][3] <= 100;
		valid_rand[1][0] >=0;
		valid_rand[1][0] <= 100;
		credit_rand[1][0] >= 0;
		credit_rand[1][0] <= 100;
		valid_rand[1][1] >=0;
		valid_rand[1][1] <= 100;
		credit_rand[1][1] >= 0;
		credit_rand[1][1] <= 100;
		valid_rand[1][2] >=0;
		valid_rand[1][2] <= 100;
		credit_rand[1][2] >= 0;
		credit_rand[1][2] <= 100;
		valid_rand[1][3] >=0;
		valid_rand[1][3] <= 100;
		credit_rand[1][3] >= 0;
		credit_rand[1][3] <= 100;
		valid_rand[2][0] >=0;
		valid_rand[2][0] <= 100;
		credit_rand[2][0] >= 0;
		credit_rand[2][0] <= 100;
		valid_rand[2][1] >=0;
		valid_rand[2][1] <= 100;
		credit_rand[2][1] >= 0;
		credit_rand[2][1] <= 100;
		valid_rand[2][2] >=0;
		valid_rand[2][2] <= 100;
		credit_rand[2][2] >= 0;
		credit_rand[2][2] <= 100;
		valid_rand[2][3] >=0;
		valid_rand[2][3] <= 100;
		credit_rand[2][3] >= 0;
		credit_rand[2][3] <= 100;
		valid_rand[3][0] >=0;
		valid_rand[3][0] <= 100;
		credit_rand[3][0] >= 0;
		credit_rand[3][0] <= 100;
		valid_rand[3][1] >=0;
		valid_rand[3][1] <= 100;
		credit_rand[3][1] >= 0;
		credit_rand[3][1] <= 100;
		valid_rand[3][2] >=0;
		valid_rand[3][2] <= 100;
		credit_rand[3][2] >= 0;
		credit_rand[3][2] <= 100;
		valid_rand[3][3] >=0;
		valid_rand[3][3] <= 100;
		credit_rand[3][3] >= 0;
		credit_rand[3][3] <= 100;
		/*foreach(valid_rand[i,j]) begin
			valid_rand[i][j] >=0;
			valid_rand[i][j] <= 100;
			credit_rand[i][j] >= 0;
			credit_rand[i][j] <= 100;
		end*/
		reset_rand >= 0;
		reset_rand <= 100;
		xys[0][0][0] != 0;
		xys[0][0][1] != 0;
		xys[0][1][0] != 0;
		xys[0][1][1] != 1;
		xys[0][2][0] != 0;
		xys[0][2][1] != 2;
		xys[0][3][0] != 0;
		xys[0][3][1] != 3;
		xys[1][0][0] != 1;
		xys[1][0][1] != 0;
		xys[1][1][0] != 1;
		xys[1][1][1] != 1;
		xys[1][2][0] != 1;
		xys[1][2][1] != 2;
		xys[1][3][0] != 1;
		xys[1][3][1] != 3;
		xys[2][0][0] != 2;
		xys[2][0][1] != 0;
		xys[2][1][0] != 2;
		xys[2][1][1] != 1;
		xys[2][2][0] != 2;
		xys[2][2][1] != 2;
		xys[2][3][0] != 2;
		xys[2][3][1] != 3;
		xys[3][0][0] != 3;
		xys[3][0][1] != 0;
		xys[3][1][0] != 3;
		xys[3][1][1] != 1;
		xys[3][2][0] != 3;
		xys[3][2][1] != 2;
		xys[3][3][0] != 3;
		xys[3][3][1] != 3;
    }

    function new(input noc_environment e);    
        env = e;
		for(int i = 0; i < 4; i++) begin
			for(int j = 0; j < 4; j++) begin
				packet_tracker[i][j] = 0;
				cc[i][j] = 5;
				credit_i[i][j] = 0;
			end
		end
    endfunction

    function void post_randomize();
		for(int i = 0; i < 4; i++) begin
			for(int j = 0; j < 4; j++) begin
				valid_i[i][j] = valid_rand[i][j] < env.valid_density;
				if(packet_tracker[i][j] > 0) begin
					valid_i[i][j] = 1;
				end
				if(valid_i[i][j] == 1 && packet_tracker[i][j] == 0) begin
					newPack(i,j);
				end
			end
		end
		
		reset = reset_rand < env.reset_density;
		if(reset == 1) begin
			return;
		end
		
		/*if(reset == 1) begin
			foreach(credit_count_i[i]) begin
				credit_count_i[i] = 5;
				credit_count_e[i] = 5;
			end
		end
		if(n_valid_i) begin
			n_f_i.randomize();
			n_f_i.x = n_f_x;
			n_f_i.y = n_f_y;
			if(flit_type == 0) begin
				n_f_i.data[3:0] = n_f_y;
				n_f_i.data[7:4] = n_f_x;
			end
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
				$display("making a header flit");
				w_f_i.changeType(0);
			end else begin
				w_f_i.changeType(1);
				$display("making a body flit");
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
		end*/
		
    endfunction

	/*function updateCC(int inc[4][4]);
		
		foreach(inc[i][j]) begin
			if(dec_e[i] == 1) begin
				credit_count_e[i]--;
			end
			if(inc_i[i] == 1) begin
				credit_count_i[i]++;
			end
		end
	endfunction*/
	
	function void reset_func();
		for(int i = 0; i < 4; i++) begin
			for(int j = 0; j < 4; j++) begin
				packet_tracker[i][j] = 0;
				cc[i][j] = 5;
				credit_i[i][j] = 0;
			end
		end
	endfunction
	
	
	function newPack(int x, int y);
		for(int k = 0; k < 5; k++) begin
			if(k == 0) begin
				input_flits[x][y][k] = new(0);
				input_flits[x][y][k].randomize();
				input_flits[x][y][k].setHeader(xys[x][y][0], xys[x][y][1]);
			end else begin
				input_flits[x][y][k] = new(1);
				input_flits[x][y][k].randomize();
			end
		end
	endfunction
	
	function updatePackTrack();
		for(int i = 0; i < 4; i++) begin
			for(int j = 0; j < 4; j++) begin
				if(valid_i[i][j]) begin
					packet_tracker[i][j] = (packet_tracker[i][j]+1)%5;
				end
			end
		end
	endfunction
	
	

endclass
