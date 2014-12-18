`include "../mux_5to1.sv"

module mux_5to1_test();

  logic [2:0] sel_i;
  logic [3:0] data_n_i;
  logic [3:0] data_s_i;
  logic [3:0] data_w_i;
  logic [3:0] data_e_i;
  logic [3:0] data_l_i;
  logic [3:0] data_o;

  mux_5to1 mux(
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
    data_n_i = 4'b0000;
    data_s_i = 4'b0001;
    data_w_i = 4'b0010;
    data_e_i = 4'b0100;
    data_l_i = 4'b1000;
    #1;    
    $display("Setting select signal to: %b\n", sel_i);
    $display("Setting data signals:\nNorth: %b\nSouth: %b\nWest: %b\nEast: %b\nLocal: %b\n", data_n_i, data_s_i, data_w_i, data_e_i, data_l_i);
    $display("Output is: %b\n", data_o);
	 
    sel_i = 3'b001;
    #1;
	 $display("Setting select signal to: %b\n", sel_i);
    $display("Output is: %b\n", data_o);
	 
    sel_i = 3'b010;
    #1;
	 $display("Setting select signal to: %b\n", sel_i);
    $display("Output is: %b\n", data_o);
	 
    sel_i = 3'b011;
    #1;
	 $display("Setting select signal to: %b\n", sel_i);
    $display("Output is: %b\n", data_o);
	 
    sel_i = 3'b100;
    #1;
	 $display("Setting select signal to: %b\n", sel_i);
    $display("Output is: %b\n", data_o);
	 
    sel_i = 3'b000;
    data_n_i = 4'b1111;
    #1;
	 $display("Setting select signal to: %b\n", sel_i);
    $display("Setting North data to: %b\n", data_n_i);
    $display("Output is: %b\n", data_o);
  end


endmodule
