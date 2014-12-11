// flip flop

module eff_rr_0001 #(parameter DATA_WIDTH = 32) (
	input clk,
	input [DATA_WIDTH-1 : 0] data_i,
	output logic [DATA_WIDTH-1 : 0] data_o
);
	always_ff @(posedge clk) begin
			
			data_o <= data_i;
	
	end

endmodule
