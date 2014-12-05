module buffer_interface(input bit clk);

    logic reset;
    logic buf_write_i;
    logic buf_read_i;
    logic [15:0] buf_data_i;
    
    logic buf_empty_o;
    logic buf_valid_o;
    logic [15:0] buf_data_o;

    clocking cb(@posedge clk);
        output reset;
        output buf_write_i;
        output buf_read_i;
        output buf_data_i;
        input buf_empty_o;
        input buf_valid_o;
        input buf_data_o;
    endclocking

    modport bench(clocking cb);
    modport dut (
        input clk,
        input reset,
        input buf_write_i,
        input buf_read_i,
        input buf_data_i,
        output buf_empty_o,
        output buf_valid_o,
        output buf_data_o
    );

endmodule
