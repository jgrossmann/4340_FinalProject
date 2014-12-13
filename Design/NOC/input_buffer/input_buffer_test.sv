module input_buffer_test();

reg clk;
logic reset;
logic buf_write_i;
logic buf_read_i;
logic [15:0] buf_data_i;
    
logic buf_empty_o;
logic buf_valid_o;
logic [15:0] buf_data_o;
logic [2:0] buf_ram_raddr_o; 
logic [2:0] buf_ram_waddr_o; 

HW1 my_CAM(
                .clk(clk),
                .reset(reset),
		        .buf_data_i(buf_data_i),
		        .buf_write_i(buf_write_i),
		        .buf_read_i(buf_read_i),
		        .buf_empty_o(buf_empty_o),
		        .bup_valid_o(buf_valid_o),
		        .buf_data_o(buf_data_o),
		        .buf_ram_raddr_o(buf_ram_raddr_o), 
		        .buf_ram_waddr_o(buf_ramwaddr_o)
	);

initial begin
$vcdpluson;

clk = 0;

// making input signals 0 at start

buf_write_i = 0 ; 
buf_read_i = 0 ; 
buf_data_i = 16'b0000000000000000

// There should be four test cases 


// Case-4, write-yes, read-yes 

#2      reset = 1'b1; 

#2      reset = 1'b0; 

#4      buf_data_i = 16'b1000000000000000
        buf_write_i = 1; 

#4      buf_read_i = 1; 
 
end

always 
#1 clk = !clk; 

initial 
#50 $finish; 

endmodule
