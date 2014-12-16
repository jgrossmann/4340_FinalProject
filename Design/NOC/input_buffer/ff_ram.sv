//Synchronous resetable-DFF with synchronous write and asynchronous read and search
module ff_ram #(parameter WIDTH=16) (clk, data_i, reset, write_enable_i, read_enable_i, data_o); 

input [WIDTH-1:0] data_i;
input clk; 
input reset;
input write_enable_i;
input read_enable_i;
output [WIDTH-1:0] data_o;
output valid_o;

logic [WIDTH-1:0] data;
logic [WIDTH-1:0] data_out;
logic valid;

always_ff @ (posedge clk) begin

	if (reset) begin
   	data <= '0;
    	valid <= '0;
	end else if (write_enable_i) begin
   	data <= data_i;
    	valid <= '1;
	end else if (read_enable_i) begin
    	valid <= '0;
	end

end

always_comb begin

data_out = read_enable_i?data:'0;

end

assign valid_o = valid;
assign data_o = data_out;

endmodule 
