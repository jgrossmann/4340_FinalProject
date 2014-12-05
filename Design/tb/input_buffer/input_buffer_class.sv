
class input_buffer;
    flit buffer [5];
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
            buffer[write_pointer] = f;
            write_pointer = (write_pointer + 1) % 5;
        end
    endfunction

    function flit read();
        flit temp_buffer = null;
        if(~empty) begin
            temp_buffer = buffer[read_pointer];
            read_pointer = (read_pointer + 1) % 5;
        end
        return temp_buffer;
    endfunction 

    function int getX();
        return buffer[read_pointer].x;
    endfunction

    function int getY();
        return buffer[read_pointer].y;
    endfunction
            
endclass
