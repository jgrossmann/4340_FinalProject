module decoder_ram #(parameter DATA_WIDTH=16, parameter ADDR_WIDTH=3, parameter DEPTH=5, parameter SIZE=(DEPTH*DATA_WIDTH))
(
input write_enable_i,
input [ADDR_WIDTH-1:0] write_address_i,
input [ADDR_WIDTH-1:0] read_address_i,
output logic [DEPTH-1:0] write_enable_o,
output logic [DEPTH-1:0] read_enable_o
);

logic [DEPTH-1:0] enable;

always_comb begin

for (int iter=0;iter<DEPTH;iter++) begin
	enable[iter] = (iter==write_address_i);
	write_enable_o[iter] = enable[iter] & write_enable_i;
end

for (int iter=0;iter<DEPTH;iter++) begin
	enable[iter] = (iter==read_address_i);
	read_enable_o[iter] = enable[iter];
end

end

endmodule
