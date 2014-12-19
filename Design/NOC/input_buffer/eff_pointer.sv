// flip flop

module eff_pointer #(parameter DATA_WIDTH = 32) (
	input clk,
	input reset,
	input update,
	input [DATA_WIDTH-1 : 0] data_i,
	output logic [DATA_WIDTH-1 : 0] data_o
);
	always_ff @(posedge clk) begin
    
	if (reset) begin
	
		data_o <= 3'b000;
	
	end else if(update) begin
			data_o <= (data_o + 1) % 5;
			//data_o <= data_i;
	
	end
	
	end

endmodule
