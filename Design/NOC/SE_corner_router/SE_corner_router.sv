// priority encoder for search index
module priorityencoder #(
	parameter ADDR_WIDTH = 5,
	parameter DATA_DEPTH = 1 << ADDR_WIDTH
) (
	input [DATA_DEPTH-1:0] search_address_i,
	output logic search_valid_o,
	output logic [ADDR_WIDTH-1:0] search_index_o
);

	always_comb begin
		for( int iter = 0; iter < DATA_DEPTH; iter ++) begin
			if(search_address_i[iter]) begin
				search_valid_o = 1'b1;
				search_index_o = iter;
				break;
			end else begin
				search_valid_o = 1'b0;
				search_index_o = 'x;
			end
		end
	end

endmodule