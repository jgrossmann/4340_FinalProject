class network;

	router r [4][4];
	flit fs [4][4]; //stores flits that have just arrived at their final destination. This will be used by the checker to check for correctness
	int cc_updates [4][4][4];
	int local_counter[4][4];
	
	function new();
		foreach(r[i,j]) begin
			r[i][j] = new(i,j);
		end
		foreach(cc_updates[i][j][k]) begin
			cc_updates[i][j][k] = 0;
		end
	endfunction

	function fs[][] updateRouters()
		foreach(r[i,j]) begin
			fs[i,j] = null;
			int port;
			for(port = 0; port < 4; port++) begin
				flit f = r[i,j].send(port);
				int inbuf = r[i,j].portToken(port);
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
			flit f = r[i,j].send(4);
			if(f != null) begin
				fs[i,j] = f;
			end
		end
		foreach(cc_updates[i][j][k]) begin
			if(cc_updates[i][j][k] == 1) begin
				r[i][j].updateCC(k, 1);
				cc_updates[i][j][k] = 0;
			end
		end
		return fs;

	endfunction
	
	function void storeCCUpdate(int i, int j, int port)
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
	endfunction
	
	//May have to spawn separate threads in order to make writes and reads happen sequentially

endclass
