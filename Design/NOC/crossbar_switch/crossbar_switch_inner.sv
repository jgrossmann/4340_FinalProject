`include "./demux/demux_1to5.sv"
`include "./mux/mux_5to1.sv"

// Crossbar-switch comprises 5 demux and 5 mux. Each 16-bit input from the associated input buffer will enter the de-mux and get selected by output of associated Y-X processor. 

// Output of each de-mux will drive all muxes except the one with same direction. The select sinal genrated by Round-robin proessor will select the prioritized input to be sent to the associated output direction. 

module crossbar_switch_inner 

(
// Input of demux 

input [15:0] n_cs_i, 
input [15:0] s_cs_i, 
input [15:0] w_cs_i, 
input [15:0] e_cs_i, 
input [15:0] l_cs_i, 

// Input of demux select signals

input [2:0] n_cs_sel_demux_i, 
input [2:0] s_cs_sel_demux_i, 
input [2:0] w_cs_sel_demux_i, 
input [2:0] e_cs_sel_demux_i, 
input [2:0] l_cs_sel_demux_i,

// Input of mux select signals

input [2:0] n_cs_sel_mux_i, 
input [2:0] s_cs_sel_mux_i, 
input [2:0] w_cs_sel_mux_i, 
input [2:0] e_cs_sel_mux_i, 
input [2:0] l_cs_sel_mux_i,

// outpu of mux 

output [15:0] n_cs_o, 
output [15:0] s_cs_o, 
output [15:0] w_cs_o, 
output [15:0] e_cs_o, 
output [15:0] l_cs_o
);

logic [15:0] n_demux_s_temp; 
logic [15:0] n_demux_w_temp; 
logic [15:0] n_demux_e_temp; 
logic [15:0] n_demux_l_temp; 

logic [15:0] s_demux_n_temp; 
logic [15:0] s_demux_w_temp; 
logic [15:0] s_demux_e_temp; 
logic [15:0] s_demux_l_temp; 

logic [15:0] w_demux_n_temp; 
logic [15:0] w_demux_s_temp; 
logic [15:0] w_demux_e_temp; 
logic [15:0] w_demux_l_temp; 

logic [15:0] e_demux_n_temp; 
logic [15:0] e_demux_s_temp; 
logic [15:0] e_demux_w_temp; 
logic [15:0] e_demux_l_temp; 

logic [15:0] l_demux_n_temp; 
logic [15:0] l_demux_s_temp; 
logic [15:0] l_demux_w_temp; 
logic [15:0] l_demux_e_temp; 

logic [15:0] n_cs_o_temp; 
logic [15:0] s_cs_o_temp; 
logic [15:0] w_cs_o_temp; 
logic [15:0] e_cs_o_temp; 
logic [15:0] l_cs_o_temp; 

// Instantiate five demux for north, south, west, east local input buffer respectively. 

     demux_1to5 n_demux( 
	   .data_i(n_cs_i),
	   .sel_i(n_cs_sel_demux_i),
	   .data_n_o(),
	   .data_s_o(n_demux_s_temp),
	   .data_w_o(n_demux_w_temp), 
	   .data_e_o(n_demux_e_temp),
	   .data_l_o(n_demux_l_temp)
	   );
	   
     demux_1to5 s_demux ( 
 	   .data_i(s_cs_i),
 	   .sel_i(s_cs_sel_demux_i),
	   .data_n_o(s_demux_n_temp),
	   .data_s_o(),
	   .data_w_o(s_demux_w_temp), 
	   .data_e_o(s_demux_e_temp),
	   .data_l_o(s_demux_l_temp)
 	   );
	   
     demux_1to5 w_demux (   
 	   .data_i(w_cs_i),
 	   .sel_i(w_cs_sel_demux_i),
	   .data_n_o(w_demux_n_temp),
	   .data_s_o(w_demux_s_temp),
	   .data_w_o(), 
	   .data_e_o(w_demux_e_temp),
	   .data_l_o(w_demux_l_temp)
 	   );
	 
     demux_1to5 e_demux( 
  	   .data_i(e_cs_i),
  	   .sel_i(e_cs_sel_demux_i),
	   .data_n_o(e_demux_n_temp),
	   .data_s_o(e_demux_s_temp),
	   .data_w_o(e_demux_w_temp), 
	   .data_e_o(),
	   .data_l_o(e_demux_l_temp)
  	   );
	   
     demux_1to5 l_demux( 
  	   .data_i(l_cs_i),
  	   .sel_i(l_cs_sel_demux_i),
	   .data_n_o(l_demux_n_temp),
	   .data_s_o(l_demux_s_temp),
	   .data_w_o(l_demux_w_temp), 
	   .data_e_o(l_demux_e_temp),
	   .data_l_o()   
  	   );
	   
// Instantiate 5 mux for north, south, west, east, local output respectively. 
   
	   mux_5to1 n_mux( 
		   
  	   .sel_i(n_cs_sel_mux_i),
	   
	   .data_n_i(),
	   .data_s_i(s_demux_n_temp),
	   .data_w_i(w_demux_n_temp), 
	   .data_e_i(e_demux_n_temp),
	   .data_l_i(l_demux_n_temp), 
  	   .data_o(n_cs_o_temp)
 
  	   );
	   
	   mux_5to1 s_mux( 
		   
  	   .sel_i(s_cs_sel_mux_i),
	   
	   .data_n_i(n_demux_n_temp),
	   .data_s_i(),
	   .data_w_i(w_demux_n_temp), 
	   .data_e_i(e_demux_n_temp),
	   .data_l_i(l_demux_n_temp), 
  	   .data_o(s_cs_o_temp)
 
  	   );
	   
	   mux_5to1 w_mux( 
		   
  	   .sel_i(w_cs_sel_mux_i),
	   
	   .data_n_i(n_demux_n_temp),
	   .data_s_i(s_demux_n_temp),
	   .data_w_i(), 
	   .data_e_i(e_demux_n_temp),
	   .data_l_i(l_demux_n_temp), 
  	   .data_o(w_cs_o_temp)
 
  	   );
	   
	   mux_5to1 e_mux( 
		   
  	   .sel_i(e_cs_sel_mux_i),
	   
	   .data_n_i(n_demux_n_temp),
	   .data_s_i(s_demux_n_temp),
	   .data_w_i(w_demux_n_temp), 
	   .data_e_i(),
	   .data_l_i(l_demux_n_temp), 
  	   .data_o(e_cs_o_temp)
 
  	   );
	   
	   mux_5to1 l_mux( 
		   
  	   .sel_i(l_cs_sel_mux_i),
	   
	   .data_n_i(n_demux_n_temp),
	   .data_s_i(s_demux_n_temp),
	   .data_w_i(w_demux_n_temp), 
	   .data_e_i(e_demux_n_temp),
	   .data_l_i(), 
  	   .data_o(l_cs_o_temp)
 
  	   );
		   
// Use the temporary variables to drive the output signals 

assign n_cs_o = n_cs_o_temp ; 
assign s_cs_o = s_cs_o_temp ; 
assign w_cs_o = w_cs_o_temp ; 
assign e_cs_o = e_cs_o_temp ; 
assign l_cs_o = l_cs_o_temp; 

endmodule    