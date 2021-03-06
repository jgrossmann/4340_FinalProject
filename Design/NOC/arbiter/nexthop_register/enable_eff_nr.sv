// enabled flip flop
module enable_eff_nr #(parameter DATA_WIDTH = 32) (
	input clk,
	input reset,
	input write_enable_i,
	input [DATA_WIDTH-1 : 0] data_i,
	output logic [DATA_WIDTH-1 : 0] data_o
);

	always_ff @(posedge clk) begin
         if (reset) begin
		 	data_o <= data_i;
		 end if (write_enable_i) begin
			data_o <= data_i;
		end
	end

endmodule
