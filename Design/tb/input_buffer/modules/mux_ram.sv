module mux_ram #(parameter DATA_WIDTH=16, parameter ADDR_WIDTH=3, parameter DEPTH=5, parameter SIZE=(DEPTH*DATA_WIDTH))
(
input [SIZE-1:0] data_i,
output logic [DATA_WIDTH-1:0] data_o
);

always_comb begin
for (int bit_in_word=0; bit_in_word<DATA_WIDTH; bit_in_word++) begin
	data_o[bit_in_word] = '0;
	for (int bit_location = bit_in_word; bit_location<SIZE; bit_location += DATA_WIDTH) begin
		if(data_i[bit_location]) data_o[bit_in_word]='1;
	end
end
end
endmodule
