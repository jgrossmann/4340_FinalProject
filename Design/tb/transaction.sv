
class transaction;

    environment env;
    flit flits [4][4];
    int packet_tracker [4][4];
    rand bit [3:0][3:0] valid;
    constraint c {
        foreach(packet_tracker[i,j])
				if(packet_tracker[i][j] > 0)
            	valid[i][j] == 1;
    }

    function new(input environment e);    
        foreach(flits[i,j]) begin
            flits[i][j] = new("header");
				packet_tracker[i][j] = 0;
				valid[i][j] = 1;
        end
        env = e;
    endfunction

    function void pre_randomize();
// Sets flit type based on the packet tracker of each port
        foreach(packet_tracker[i,j]) begin
        		if(packet_tracker[i][j] == 0) begin
            	flits[i][j].flit_type = "header";
               flits[i][j].address.rand_mode(1); //randomize address if new packet
       		end else if(packet_tracker[i][j] == 1) begin
               flits[i][j].flit_type = "body";        
               flits[i][j].address.rand_mode(0); //keep address same if body flit
            end
				flits[i][j].randomize();
        end
    endfunction

    function void post_randomize();
//Updates the packet tracker if the next flit to be sent is valid
        foreach(valid[i,j]) begin
        		if(valid[i][j]) begin
            	packet_tracker[i][j] = (packet_tracker[i][j] + 1) % 5;
            end
        end
    endfunction


endclass
