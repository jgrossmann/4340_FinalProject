interface top_ifc #(
	parameter DATA_WIDTH = 16
) (
	input bit clk
);
	logic rst;

	logic [DATA_WIDTH-1:0] data_i;

	logic [DATA_WIDTH-1:0] data_o;
	logic valid_i;
	logic valid_o;
	logic credit_i;
	logic credit_o;

	clocking cb @(posedge clk);
		output rst;
		output data_i;
		output valid_i;
		output credit_i;
		input data_o;
		input valid_o;
		input credit_o;
	endclocking

	modport bench (clocking cb);

	modport dut (
		input clk,
		input rst,
		input data_i,
		input valid_i,
		input credit_i,
		output data_o,
		output valid_o,
		output credit_o,
	);

endinterface