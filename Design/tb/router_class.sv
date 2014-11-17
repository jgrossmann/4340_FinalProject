class router;

	logic x_pos;
	logic y_pos;
	arbiter arb;
	input_buffer north_buf;
	input_buffer south_buf;
	input_buffer west_buf;
	input_buffer east_buf;
	input_buffer local_buf;
	credit_counter north_cc;
	credit_counter south_cc;
	credit_counter west_cc;
	credit_counter east_cc;
	mux north_mux;
	mux south_mux;
	mux west_mux;
	mux east_mux;
	

	function new(input logic x_cor, y_cor);
		x_pos = x_cor;
		y_pos = y_cor;
		north_buf = new();
		south_buf = new();
		west_buf = new();
		east_buf = new();
		local_buf = new();
		north_cc = new();
		south_cc = new();
		west_cc = new();
		east_cc = new();
		north_mux = new();
		south_mux = new();
		
	
	endfunction




endclass