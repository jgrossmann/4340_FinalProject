
class router;
    
    // Constants to make port identification easier
    const int NORTH = 0;
    const int SOUTH = 1;
    const int WEST = 2;
    const int EAST = 3;
    const int LOCAL = 4;

	logic x_pos;
	logic y_pos;
	input_buffer buffers [5];
	int cc [5];
   int packet_tracker [5];	

	function new(input logic x_cor, y_cor);
		x_pos = x_cor;
		y_pos = y_cor;
      foreach(cc[i]) begin
			buffers[i] = new();
      	cc[i] = 0;
			packet_tracker[i] = 0;
      end
	endfunction

	function arbiter();

	endfunction


endclass
