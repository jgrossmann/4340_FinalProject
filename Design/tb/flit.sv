class flit;

    int flit_type;      //0 is header and 1 is body
    rand bit [15:0] data;
    rand int x;
    rand int y;  

    constraint d {
        0 <= x <= 3;
        0 <= y <= 3;
        data[3:0] == y;
        data[7:4] == x;
    }

    function new(int t);
        flit_type = t;
    endfunction;

	function changeType(int t);
		flit_type = t;
	end
    
endclass
