class flit;

    string flit_type;
    rand bit [15:0] data;
    rand bit [7:0] address;  

    constraint d {
        address[7:0] == data[7:0];
    }

    function new(string t);
        flit_type = t;
    endfunction;
    
endclass
