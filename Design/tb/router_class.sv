`include "tb/input_buffer_class.sv"

class router;

	logic x_pos;
	logic y_pos;
	input_buffer north_buf;
	input_buffer south_buf;
	input_buffer west_buf;
	input_buffer east_buf;
	input_buffer local_buf;
	int north_cc;
	int south_cc;
	int west_cc;
	int east_cc;
	int local_cc;
	

	function new(input logic x_cor, y_cor);
		x_pos = x_cor;
		y_pos = y_cor;
		north_buf = new();
		south_buf = new();
		west_buf = new();
		east_buf = new();
		local_buf = new();
		
	
	endfunction

	function arbiter();

	endfunction


endclass
