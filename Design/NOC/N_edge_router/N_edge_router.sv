// enabled flip flop
module eff #(parameter DATA_WIDTH = 32) (
	input clk,
	input rst,
	input write_enable_i,
	input [DATA_WIDTH-1 : 0] data_i,
	output logic [DATA_WIDTH-1 : 0] data_o,
	output logic read_valid_o
);

	always_ff @(posedge clk) begin
		if(rst) begin
			read_valid_o <= 1'b0;
			data_o <= '0;
		end else if (write_enable_i) begin
			read_valid_o <= 1'b1;
			data_o <= data_i;
		end
	end

endmodule