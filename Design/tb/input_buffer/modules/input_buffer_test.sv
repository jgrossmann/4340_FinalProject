
`include "modules/ram.sv"
`include "modules/rw_pointer.sv"
`include "modules/eff_pointer.sv"

module input_buffer_test #(parameter DATA_WIDTH=16, parameter ADDR_WIDTH=3, parameter DEPTH=5, parameter SIZE=(DEPTH*DATA_WIDTH) ) (

buffer_interface.dut ifc

);

// Instantiate "RAM"

logic [ADDR_WIDTH-1:0] ram_waddr_temp;
logic [ADDR_WIDTH-1:0] ram_raddr_temp;
logic [DATA_WIDTH-1:0] ram_rdata_o_temp; 
logic not_empty;
logic [DEPTH-1:0] valid_flit_o_temp;

// Instantiate "Read pointer"

rw_pointer read_pointer (

       .clk (ifc.clk),
       .reset (ifc.reset),
       .rwptr_inc_i (ifc.buf_read_i),
       .rwptr_addr_o (ram_raddr_temp) 
   
);

// Instantiate "Write pointer"

rw_pointer write_pointer (

       .clk (ifc.clk),
       .reset (ifc.reset),
       .rwptr_inc_i (ifc.buf_write_i),
       .rwptr_addr_o (ram_waddr_temp) 
   
);

ram ip_ram (

       .clk (ifc.clk),
       .reset (ifc.reset),
       .ram_waddr_i (ram_waddr_temp),
       .ram_wdata_i (ifc.buf_data_i), 
       .ram_raddr_i (ram_raddr_temp), 
       .ram_wenable_i (ifc.buf_write_i), 
       .ram_rdata_o (ram_rdata_o_temp),
		 .valid_flit_o(valid_flit_o_temp)

);

logic buf_empty_o_temp; 

always_comb begin 


buf_empty_o_temp = ((valid_flit_o_temp == 5'b00000) & (ram_raddr_temp == ram_waddr_temp));
//buf_empty_o_temp = ram_raddr_temp == ram_waddr_temp;  

end 

assign ifc.buf_data_o = ram_rdata_o_temp; 
assign ifc.buf_empty_o = buf_empty_o_temp; 
assign ifc.buf_valid_o = ifc.buf_read_i;
assign ifc.buf_ram_raddr_o = ram_raddr_temp; 
assign ifc.buf_ram_waddr_o = ram_waddr_temp; 
assign ifc.valid_flit_o = valid_flit_o_temp;

endmodule


