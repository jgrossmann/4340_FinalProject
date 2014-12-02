`include "environment.sv"
`include "flit.sv"

class transaction;
    //NOT FINISHED. CANT DECIDE IF TRANSACTION SHOULD CONTAIN ALL FLITS OR MULTIPLE
    //TRANSACTION OBJECTS EACH WHICH CONTAIN ONE FLIT FOR ONE LOCAL PORT

    environment env;
    flit f;
    int packet_tracker;
    rand bit valid;
    constraint densities {
    }

    function new(input environment e)    
        packet_tracker = 0;
        f = new();
        valid = 0;
        env = e
    endfunction


endclass
