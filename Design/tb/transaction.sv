class transaction;
    //NOT FINISHED. CANT DECIDE IF TRANSACTION SHOULD CONTAIN ALL FLITS OR MULTIPLE
    //TRANSACTION OBJECTS EACH WHICH CONTAIN ONE FLIT FOR ONE LOCAL PORT

    environment env;
    flit [3:0][3:0] flits;
    int [3:0][3:0] packet_tracker;
    rand bit [3:0][3:0] valid;
    constraint c {
        for(int i=0; i<4; i++) begin
           for(int j=0; j<4; j++) begin
                if(pacekt_tracker[i][j] > 0) begin
                    valid[i][j] = 1;
                end
           end
        end
    }

    function new(input environment e);    
        foreach(flits[i,j]) begin
            flits[i,j] = new("header");
        end
        foreach(packet_tracker[i,j]) begin
            packet_tracker[i,j] = 0;
        end
        foreach(valid[i,j]) begin
            valid[i,j] = 1;
        end
        env = e
    endfunction

    function void pre_randomize();
// Sets flit type based on the packet tracker of each port
        for(int i=;0 i<4; i++) begin
            for(int j=0; j<4; j++) begin
                if(packet_tracker[i][j] == 0) begin
                    flits[i][j].type = "header";
                    flits[i][j].address.rand_mode(1); //randomize address if new packet
                end else if(packet_tracker[i][j] == 1) begin
                    flits[i][j].type = "body";        
                    flits[i][j].address.rand_mode(0); //keep address same if body flit
                end
            end
        end
        flits.randomize();
    endfunction

    function void post_randomize();
//Updates the packet tracker if the next flit to be sent is valid
        for(int i=0; i<4; i++) begin
            for(int j=0; i<4; j++) begin
                if(valid[i][j]) begin
                    packet_tracker[i][j] = (packet_tracker[i][j] + 1) % 5;
                end
            end
        end
    endfunction


endclass
