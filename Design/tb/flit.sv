class flit;

    string flit_type;
    rand bit [15:0] data;
    rand int x;
    rand int y;  

    constraint d {
        0 <= x <= 4;
        0 <= y <= 4;
        data[3:0] == y;
        data[7:4] == x;
    }

    function new(string t);
        flit_type = t;
    endfunction;
    
endclass
