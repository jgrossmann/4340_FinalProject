// flip flop

module eff_pt #(parameter DATA_WIDTH = 32) (
	input clk,
	input reset,
	input [DATA_WIDTH-1 : 0] data_i,
	output logic [DATA_WIDTH-1 : 0] data_o
);
	always_ff @(posedge clk) begin
    
	if (reset) begin
	
	data_o <= '0;
	
	end else begin
			
			data_o <= data_i;
	
	end
	
	end

endmodule
