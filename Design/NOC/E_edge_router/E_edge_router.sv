// multiplexer for read
module mux #(
	parameter ADDR_WIDTH = 5,
	parameter DATA_WIDTH = 32,
	parameter DATA_DEPTH = (1 << ADDR_WIDTH),
	parameter DATA_SIZE = (DATA_DEPTH * DATA_WIDTH))
(
	input [DATA_DEPTH-1 : 0] read_valid_i,
	input [DATA_SIZE-1 : 0] data_i,
	output logic read_valid_o,
	output logic [DATA_WIDTH-1 : 0] data_o
);

	always_comb begin
		for(int bit_in_word = 0; bit_in_word < DATA_WIDTH; bit_in_word++) begin
			data_o[bit_in_word] = 1'b0;
			for(int bit_location = bit_in_word; bit_location < DATA_SIZE; bit_location += DATA_WIDTH) begin
				if (data_i[bit_location])
					data_o[bit_in_word] = 1'b1;
			end
		end
	end

	assign read_valid_o = read_valid_i != 1'b0;

endmodule