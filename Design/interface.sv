// cam interface
interface ifc (input bit clk);
	logic reset;
	logic valid_i [3:0][3:0]; 
	logic valid_o [3:0][3:0]; 
	logic credit_i [3:0][3:0]; 
	logic credit_o [3:0][3:0]; 
	logic [15:0] data_i [3:0][3:0];
	logic [15:0] data_o [3:0][3:0];

	clocking cb @(posedge clk);
	
	output reset;
	output data_i;
	output valid_i;
	output credit_i;
	input data_o;
	input valid_o;
	input credit_o;
	
	endclocking

	modport bench (clocking cb);

	modport dut (
		
	input clk,
	input reset,
	input data_i,
	input valid_i,
	input credit_i,
	output data_o,
	output valid_o,
	output credit_o
	
	);

endinterface
