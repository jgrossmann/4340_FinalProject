class network;

	router r [4][4];
	flit fs [4][4]; //stores flits that have just arrived at their final destination. This will be used by the checker to check for correctness
	int cc_updates [4][4][4];
	
	function new();
		foreach(r[i,j]) begin
			r[i][j] = new(i,j);
		end	
	endfunction

	function fs[][] updateRouters()
		foreach(r[i,j]) begin
			fs[i,j] = null;
			int port;
			for(port = 0; port < 4; port++) begin
				flit f = r[i,j].send(port);
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
		return fs;

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
