`include "../mux_5to1_1bit.sv"

module mux_5to1_test();

  logic [2:0] sel_i;
  logic data_n_i;
  logic data_s_i;
  logic data_w_i;
  logic data_e_i;
  logic data_l_i;
  logic data_o;

  mux_5to1_1bit mux(
    .sel_i,
    .data_n_i,
    .data_s_i,
    .data_w_i,
    .data_e_i,
    .data_l_i,
    .data_o
    );

  initial begin
    $vcdpluson;
    sel_i = 3'b000;
    data_n_i = 1'b1;
    data_s_i = 1'b0;
    data_w_i = 1'b0;
    data_e_i = 1'b0;
    data_l_i = 1'b0;
    #1;    
    $display("Setting select signal to: %b\n", sel_i);
    $display("Setting data signals:\nNorth: %b\nSouth: %b\nWest: %b\nEast: %b\nLocal: %b\n", data_n_i, data_s_i, data_w_i, data_e_i, data_l_i);
    $display("Output is: %b\n", data_o);
	 
    sel_i = 3'b001;
	data_w_i = 1'b1;
	data_e_i = 1'b1;
	data_l_i = 1'b1;
    #1;
	 $display("Setting select signal to: %b\n", sel_i);
    $display("Setting data signals:\nNorth: %b\nSouth: %b\nWest: %b\nEast: %b\nLocal: %b\n", data_n_i, data_s_i, data_w_i, data_e_i, data_l_i);    
	$display("Output is: %b\n", data_o);
	 
    sel_i = 3'b010;
	data_n_i = 1'b0;
	data_w_i = 1'b1;
	data_e_i = 1'b0;
	data_l_i = 1'b0;
    #1;
	 $display("Setting select signal to: %b\n", sel_i);
	$display("Setting data signals:\nNorth: %b\nSouth: %b\nWest: %b\nEast: %b\nLocal: %b\n", data_n_i, data_s_i, data_w_i, data_e_i, data_l_i);  
    $display("Output is: %b\n", data_o);
	 
    sel_i = 3'b011;
	data_n_i = 1'b1;
	data_s_i = 1'b1;
	data_e_i = 1'b0;
	data_l_i = 1'b1;
    #1;
	 $display("Setting select signal to: %b\n", sel_i);
	$display("Setting data signals:\nNorth: %b\nSouth: %b\nWest: %b\nEast: %b\nLocal: %b\n", data_n_i, data_s_i, data_w_i, data_e_i, data_l_i);  
    $display("Output is: %b\n", data_o);
	 
    sel_i = 3'b100;
	data_n_i = 1'b0;
	data_s_i = 1'b0;
	data_w_i = 1'b0;
    #1;
	 $display("Setting select signal to: %b\n", sel_i);
    $display("Output is: %b\n", data_o);
	 
    sel_i = 3'bxxx;
    #1;
	 $display("Setting select signal to: %b\n", sel_i);
    $display("Setting North data to: %b\n", data_n_i);
    $display("Output is: %b\n", data_o);
  end


endmodule
