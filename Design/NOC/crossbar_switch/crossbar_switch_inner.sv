`include "./demux/demux_1to5.sv"


module crossbar_switch_inner 

(

input [15:0] n_cs_i, 
input [15:0] s_cs_i, 
input [15:0] w_cs_i, 
input [15:0] e_cs_i, 
input [15:0] l_cs_i, 

input [2:0] n_cs_sel_i, 
input [2:0] s_cs_sel_i, 
input [2:0] w_cs_sel_i, 
input [2:0] e_cs_sel_i, 
input [2:0] l_cs_sel_i,

input  n_cs_enable_i, 
input  s_cs_enable_i, 
input  w_cs_enable_i, 
input  e_cs_enable_i, 
input  l_cs_enable_i,

output [15:0] n_cs_o, 
output [15:0] s_cs_o, 
output [15:0] w_cs_o, 
output [15:0] e_cs_o, 
output [15:0] l_cs_o

);

logic [15:0] n_cs_o_temp; 
logic [15:0] s_cs_o_temp; 
logic [15:0] w_cs_o_temp; 
logic [15:0] e_cs_o_temp; 
logic [15:0] l_cs_o_temp; 

   demux_1to5 n_demux( 
	    
	   .data_i(n_cs_i),
	   .sel_i(n_cs_sel_i),
	   .enable_i(n_cs_enable_i),
	   .data_n_o(),
	   .data_s_o(s_cs_o_temp),
	   .data_w_o(w_cs_o_temp), 
	   .data_e_o(e_cs_o_temp),
	   .data_l_o(l_cs_o_temp)
	   
	   );
	   
    demux_1to5 s_demux ( 
	    
 	   .data_i(s_cs_i),
 	   .sel_i(s_cs_sel_i),
 	   .enable_i(s_cs_enable_i),
	   .data_n_o(n_cs_o_temp),
	   .data_s_o(),
	   .data_w_o(w_cs_o_temp), 
	   .data_e_o(e_cs_o_temp),
	   .data_l_o(l_cs_o_temp)
	   
 	   );
	   
    demux_1to5 w_demux ( 
	    
 	   .data_i(w_cs_i),
 	   .sel_i(w_cs_sel_i),
 	   .enable_i(w_cs_enable_i),
	   .data_n_o(n_cs_o_temp),
	   .data_s_o(s_cs_o_temp),
	   .data_w_o(), 
	   .data_e_o(e_cs_o_temp),
	   .data_l_o(l_cs_o_temp)
	   
 	   );
	 
     demux_1to5 e_demux( 
	    
  	   .data_i(e_cs_i),
  	   .sel_i(e_cs_sel_i),
  	   .enable_i(e_cs_enable_i),
	   .data_n_o(n_cs_o_temp),
	   .data_s_o(s_cs_o_temp),
	   .data_w_o(w_cs_o_temp), 
	   .data_e_o(),
	   .data_l_o(l_cs_o_temp)
	   
  	   );
	   
     demux_1to5 l_demux( 
	    
  	   .data_i(l_cs_i),
  	   .sel_i(l_cs_sel_i),
  	   .enable_i(l_cs_enable_i),
	   .data_n_o(n_cs_o_temp),
	   .data_s_o(s_cs_o_temp),
	   .data_w_o(w_cs_o_temp), 
	   .data_e_o(e_cs_o_temp),
	   .data_l_o()
	   
  	   );
	   
   
assign n_cs_o = n_cs_o_temp ; 
assign s_cs_o = s_cs_o_temp ; 
assign w_cs_o = w_cs_o_temp ; 
assign e_cs_o = e_cs_o_temp ; 
assign l_cs_o = l_cs_o_temp; 

endmodule 

   
   