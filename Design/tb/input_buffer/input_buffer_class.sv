`timescale 1ns/1ps

class input_buffer_class;
    flit buffer [5];
    int read_pointer;
    int write_pointer;
    int empty;

    function new();
        empty = 1;
    endfunction;

    function void reset();

        foreach(buffer[i]) begin
            buffer[i] = null;
        end

        read_pointer = 0;
        write_pointer = 0;
        empty = 1;

    endfunction

    function flit peek();
        if(~empty) begin
            return buffer[read_pointer];
        end else begin
            return null;
        end
    endfunction

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
