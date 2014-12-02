`include "input_buffer_class.sv"

class router;
    
    // Constants to make port identification easier
    const int NORTH = 0;
    const int SOUTH = 1;
    const int WEST = 2;
    const int EAST = 3;
    const int LOCAL = 4;

	logic x_pos;
	logic y_pos;
	input_buffer north_buf;
	input_buffer south_buf;
	input_buffer west_buf;
	input_buffer east_buf;
	input_buffer local_buf;
    int [4:0] cc;
    int [4:0] packet_tracker;	

	function new(input logic x_cor, y_cor);
		x_pos = x_cor;
		y_pos = y_cor;
        north_buf = new();
		south_buf = new();
		west_buf = new();
		east_buf = new();
		local_buf = new();
        foreach(cc[i]) begin
            cc[i] = 0;
        end
		foreach(packet_tracker[i]) begin
            packet_tracker[i] = 0;
        end
	
	endfunction

	function arbiter();

	endfunction


endclass
