class flit;

    string type;
    rand bit [15:0] data;
    rand bit [7:0] address;  

    constraint data {
        address[7:0] == data[7:0]
    }

    function new(string t);
        type = t;
    endfunction;

    function new();
    
    endfunction
endclass
