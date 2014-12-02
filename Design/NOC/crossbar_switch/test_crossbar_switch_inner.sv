module test_crossbar_switch_inner();

    // Input of demux

    logic [15:0] n_cs_i;
    logic [15:0] s_cs_i;
    logic [15:0] w_cs_i;
    logic [15:0] e_cs_i;
    logic [15:0] l_cs_i;

    // Input of demux select signals

    logic [2:0] n_cs_sel_demux_i;
    logic [2:0] s_cs_sel_demux_i;
    logic [2:0] w_cs_sel_demux_i;
    logic [2:0] e_cs_sel_demux_i;
    logic [2:0] l_cs_sel_demux_i;

    // Input of mux select signals

    logic [2:0] n_cs_sel_mux_i;
    logic [2:0] s_cs_sel_mux_i;
    logic [2:0] w_cs_sel_mux_i;
    logic [2:0] e_cs_sel_mux_i;
    logic [2:0] l_cs_sel_mux_i;

    // outpu of mux

    logic [15:0] n_cs_o;
    logic [15:0] s_cs_o;
    logic [15:0] w_cs_o;
    logic [15:0] e_cs_o;
    logic [15:0] l_cs_o;


    crossbar_switch_inner csi
        (.n_cs_i,
        .s_cs_i,
        .w_cs_i,
        .e_cs_i,
        .l_cs_i,
        .n_cs_sel_demux_i,
        .s_cs_sel_demux_i,
        .w_cs_sel_demux_i,
        .e_cs_sel_demux_i,
        .l_cs_sel_demux_i,
        .n_cs_sel_mux_i,
        .s_cs_sel_mux_i,
        .w_cs_sel_mux_i,
        .e_cs_sel_mux_i,
        .l_cs_sel_mux_i,
        .n_cs_o,
        .s_cs_o,
        .w_cs_o,
        .e_cs_o,
        .l_cs_o
        );

    initial begin
        $vcdpluson;
        n_cs_i = 16'b0000000000000001;
        s_cs_i = 16'b0000000000000010;
        w_cs_i = 16'b0000000000000100;
        e_cs_i = 16'b0000000000001000;
        l_cs_i = 16'b0000000000010000;
        
        n_cs_sel_demux_i = 3'b100;
        s_cs_sel_demux_i = 3'b000;
        w_cs_sel_demux_i = 3'b000;
        e_cs_sel_demux_i = 3'b000;
        l_cs_sel_demux_i = 3'b000;
        
        n_cs_sel_mux_i = 3'b100;
        s_cs_sel_mux_i = 3'b000;
        w_cs_sel_mux_i = 3'b001;
        e_cs_sel_mux_i = 3'b010;
        l_cs_sel_mux_i = 3'b000;

        #5 $display("Setting input to demux Data\n");
        $display("North: %b\n South: %b\n West: %b\n East: %b\n Local: %b\n", n_cs_i, s_cs_i, w_cs_i, e_cs_i, l_cs_i);
        $display("Selector value and corresponding direction:\n");
        $display("North: 000\n South: 001\n West: 010\n East: 011\n Local: 100\n");
        $display("Setting Demux selector values:\n");
        $display("North: %b\n South: %b\n West: %b\n East: %b\n Local: %b\n", n_cs_sel_demux_i, s_cs_sel_demux_i, w_cs_sel_demux_i, e_cs_sel_demux_i, l_cs_sel_demux_i);
		  $display("Setting Mux selector values:\n");
        $display("North: %b\n South: %b\n West: %b\n East: %b\n Local: %b\n", n_cs_sel_mux_i, s_cs_sel_mux_i, w_cs_sel_mux_i, e_cs_sel_mux_i, l_cs_sel_mux_i);
        $display("Output:\n");
        $display("North: %b\n South: %b\n West: %b\n East: %b\n Local: %b\n", n_cs_o, s_cs_o, w_cs_o, e_cs_o, l_cs_o);

        n_cs_sel_demux_i = 3'b100;
        s_cs_sel_demux_i = 3'b100;
        w_cs_sel_demux_i = 3'b100;
        e_cs_sel_demux_i = 3'b100;
        l_cs_sel_demux_i = 3'b000;

        n_cs_sel_mux_i = 3'b100;
        s_cs_sel_mux_i = 3'b000;
        w_cs_sel_mux_i = 3'b000;
        e_cs_sel_mux_i = 3'b000;
        l_cs_sel_mux_i = 3'b000;
        $display("Setting Demux selector values:\n");
        $display("North: %b\n South: %b\n West: %b\n East: %b\n Local: %b\n", n_cs_sel_demux_i, s_cs_sel_demux_i, w_cs_sel_demux_i, e_cs_sel_demux_i, l_cs_sel_demux_i);
        $display("Setting Mux selector values:\n");
        $display("North: %b\n South: %b\n West: %b\n East: %b\n Local: %b\n", n_cs_sel_mux_i, s_cs_sel_mux_i, w_cs_sel_mux_i, e_cs_sel_mux_i, l_cs_sel_mux_i);
        $display("Output:\n");
        $display("North: %b\n South: %b\n West: %b\n East: %b\n Local: %b\n", n_cs_o, s_cs_o, w_cs_o, e_cs_o, l_cs_o);
    end

endmodule
