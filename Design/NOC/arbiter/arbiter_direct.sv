/* This is the module for arbiter, it contains several sub-modules in it: 

(1) packet tracker x 5 (associated with each input buffer) 
    
    // When read signal for the associated input buffer is high, it means one flit has been consumed. The count of packet tracker would increment by 1. As the count
    reaches 4, it would automatically wrap itself back to 0 at the next clock edge.

    // almost done output means that the count is currently 4. This signal will be used to change to round-robin order register. Once this signal is high, round-robin
    order should be shifted by one direction. 

    // empty output means that the count is currently 0. This signal will be used in conjunction with the empty signal from the associated input bufer to check whether 
    current flit is a "header" flit. If input_buffer_empty is 0 and pt_empty is 0, it means current flit "is" a header flit. 
    
	// The write signal of next-hop register will be high only if current flit is a header flit.  
	
	.pt_inc_i(rrp_s_priority_read_o_temp)
    .pt_end_o(s_pt_almost_done_o),
    .pt_empty_o (s_pt_empty_o)

(2) yx processor x 5 (associated with each input buffer)
    
  	// y-x processor will take the input from the associated input buffer "at all time". It would then subsequently compares this informtaion with router's current 
    address. 

    // The output of yx processor will be a 3-bit signal which indicates the "output" direction that this header is desired to go. This output will be connected to 
    input of the next-hop register. 

    // Whether this output information "will" be written into the next-hop register is determined by the write signal of n-h register. 

    .yx_addr_header_i(ifc.l_arb_address_i[7:0]), 
    .yx_addr_router_i(ifc.yx_pos_i[7:0]),
    .yx_addr_o(yx_l_addr_o_temp) // 3-bit signal

(3) next-hop register x 5 (associated with each input buffer)
    
	// nhr will take the data input from output of the yx processor. 
    // Whether the input will be "actually" written into the register is determined by the write signal. 
    // nhr will output the desired output direction for the associated input buffer. It will be sent into the rr processor.
    // nhr's output will also be used as the select signal for crossbar switch's "demux". 

    .nhr_address_i(yx_n_addr_o_temp),
    .nhr_write_i(nhr_n_write_i_temp),  
    .nhr_address_o(nhr_n_addr_o_temp)

(4) rr (round-robin) processor x 5 (asscociated with each output direction)

    // round-robin processor should take its input from the next-hop register. 
    // input change order signal is from packet tracker. When the count of packet tracker goes to 4, it means that all the flits associated with the current header 
    "should" have been sent. It should start a new order by shifting the token by one position (direction). 
    // Output of the rr processor contains one 3-bit (priority_to_cs) signal and 5 one-bit signal (priority_n (x)). 

    // -- The 3-bit signal will serve as the select signal for crossbar switch's mux.
    // -- The 1-bit signal indicates that that input buffer has been selected by the rr processor to be sent through current output direction. Since for each input 
          buffer, there can be up to four possible output rr processor that wants to "read" its signal, the one-bit signal coming from different output rr processor 
          for the same input buffer will be "OR" together to generate the "actual" read signal for each input buffer. 

	.n_rrp_e_nexthop_addr_i(nhr_n_addr_o_temp),
	.s_rrp_e_nexthop_addr_i(nhr_s_addr_o_temp),
	.w_rrp_e_nexthop_addr_i(nhr_w_addr_o_temp),
	.l_rrp_e_nexthop_addr_i(nhr_l_addr_o_temp),
	.rr_register_change_order_i(rr_e_register_change_order_i), 

	.rrp_e_priority_to_cs_o (rrp_e_priority_to_cs_o_temp), // 3-bit 
	.rrp_e_priority_n_o (rrp_e_priority_n_o_temp), // 1-bit 
	.rrp_e_priority_s_o (rrp_e_priority_s_o_temp), // 1-bit 
	.rrp_e_priority_w_o (rrp_e_priority_w_o_temp), // 1-bit 
	.rrp_e_priority_e_o (rrp_e_priority_e_o_temp), // 1-bit 
	.rrp_e_priority_l_o (rrp_e_priority_l_o_temp)  // 1-bit 

(5) 5-to-1 mux for changing round-robin ordering x 5 (associated with each rr-processor)
    
	// Just like the read signal for the input buffer, for each output processor, there can be four possible input packet tracker that it should keep track of. If any
       of them is currently sending data through this output direction, once its done, the round-robin order of the rr processor should shifted. 
    // Therefore, all the "almost_done" signal from various input packet tracker will be sent to this mux, the selected packet tracker is the one who is currently 
       sending data to this output direction. 
   //  We use the same select signal (priority_to_cs) for this mux as the one used in crossbar switch's mux. This select signal is indicating which input buffer was 
       chosen to send data through this output direction. 

    .sel_i(rrp_n_priority_to_cs_o_temp), 
    .data_n_i(n_pt_almost_done_o), 
    .data_s_i(s_pt_almost_done_o),
    .data_w_i(w_pt_almost_done_o),
    .data_e_i(e_pt_almost_done_o),
    .data_l_i(1'b0),
    .data_o(rr_l_register_change_order_i)
*/
module arbiter_test (

arbiter_interface.dut ifc
/*	
    input clk, 
	input reset, 

	input cc_credit_n_i,
	input cc_credit_s_i, 
	input cc_credit_w_i, 
	input cc_credit_e_i, 
	input cc_credit_l_i, 

	input [15:0] yx_addr_router_i,

	input [15:0] yx_n_addr_header_i,
	input [15:0] yx_s_addr_header_i, 
	input [15:0] yx_w_addr_header_i,
	input [15:0] yx_e_addr_header_i, 
	input [15:0] yx_l_addr_header_i, 

	input ib_empty_n_i, 
	input ib_empty_s_i, 
	input ib_empty_w_i, 
	input ib_empty_e_i, 
	input ib_empty_l_i, 

	output cc_credit_n_o,
	output cc_credit_s_o, 
	output cc_credit_w_o, 
	output cc_credit_e_o, 
	output cc_credit_l_o, 

	output [2:0] demux_nhr_n_addr_o, 
	output [2:0] demux_nhr_s_addr_o, 
	output [2:0] demux_nhr_w_addr_o, 
	output [2:0] demux_nhr_e_addr_o, 
	output [2:0] demux_nhr_l_addr_o, 

	output [2:0] rrp_n_priority_to_cs_o,
	output rrp_n_priority_read_o,

	output [2:0] rrp_s_priority_to_cs_o,
	output rrp_s_priority_read_o,

	output [2:0] rrp_w_priority_to_cs_o,
	output rrp_w_priority_read_o,

	output [2:0] rrp_e_priority_to_cs_o,
	output rrp_e_priority_read_o,

	output [2:0] rrp_l_priority_to_cs_o,
	output rrp_l_priority_read_o

*/

);

logic n_pt_almost_done_o; 
logic s_pt_almost_done_o; 
logic w_pt_almost_done_o; 
logic e_pt_almost_done_o; 
logic l_pt_almost_done_o; 

logic n_pt_empty_o; 
logic s_pt_empty_o; 
logic w_pt_empty_o; 
logic e_pt_empty_o; 
logic l_pt_empty_o; 

logic [2:0] yx_n_addr_o_temp; 
logic [2:0] yx_s_addr_o_temp; 
logic [2:0] yx_w_addr_o_temp; 
logic [2:0] yx_e_addr_o_temp; 
logic [2:0] yx_l_addr_o_temp; 

logic [2:0] nhr_n_addr_o_temp; 
logic [2:0] nhr_s_addr_o_temp; 
logic [2:0] nhr_w_addr_o_temp; 
logic [2:0] nhr_e_addr_o_temp; 
logic [2:0] nhr_l_addr_o_temp; 

logic nhr_n_write_i_temp;
logic nhr_s_write_i_temp;  
logic nhr_w_write_i_temp;  
logic nhr_e_write_i_temp;  
logic nhr_l_write_i_temp;  

logic rrp_n_priority_n_o_temp;
logic rrp_n_priority_s_o_temp;
logic rrp_n_priority_w_o_temp;
logic rrp_n_priority_e_o_temp;
logic rrp_n_priority_l_o_temp;
logic [2:0] rrp_n_priority_to_cs_o_temp;

logic rrp_s_priority_n_o_temp;
logic rrp_s_priority_s_o_temp;
logic rrp_s_priority_w_o_temp;
logic rrp_s_priority_e_o_temp;
logic rrp_s_priority_l_o_temp;
logic [2:0] rrp_s_priority_to_cs_o_temp;

logic rrp_w_priority_n_o_temp;
logic rrp_w_priority_s_o_temp;
logic rrp_w_priority_w_o_temp;
logic rrp_w_priority_e_o_temp;
logic rrp_w_priority_l_o_temp;
logic [2:0] rrp_w_priority_to_cs_o_temp;

logic rrp_e_priority_n_o_temp;
logic rrp_e_priority_s_o_temp;
logic rrp_e_priority_w_o_temp;
logic rrp_e_priority_e_o_temp;
logic rrp_e_priority_l_o_temp;
logic [2:0] rrp_e_priority_to_cs_o_temp;

logic rrp_l_priority_n_o_temp;
logic rrp_l_priority_s_o_temp;
logic rrp_l_priority_w_o_temp;
logic rrp_l_priority_e_o_temp;
logic rrp_l_priority_l_o_temp;
logic [2:0] rrp_l_priority_to_cs_o_temp;

// Temp variable for output read signal, the direction is input-referred. 
logic rrp_n_priority_read_o_temp; 
logic rrp_s_priority_read_o_temp; 
logic rrp_w_priority_read_o_temp;  
logic rrp_e_priority_read_o_temp; 
logic rrp_l_priority_read_o_temp; 

logic rr_n_register_change_order_i; 
logic rr_s_register_change_order_i; 
logic rr_w_register_change_order_i; 
logic rr_e_register_change_order_i; 
logic rr_l_register_change_order_i;

logic cc_credit_n_o_temp; 
logic cc_credit_s_o_temp; 
logic cc_credit_w_o_temp; 
logic cc_credit_e_o_temp; 
logic cc_credit_l_o_temp; 

packet_tracker pt_n ( 

  .clk(ifc.clk), 
  .reset(ifc.reset),
  .pt_inc_i(rrp_n_priority_read_o_temp),   // Temp variable for output read signal, the direction is input-referred. 
  .pt_end_o(n_pt_almost_done_o), 
  .pt_empty_o (n_pt_empty_o)
	
);

packet_tracker pt_s ( 

  .clk(ifc.clk), 
  .reset(ifc.reset),
  .pt_inc_i(rrp_s_priority_read_o_temp),   // Temp variable for output read signal, the direction is input-referred. 
  .pt_end_o(s_pt_almost_done_o),
  .pt_empty_o (s_pt_empty_o)
	
);

packet_tracker pt_w ( 

  .clk(ifc.clk), 
  .reset(ifc.reset),
  .pt_inc_i(rrp_w_priority_read_o_temp),   // Temp variable for output read signal, the direction is input-referred. 
  .pt_end_o(w_pt_almost_done_o),
  .pt_empty_o (w_pt_empty_o)
	
);

packet_tracker pt_e ( 

  .clk(ifc.clk), 
  .reset(ifc.reset),
  .pt_inc_i(rrp_e_priority_read_o_temp),   // Temp variable for output read signal, the direction is input-referred. 
  .pt_end_o(e_pt_almost_done_o),
  .pt_empty_o (e_pt_empty_o)
	
);

packet_tracker pt_l ( 

  .clk(ifc.clk), 
  .reset(ifc.reset),
  .pt_inc_i(rrp_l_priority_read_o_temp),   // Temp variable for output read signal, the direction is input-referred. 
  .pt_end_o(l_pt_almost_done_o),
  .pt_empty_o (l_pt_empty_o)
	
);


yx_processor yx_proc_n (
	
  .yx_addr_header_i(ifc.n_arb_address_i[7:0]), 
  .yx_addr_router_i(ifc.yx_pos_i[7:0]),
  .yx_addr_o(yx_n_addr_o_temp) // 3-bit signal 

);

yx_processor yx_proc_s (
	
  .yx_addr_header_i(ifc.s_arb_address_i[7:0]), 
  .yx_addr_router_i(ifc.yx_pos_i[7:0]),
  .yx_addr_o(yx_s_addr_o_temp) // 3-bit signal 

);

yx_processor yx_proc_w (
	
  .yx_addr_header_i(ifc.w_arb_address_i[7:0]), 
  .yx_addr_router_i(ifc.yx_pos_i[7:0]),
  .yx_addr_o(yx_w_addr_o_temp) // 3-bit signal 

);

yx_processor yx_proc_e (
	
  .yx_addr_header_i(ifc.e_arb_address_i[7:0]), 
  .yx_addr_router_i(ifc.yx_pos_i[7:0]),
  .yx_addr_o(yx_e_addr_o_temp) // 3-bit signal 

);

yx_processor yx_proc_l (
	
  .yx_addr_header_i(ifc.l_arb_address_i[7:0]), 
  .yx_addr_router_i(ifc.yx_pos_i[7:0]),
  .yx_addr_o(yx_l_addr_o_temp) // 3-bit signal 

);

nexthop_register nexthop_n (

       .clk(ifc.clk), 
       .reset(ifc.reset),
       .nhr_address_i(yx_n_addr_o_temp),
       .nhr_write_i(nhr_n_write_i_temp),  
       .nhr_address_o(nhr_n_addr_o_temp)

); 

nexthop_register nexthop_s (

       .clk(ifc.clk), 
       .reset(ifc.reset),
       .nhr_address_i(yx_s_addr_o_temp),
       .nhr_write_i(nhr_s_write_i_temp),  
       .nhr_address_o(nhr_s_addr_o_temp)

); 

nexthop_register nexthop_w (

       .clk(ifc.clk), 
       .reset(ifc.reset),
       .nhr_address_i(yx_w_addr_o_temp),
       .nhr_write_i(nhr_w_write_i_temp),  
       .nhr_address_o(nhr_w_addr_o_temp)

); 

nexthop_register nexthop_e (

       .clk(ifc.clk), 
       .reset(ifc.reset),
       .nhr_address_i(yx_e_addr_o_temp),
       .nhr_write_i(nhr_e_write_i_temp),  
       .nhr_address_o(nhr_e_addr_o_temp)

); 

nexthop_register nexthop_l (

       .clk(ifc.clk), 
       .reset(ifc.reset),
       .nhr_address_i(yx_l_addr_o_temp),
       .nhr_write_i(nhr_l_write_i_temp),  
       .nhr_address_o(nhr_l_addr_o_temp)

); 

n_rr_processor nproc(

	.clk(ifc.clk), 
	.reset(ifc.reset), 

	.s_rrp_n_nexthop_addr_i(nhr_s_addr_o_temp),
	.w_rrp_n_nexthop_addr_i(nhr_w_addr_o_temp),
	.e_rrp_n_nexthop_addr_i(nhr_e_addr_o_temp),
	.l_rrp_n_nexthop_addr_i(nhr_l_addr_o_temp),
	.rr_register_change_order_i(rr_n_register_change_order_i), 

	.rrp_n_priority_to_cs_o (rrp_n_priority_to_cs_o_temp),
	.rrp_n_priority_n_o (rrp_n_priority_n_o_temp),
	.rrp_n_priority_s_o (rrp_n_priority_s_o_temp), 
	.rrp_n_priority_w_o (rrp_n_priority_w_o_temp), 
	.rrp_n_priority_e_o (rrp_n_priority_e_o_temp), 
	.rrp_n_priority_l_o (rrp_n_priority_l_o_temp)

);

s_rr_processor sproc(

	.clk(ifc.clk), 
	.reset(ifc.reset), 

	.n_rrp_s_nexthop_addr_i(nhr_n_addr_o_temp),
	.w_rrp_s_nexthop_addr_i(nhr_w_addr_o_temp),
	.e_rrp_s_nexthop_addr_i(nhr_e_addr_o_temp),
	.l_rrp_s_nexthop_addr_i(nhr_l_addr_o_temp),
	.rr_register_change_order_i(rr_s_register_change_order_i), 

	.rrp_s_priority_to_cs_o (rrp_s_priority_to_cs_o_temp),
	.rrp_s_priority_n_o (rrp_s_priority_n_o_temp),
	.rrp_s_priority_s_o (rrp_s_priority_s_o_temp), 
	.rrp_s_priority_w_o (rrp_s_priority_w_o_temp), 
	.rrp_s_priority_e_o (rrp_s_priority_e_o_temp), 
	.rrp_s_priority_l_o (rrp_s_priority_l_o_temp)

);

w_rr_processor wproc(

	.clk(ifc.clk), 
	.reset(ifc.reset), 

	.n_rrp_w_nexthop_addr_i(nhr_n_addr_o_temp),
	.s_rrp_w_nexthop_addr_i(nhr_s_addr_o_temp),
	.e_rrp_w_nexthop_addr_i(nhr_e_addr_o_temp),
	.l_rrp_w_nexthop_addr_i(nhr_l_addr_o_temp),
	.rr_register_change_order_i(rr_w_register_change_order_i), 

	.rrp_w_priority_to_cs_o (rrp_w_priority_to_cs_o_temp),
	.rrp_w_priority_n_o (rrp_w_priority_n_o_temp), // w_n output_input 
	.rrp_w_priority_s_o (rrp_w_priority_s_o_temp), // w_s output_input 
	.rrp_w_priority_w_o (rrp_w_priority_w_o_temp), // w_w output_input 
	.rrp_w_priority_e_o (rrp_w_priority_e_o_temp), // w_e output_input 
	.rrp_w_priority_l_o (rrp_w_priority_l_o_temp)  // w_l output_input 

);

e_rr_processor eproc(

	.clk(ifc.clk), 
	.reset(ifc.reset), 

	.n_rrp_e_nexthop_addr_i(nhr_n_addr_o_temp),
	.s_rrp_e_nexthop_addr_i(nhr_s_addr_o_temp),
	.w_rrp_e_nexthop_addr_i(nhr_w_addr_o_temp),
	.l_rrp_e_nexthop_addr_i(nhr_l_addr_o_temp),
	.rr_register_change_order_i(rr_e_register_change_order_i), 

	.rrp_e_priority_to_cs_o (rrp_e_priority_to_cs_o_temp),
	.rrp_e_priority_n_o (rrp_e_priority_n_o_temp),
	.rrp_e_priority_s_o (rrp_e_priority_s_o_temp), 
	.rrp_e_priority_w_o (rrp_e_priority_w_o_temp), 
	.rrp_e_priority_e_o (rrp_e_priority_e_o_temp), 
	.rrp_e_priority_l_o (rrp_e_priority_l_o_temp)

);

l_rr_processor lproc(

	.clk(ifc.clk), 
	.reset(ifc.reset), 

	.n_rrp_l_nexthop_addr_i(nhr_n_addr_o_temp),
	.s_rrp_l_nexthop_addr_i(nhr_s_addr_o_temp),
	.w_rrp_l_nexthop_addr_i(nhr_w_addr_o_temp),
	.e_rrp_l_nexthop_addr_i(nhr_e_addr_o_temp),
	.rr_register_change_order_i(rr_l_register_change_order_i), 

	.rrp_l_priority_to_cs_o (rrp_l_priority_to_cs_o_temp),
	.rrp_l_priority_n_o (rrp_l_priority_n_o_temp),
	.rrp_l_priority_s_o (rrp_l_priority_s_o_temp), 
	.rrp_l_priority_w_o (rrp_l_priority_w_o_temp), 
	.rrp_l_priority_e_o (rrp_l_priority_e_o_temp), 
	.rrp_l_priority_l_o (rrp_l_priority_l_o_temp)

);

mux_5to1_1bit mux_change_order_n (
	
 .sel_i(rrp_n_priority_to_cs_o_temp), 
 .data_n_i(1'b0), 
 .data_s_i(s_pt_almost_done_o),
 .data_w_i(w_pt_almost_done_o),
 .data_e_i(e_pt_almost_done_o),
 .data_l_i(l_pt_almost_done_o),

 .data_o(rr_n_register_change_order_i)
);  

mux_5to1_1bit mux_change_order_s (
	
 .sel_i(rrp_s_priority_to_cs_o_temp), 
 .data_n_i(n_pt_almost_done_o), 
 .data_s_i(1'b0),
 .data_w_i(w_pt_almost_done_o),
 .data_e_i(e_pt_almost_done_o),
 .data_l_i(l_pt_almost_done_o),

 .data_o(rr_s_register_change_order_i)
);  

mux_5to1_1bit mux_change_order_w (
	
 .sel_i(rrp_n_priority_to_cs_o_temp), 
 .data_n_i(n_pt_almost_done_o), 
 .data_s_i(s_pt_almost_done_o),
 .data_w_i(1'b0),
 .data_e_i(e_pt_almost_done_o),
 .data_l_i(l_pt_almost_done_o),

 .data_o(rr_w_register_change_order_i)
);  

mux_5to1_1bit mux_change_order_e (
	
 .sel_i(rrp_n_priority_to_cs_o_temp), 
 .data_n_i(n_pt_almost_done_o), 
 .data_s_i(s_pt_almost_done_o),
 .data_w_i(w_pt_almost_done_o),
 .data_e_i(1'b0),
 .data_l_i(l_pt_almost_done_o),

 .data_o(rr_e_register_change_order_i)
);  

mux_5to1_1bit mux_change_order_l (
	
 .sel_i(rrp_n_priority_to_cs_o_temp), 
 .data_n_i(n_pt_almost_done_o), 
 .data_s_i(s_pt_almost_done_o),
 .data_w_i(w_pt_almost_done_o),
 .data_e_i(e_pt_almost_done_o),
 .data_l_i(1'b0),

 .data_o(rr_l_register_change_order_i)
);  

always_comb begin 

if (ifc.reset) begin 

rrp_n_priority_read_o_temp = 1'b0; 
rrp_s_priority_read_o_temp = 1'b0; 
rrp_w_priority_read_o_temp = 1'b0; 
rrp_e_priority_read_o_temp = 1'b0; 
rrp_l_priority_read_o_temp = 1'b0; 

cc_credit_n_o_temp = 1'b0; 
cc_credit_s_o_temp = 1'b0;
cc_credit_w_o_temp = 1'b0;
cc_credit_e_o_temp = 1'b0;
cc_credit_l_o_temp = 1'b0;

end else begin 

nhr_n_write_i_temp = (~ifc.n_arb_empty_i & n_pt_empty_o);
nhr_s_write_i_temp = (~ifc.s_arb_empty_i & s_pt_empty_o);  
nhr_w_write_i_temp = (~ifc.w_arb_empty_i & w_pt_empty_o);  
nhr_e_write_i_temp = (~ifc.e_arb_empty_i & e_pt_empty_o);  
nhr_l_write_i_temp = (~ifc.l_arb_empty_i & l_pt_empty_o);  

rrp_n_priority_read_o_temp = (ifc.n_arb_credit_i)&(rrp_s_priority_n_o_temp | rrp_w_priority_n_o_temp | rrp_e_priority_n_o_temp | rrp_l_priority_n_o_temp) ;  
rrp_s_priority_read_o_temp = (ifc.s_arb_credit_i)&(rrp_n_priority_s_o_temp | rrp_w_priority_s_o_temp | rrp_e_priority_s_o_temp | rrp_l_priority_s_o_temp) ; 
rrp_w_priority_read_o_temp = (ifc.w_arb_credit_i)&(rrp_n_priority_w_o_temp | rrp_s_priority_w_o_temp | rrp_e_priority_w_o_temp | rrp_l_priority_w_o_temp) ;   
rrp_e_priority_read_o_temp = (ifc.e_arb_credit_i)&(rrp_n_priority_e_o_temp | rrp_s_priority_e_o_temp | rrp_w_priority_e_o_temp | rrp_l_priority_e_o_temp) ;  
rrp_l_priority_read_o_temp = (ifc.l_arb_credit_i)&(rrp_n_priority_l_o_temp | rrp_s_priority_l_o_temp | rrp_w_priority_l_o_temp | rrp_e_priority_l_o_temp) ;  

cc_credit_n_o_temp = rrp_n_priority_s_o_temp | rrp_n_priority_w_o_temp | rrp_n_priority_e_o_temp | rrp_n_priority_l_o_temp;
cc_credit_s_o_temp = rrp_s_priority_n_o_temp | rrp_s_priority_w_o_temp | rrp_s_priority_e_o_temp | rrp_s_priority_l_o_temp;
cc_credit_w_o_temp = rrp_w_priority_n_o_temp | rrp_w_priority_s_o_temp | rrp_w_priority_e_o_temp | rrp_w_priority_l_o_temp;
cc_credit_e_o_temp = rrp_e_priority_n_o_temp | rrp_e_priority_s_o_temp | rrp_e_priority_w_o_temp | rrp_e_priority_l_o_temp;
cc_credit_l_o_temp = rrp_l_priority_n_o_temp | rrp_l_priority_s_o_temp | rrp_l_priority_w_o_temp | rrp_l_priority_e_o_temp;

end

end 

assign ifc.n_arb_demux_sel_o = nhr_n_addr_o_temp; 
assign ifc.s_arb_demux_sel_o = nhr_s_addr_o_temp; 
assign ifc.w_arb_demux_sel_o = nhr_w_addr_o_temp;
assign ifc.e_arb_demux_sel_o = nhr_e_addr_o_temp; 
assign ifc.l_arb_demux_sel_o = nhr_l_addr_o_temp; 

assign ifc.n_arb_dec_o = cc_credit_n_o_temp;
assign ifc.s_arb_dec_o = cc_credit_s_o_temp; 
assign ifc.w_arb_dec_o = cc_credit_w_o_temp; 
assign ifc.e_arb_dec_o = cc_credit_e_o_temp; 
assign ifc.l_arb_dec_o = cc_credit_l_o_temp;  

assign ifc.n_arb_read_o = rrp_n_priority_read_o_temp; 
assign ifc.n_arb_mux_sel_o = rrp_n_priority_to_cs_o_temp;  

assign ifc.s_arb_read_o = rrp_s_priority_read_o_temp;
assign ifc.s_arb_mux_sel_o = rrp_s_priority_to_cs_o_temp;  

assign ifc.w_arb_read_o = rrp_w_priority_read_o_temp; 
assign ifc.w_arb_mux_sel_o = rrp_w_priority_to_cs_o_temp;  

assign ifc.e_arb_read_o = rrp_e_priority_read_o_temp; 
assign ifc.e_arb_mux_sel_o = rrp_e_priority_to_cs_o_temp;  

assign ifc.l_arb_read_o = rrp_l_priority_read_o_temp; 
assign ifc.l_arb_mux_sel_o = rrp_l_priority_to_cs_o_temp;  

endmodule
