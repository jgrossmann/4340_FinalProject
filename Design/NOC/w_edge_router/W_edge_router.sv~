// cam interface
interface ifc #(
	parameter ADDR_WIDTH = 5,
	parameter DATA_DEPTH = 1 << ADDR_WIDTH,
	parameter DATA_WIDTH = 32,
	parameter DATA_SIZE = (DATA_DEPTH*DATA_WIDTH)
) (
	input bit clk
);
	logic rst;

	logic read;
	logic [ADDR_WIDTH-1:0] read_index;

	logic write;
	logic [ADDR_WIDTH-1:0] write_index;
	logic [DATA_WIDTH-1:0] write_data;

	logic search;
	logic [DATA_WIDTH-1:0] search_data;

	logic read_valid;
	logic [DATA_WIDTH-1:0] read_value;

	logic search_valid;
	logic [ADDR_WIDTH-1:0] search_index;

	clocking cb @(posedge clk);
		output rst;
		output read;
		output read_index;
		output write;
		output write_index;
		output write_data;
		output search;
		output search_data;
		input read_valid;
		input read_value;
		input search_valid;
		input search_index;
	endclocking

	modport bench (clocking cb);

	modport dut (
		input clk,
		input rst,
		input read,
		input read_index,
		input write,
		input write_index,
		input write_data,
		input search,
		input search_data,
		output read_valid,
		output read_value,
		output search_valid,
		output search_index
	);

endinterface