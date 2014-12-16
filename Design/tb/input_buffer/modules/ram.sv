
`include "modules/mux_ram.sv"
`include "modules/decoder_ram.sv"
`include "modules/ff_ram.sv"

module ram #(parameter DATA_WIDTH=16, parameter ADDR_WIDTH=3, parameter DEPTH=5, parameter SIZE=(DEPTH*DATA_WIDTH) ) (

input clk, 
input reset, 
input [ADDR_WIDTH-1:0] ram_waddr_i,
input ram_wenable_i,
input [DATA_WIDTH-1:0] ram_wdata_i,
input [ADDR_WIDTH-1:0] ram_raddr_i, 
output [DATA_WIDTH-1:0] ram_rdata_o,
output [DEPTH-1:0] valid_flit_o
);

// Mux for "Read" function 
wire [SIZE-1:0] all_data;
mux_ram mux(.data_i(all_data),.data_o(ram_rdata_o));


// Decoder
wire [DEPTH-1:0] read_enable; 
wire [DEPTH-1:0] write_enable; 

decoder_ram decoder(.write_address_i(ram_waddr_i),.read_address_i(ram_raddr_i),.write_enable_i(ram_wenable_i),.write_enable_o(write_enable),.read_enable_o(read_enable));

// Memory
generate
	for(genvar iter=0; iter<DEPTH; iter++) begin
		ff_ram #(.WIDTH(DATA_WIDTH)) memory_word
			(.clk(clk),
			 .reset(reset), 
			 .data_i(ram_wdata_i), 
			 .write_enable_i(write_enable[iter]),
			 .read_enable_i(read_enable[iter]),
			 .valid_o(valid_flit_o[iter]),
			 .data_o(all_data[(iter*DATA_WIDTH)+DATA_WIDTH-1:(iter*DATA_WIDTH)])
			);
	end
endgenerate

endmodule


