class network;

	router r [4][4];

	function new();
		foreach(r[i,j]) begin
			r[i][j] = new(i,j);
		end	
	endfunction
	
	//May have to spawn separate threads in order to make writes and reads happen sequentially

endclass
