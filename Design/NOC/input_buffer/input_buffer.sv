
`include "ram.sv"
`include "rw_pointer.sv"

module input_buffer #(parameter DATA_WIDTH=16, parameter ADDR_WIDTH=3, parameter DEPTH=5, parameter SIZE=(DEPTH*DATA_WIDTH) ) (

input clk, 
input reset, 
input [DATA_WIDTH-1:0] buf_data_i,
input buf_write_i,
input buf_read_i, 
output buf_empty_o,
output buf_valid_o, 
output [DATA_WIDTH-1:0] buf_data_o

);

// Instantiate "RAM"

wire [ADDR_WIDTH-1:0] ram_waddr_temp;
wire [ADDR_WIDTH-1:0] ram_raddr_temp;
logic [DATA_WIDTH-1:0] ram_rdata_o_temp; 


ram ip_ram (

       .clk (clk),
       .reset (reset),
       .ram_waddr_i (ram_waddr_temp),
       .ram_wdata_i (buf_data_i), 
       .ram_raddr_i (ram_raddr_temp), 
       .ram_wenable_i (buf_write_i), 
       .ram_rdata_o (ram_rdata_o_temp)

);


// Instantiate "Read pointer"

rw_pointer read_pointer (

       .clk (clk),
       .reset (reset),
       .rwptr_inc_i (buf_read_i),
       .rwptr_addr_o (ram_raddr_temp) 
   
);

// Instantiate "Write pointer"

rw_pointer write_pointer (

       .clk (clk),
       .reset (reset),
       .rwptr_inc_i (buf_write_i),
       .rwptr_addr_o (ram_waddr_temp) 
   
);

assign buf_data_o = ram_rdata_o_temp; 
assign buf_empty_o = (ram_raddr_temp == ram_waddr_temp); 
assign buf_valid_o = buf_read_i;


endmodule


