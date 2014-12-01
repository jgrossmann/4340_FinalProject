module test_demux();

    logic [15:0] data_i;
    logic [2:0] sel_i;
    logic [15:0] data_n_o;
    logic [15:0] data_s_o;
    logic [15:0] data_w_o;
    logic [15:0] data_e_o;
    logic [15:0] data_l_o;

    demux_1to5 demux
        (.data_i,
        .sel_i,
        .data_n_o,
        .data_s_o,
        .data_w_o,
        .data_e_o,
        .data_l_o
        );

	 initial begin
        $vcdpluson;
        data_i = 16'b0101010101010101;
        sel_i = 3'b000;
        #5 $display("Data being sent is: %b\n", data_i);
        $display("North = 000, South = 001, West = 010, East = 011, Local = 100\n");

        $display("Select is set at %b\n", sel_i);
        $display("North: %b\n, South: %b\n, West: %b\n, East: %b\n, Local: %b\n", data_n_o, data_s_o, data_w_o, data_e_o, data_l_o);
        
        sel_i = 3'b001;
        #5  $display("Select is set at %b\n", sel_i);
        $display("North: %b\n, South: %b\n, West: %b\n, East: %b\n, Local: %b\n", data_n_o, data_s_o, data_w_o, data_e_o, data_l_o);

        sel_i = 3'b010;
        #5  $display("Select is set at %b\n", sel_i);
        $display("North: %b\n, South: %b\n, West: %b\n, East: %b\n, Local: %b\n", data_n_o, data_s_o, data_w_o, data_e_o, data_l_o);

        sel_i = 3'b011;
        #5  $display("Select is set at %b\n", sel_i);
        $display("North: %b\n, South: %b\n, West: %b\n, East: %b\n, Local: %b\n", data_n_o, data_s_o, data_w_o, data_e_o, data_l_o);
    
        sel_i = 3'b100;
        #5  $display("Select is set at %b\n", sel_i);
        $display("North: %b\n, South: %b\n, West: %b\n, East: %b\n, Local: %b\n", data_n_o, data_s_o, data_w_o, data_e_o, data_l_o);

		  data_i = 16'b1111111111111111;
		  #5 $display("Data is changed to: 1111111111111111\n");
	  	  $display("Select is set at %b\n", sel_i);
		  $display("North: %b\n, South: %b\n, West: %b\n, East: %b\n, Local: %b\n", data_n_o, data_s_o, data_w_o, data_e_o, data_l_o);

	 end
	
endmodule
