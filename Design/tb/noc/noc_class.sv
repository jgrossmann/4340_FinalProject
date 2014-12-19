class noc_class;

	router_class r [4][4];
	flit flit_o [4][4]; //stores flits that have just arrived at their final destination. This will be used by the checker to check for correctness
	int cc_updates [4][4][4];
	int local_counter[4][4];
	flit outputs [4][4];
	flit router_out [4][4][4];
	int router_out_valid [4][4][4];
	int router_out_cred [4][4][4];
	router_environment rEnv;
	router_transaction rPack;
	int valid_o [4][4];
	int credit_o [4][4];
	int i;
	int j;
	
	function new();
		for(int i = 0; i < 4; i++) begin
			for(int j = 0; j < 4; j++) begin
				r[i][j] = new(i,j);
			end
		end
		
		for(int i = 0; i < 4; i++) begin
			for(int j = 0; j < 4; j++) begin
				for(int k = 0; k < 4; k++) begin
					router_out[i][j][k] = null;
					router_out_cred[i][j][k] = 0;
					cc_updates[i][j][k] = 0;
					router_out_valid[i][j][k] = 0;
				end
			end
		end
		rEnv = new();
		rPack = new(rEnv);
	endfunction

	function void updateRouters(noc_transaction pack);
		for(int i = 0; i < 4; i++) begin
			for(int j = 0; j < 4; j++) begin
				if(i != 0) begin
					if(router_out_valid[i-1][j][1] == 1) begin
						rPack.n_f_i = router_out[i-1][j][1];
						rPack.n_valid_i = 1;
					end else begin
						rPack.n_valid_i = 0;
					end
					rPack.n_credit_i = router_out_cred[i-1][j][1];
				end else begin
					rPack.n_valid_i = 0;
					rPack.n_credit_i = 0;
				end
				
				if(i != 3) begin
					if(router_out_valid[i+1][j][0] == 1) begin
						rPack.s_f_i = router_out[i+1][j][0];
						rPack.s_valid_i = 1;
					end else begin
						rPack.s_valid_i = 0;
					end
					rPack.s_credit_i = router_out_cred[i+1][j][0];
				end else begin
					rPack.s_valid_i = 0;
					rPack.s_credit_i = 0;
				end
					
				if(j != 0) begin
					if(router_out_valid[i][j-1][3] == 1) begin
						rPack.w_f_i = router_out[i][j-1][3];
						rPack.w_valid_i = 1;
					end else begin
						rPack.w_valid_i = 0;
					end
					rPack.w_credit_i = router_out_cred[i][j-1][3];
				end else begin
					rPack.w_valid_i = 0;
					rPack.w_credit_i = 0;
				end
					
				if(j != 3) begin
					if(router_out_valid[i][j+1][2] == 1) begin
						rPack.e_f_i = router_out[i][j+1][2];
						rPack.e_valid_i = 1;
					end else begin
						rPack.e_valid_i = 0;
					end
					rPack.e_credit_i = router_out_cred[i][j+1][2];
				end else begin
					rPack.e_valid_i = 0;
					rPack.e_credit_i = 0;
				end
				
				rPack.l_f_i = pack.input_flits[i][j][pack.packet_tracker[i][j]];
				rPack.l_valid_i = pack.valid_i[i][j];
				rPack.l_credit_i = pack.credit_i[i][j];
				
				r[i][j].updateRouter(rPack);
				
				for(int q = 0; q < 4; q++) begin
					router_out[i][j][q] = r[i][j].outputs[q];
					router_out_cred[i][j][q] = r[i][j].credit_o[q];
					router_out_valid[i][j][q] = r[i][j].valid[q];
				end
				
				flit_o[i][j] = r[i][j].outputs[4];
				credit_o[i][j] = r[i][j].credit_o[4];
				valid_o[i][j] = r[i][j].valid[4];
					
				/*outputs[i][j] = null;
				int port;
				for(port = 0; port < 4; port++) begin
					flit f = r[i][j].send(port);
					int inbuf = r[i][j].portToken(port);
					storeCCUpdate(i,j,inbuf);
					if(f != null) begin
						router next = oppRouter(i, j, port);
						if(port%2 == 0) begin
							int rec_port = port++;
						end else begin
							int rec_port = port--;
						end
						next.receive(f, 1, rec_port);
					end
				end
				flit f = r[i][j].send(4);
				if(f != null) begin
					outputs[i][j] = f;
				end*/
			end
		end
		/*foreach(cc_updates[i][j][k]) begin
			if(cc_updates[i][j][k] == 1) begin
				r[i][j].updateCC(k, 1);
				cc_updates[i][j][k] = 0;
			end
		end*/

	endfunction
	
	/*function void storeCCUpdate(int i, int j, int port)
		if(port == 0) begin
			cc_updates[i-1][j][1] = 1;
		end else if(port == 1) begin
			cc_updates[i+1][j][0] = 1;
		end else if(port == 2) begin
			cc_updates[i][j-1][3] = 1;
		end else if(port == 3) begin
			cc_updates[i][j+1][2] = 1;
		end
		
	
	endfunction

	function router oppRouter(int i, int j, int dir)
		if(dir == 0) begin
			return r[i-1][j];
		end
		if(dir == 1) begin
			return r[i+1][j];
		end
		if(dir == 2) begin
			return r[i][j-1];
		end
		if(dir == 3) begin
			return r[i][j+1];
		end
	endfunction*/
	

endclass
