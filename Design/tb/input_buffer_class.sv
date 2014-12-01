
class input_buffer;
    flit [4:0] buffer;
    int read_pointer;
    int write_pointer;
    int empty;

    function new();
        read_pointer = 0;
        write_pointer = 0;
        empty = 1;
    endfunction;

    function int full();
        if(~empty) begin
            return read_pointer == write_pointer;
        end else begin
            return 0;
        end
    endfunction

    function void write(input flit f);
        if(~full()) begin
            buffer[write] = f;
            write = (write + 1) % 5;
        end
    endfunction

    function flit read();
        flit temp_buffer;
        if(~empty) begin
            temp_buffer = buffer[read];
            read = (read + 1) % 5;
        end
        return temp_buffer;
    endfunction 
            
endclass
