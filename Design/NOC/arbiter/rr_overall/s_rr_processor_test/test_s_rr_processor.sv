`include "../rr_comparator/s_rr_comparator.sv" 
`include "../rr_register/rr_register_0001.sv"
`include "../rr_register/rr_register_0010.sv"
`include "../rr_register/rr_register_0100.sv"
`include "../rr_register/rr_register_1000.sv"
`include "../rr_register/eff_rr_1000.sv" 
`include "../rr_register/eff_rr_0100.sv" 
`include "../rr_register/eff_rr_0010.sv"
`include "../rr_register/eff_rr_0001.sv" 
`include "../priorityencoder.sv"
`include "../priorityencoder_to_mux.sv" 
`include "../mux_5to1.sv" 

module test_s_rr_processor();

	reg clk;
	logic reset;
	logic [2:0] n_rrp_s_nexthop_addr_i;
	logic [2:0] w_rrp_s_nexthop_addr_i;
	logic [2:0] e_rrp_s_nexthop_addr_i;
	logic [2:0] l_rrp_s_nexthop_addr_i;
	logic rr_register_change_order_i;
	logic rr_downstream_credit_i;
	
	logic [2:0] rrp_s_priority_to_cs_o;
	logic rrp_s_priority_n_o;
	logic rrp_s_priority_s_o; 
	logic rrp_s_priority_w_o; 
	logic rrp_s_priority_e_o; 
	logic rrp_s_priority_l_o;
	
	always begin
		#5 clk = 1;
		#5 clk = 0;
	end

	s_rr_processor nrp
		(.clk,
		.reset,
		.n_rrp_s_nexthop_addr_i,
		.w_rrp_s_nexthop_addr_i,
		.e_rrp_s_nexthop_addr_i,
		.l_rrp_s_nexthop_addr_i,
		.rr_register_change_order_i,
		.rr_downstream_credit_i,
		.rrp_s_priority_to_cs_o,
		.rrp_s_priority_n_o,
		.rrp_s_priority_s_o,
		.rrp_s_priority_w_o,
		.rrp_s_priority_e_o,
		.rrp_s_priority_l_o
		);
		
	initial begin
		$vcdpluson;
		
		reset = 1;
		
		#20 $display("resetting\n");
		$display("main priority output: %b\n", rrp_s_priority_to_cs_o);
		$display("north priority output %b\n", rrp_s_priority_n_o);
		$display("south priority output %b\n", rrp_s_priority_s_o);
		$display("west priority output %b\n", rrp_s_priority_w_o);
		$display("east priority output %b\n", rrp_s_priority_e_o);
		$display("local priority output %b\n", rrp_s_priority_l_o);
		
		reset = 0;
		n_rrp_s_nexthop_addr_i = 3'b010;
		w_rrp_s_nexthop_addr_i = 3'b001;
		e_rrp_s_nexthop_addr_i = 3'b100;
		l_rrp_s_nexthop_addr_i = 3'b001;
		rr_register_change_order_i = 0;
		rr_downstream_credit_i = 1;
		
		#20 $display("\n");
		$display("main priority output: %b\n", rrp_s_priority_to_cs_o);
		$display("north priority output %b\n", rrp_s_priority_n_o);
		$display("south priority output %b\n", rrp_s_priority_s_o);
		$display("west priority output %b\n", rrp_s_priority_w_o);
		$display("east priority output %b\n", rrp_s_priority_e_o);
		$display("local priority output %b\n", rrp_s_priority_l_o);
		
		reset = 0;
		n_rrp_s_nexthop_addr_i = 3'b000;
		w_rrp_s_nexthop_addr_i = 3'b001;
		e_rrp_s_nexthop_addr_i = 3'b011;
		l_rrp_s_nexthop_addr_i = 3'b001;
		rr_register_change_order_i = 1;
		rr_downstream_credit_i = 1;
		
		#20 $display("\n");
		$display("main priority output: %b\n", rrp_s_priority_to_cs_o);
		$display("north priority output %b\n", rrp_s_priority_n_o);
		$display("south priority output %b\n", rrp_s_priority_s_o);
		$display("west priority output %b\n", rrp_s_priority_w_o);
		$display("east priority output %b\n", rrp_s_priority_e_o);
		$display("local priority output %b\n", rrp_s_priority_l_o);
		
		$finish;

	
		
	end
		
endmodule




















