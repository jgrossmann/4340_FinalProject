
module rw_pointer (

input clk, 
input reset,
input rwptr_inc_i,  
output [2:0] rwptr_addr_o

);
	 
logic [2:0] data; 

always_ff @(posedge clk) begin
    
    if (reset) begin
    
        data <= 3'b000;
    
    end else if(rwptr_inc_i) begin
        data <= (data_o + 1) % 5;    
    end
    
end 

assign rwptr_addr_o = data;  

endmodule
