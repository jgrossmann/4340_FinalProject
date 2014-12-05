
class transaction;

    environment env;
    int packet_tracker;
    flit f;
    rand bit reset;
    rand bit read;
    rand bit write;
    constraint c {
        reset dist { 0:=(100 - env.reset_density), 1:=env.reset_density };
        write dist { 0:=(100 - env.write_density), 1:=env.write_density };
        read dist { 0:=(100 - env.read_density), 1:=env.read_density };
    }

    function new(input environment e);    
        env = e;
        packet_tracker = 0;
        f = new(0);
    endfunction

    function void pre_randomize();
// Sets flit type based on the packet tracker of each port
        if(packet_tracker == 0) begin
            f.flit_type = 0;
            f.x.rand_mode(1); //randomize address if new packet
            f.y.rand_mode(1);
        end else if(packet_tracker == 1) begin
            f.flit_type = 1;
            f.x.rand_mode(0);
            f.y.rand_mode(0);
        end
        f.randomize();
    endfunction

    function void post_randomize();
//Updates the packet tracker if the next flit to be sent is valid
        if(write) begin
            packet_tracker = (packet_tracker + 1) % 5;
        end
    endfunction


endclass
