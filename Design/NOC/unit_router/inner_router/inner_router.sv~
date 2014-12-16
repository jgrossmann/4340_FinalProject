// decoder for read write
module decoder #(
	parameter ADDR_WIDTH = 5,
	parameter DATA_DEPTH = 1 << ADDR_WIDTH
) (
	input read_write_enable_i,
	input [ADDR_WIDTH-1:0] index_i,
	output logic [DATA_DEPTH-1:0] enable_o
);

	always_comb begin
		for ( int iter = 0; iter < DATA_DEPTH; iter++ )
			enable_o [iter] = ( read_write_enable_i & (index_i==iter) );
	end

endmodule