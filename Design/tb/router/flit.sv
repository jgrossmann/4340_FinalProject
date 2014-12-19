class flit;

    int flit_type;      //0 is header and 1 is body
    rand bit [15:0] data;
    rand int x;
    rand int y;

    constraint d {
        x >= 0;
		x <= 3;
		y >= 0;
		y <= 3;
        //data[3:0] == y;
        //data[7:4] == x;
    }
	
	function void post_randomize();
		if(flit_type == 0) begin
			data[3:0] = y;
			data[7:4] = x;
		end
	endfunction

    function new(int t);
        changeType(t);
    endfunction;
    
	function void changeType(int t);
		flit_type = t;
	endfunction
	
	function setHeader(int x_pos, int y_pos);
		x = x_pos;
		y = y_pos;
		data[3:0] = y;
		data[7:4] = x;
	endfunction
	
	
endclass
