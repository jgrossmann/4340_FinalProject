`include "cam/eff.sv"

// cam data line with read, write, search interfaces
module line #(parameter DATA_WIDTH = 32)
(
	input clk,
	input rst,
	// read
	input read_enable_i,
	output logic read_valid_o,
	output logic [DATA_WIDTH-1 : 0] data_o,
	// write
	input write_enable_i,
	input [DATA_WIDTH-1 : 0] write_data_i,
	// search
	input search_enable_i,
	input [DATA_WIDTH-1 : 0] search_data_i,
	output logic match_o
);

	logic [DATA_WIDTH-1: 0 ] data;
	logic read_valid;

	always_comb begin
		// read
		read_valid_o = read_enable_i ? read_valid : 1'b0;
		data_o = read_enable_i ? data : 1'b0;
		// search
		if (search_enable_i)
			match_o = (read_valid && search_data_i==data);
		else
			match_o = 1'b0;
	end

	eff #(.DATA_WIDTH(DATA_WIDTH)) ff (
		.clk(clk),
		.rst(rst),
		.read_valid_o(read_valid),
		.data_o(data),
		.write_enable_i(write_enable_i),
		.data_i(write_data_i)
	);

endmodule