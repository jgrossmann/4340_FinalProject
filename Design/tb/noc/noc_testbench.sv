`timescale 1ns/1ps


program noc_testbench (ifc.bench ds);

    noc_transaction trans;
    noc_environment env;
	//noc_stats stats;
	noc_class my_noc;
	int i;
	int j;
	
    
    initial begin
		$vcdpluson;
        env = new();
        $srandom(env.random_seed);
			if(env.auto_config) begin
				env.randomize();
				env.max_cycles = 10000;
			end
        trans = new(env);
        my_noc = new();
		//checker = new(my_noc);
        //stats = new();
		repeat(1) begin   
			$display("%t\n",$realtime);
			trans.randomize();
			trans.reset = 1;
			trans.reset_func();
			ds.cb.reset <= trans.reset;
			ds.cb.valid_i[0][0] <= trans.valid_i[0][0];
			ds.cb.valid_i[0][1] <= trans.valid_i[1][0];
			ds.cb.valid_i[0][2] <= trans.valid_i[2][0];
			ds.cb.valid_i[0][3] <= trans.valid_i[3][0];
			ds.cb.valid_i[1][0] <= trans.valid_i[0][1];
			ds.cb.valid_i[1][1] <= trans.valid_i[1][1];
			ds.cb.valid_i[1][2] <= trans.valid_i[2][1];
			ds.cb.valid_i[1][3] <= trans.valid_i[3][1];
			ds.cb.valid_i[2][0] <= trans.valid_i[0][2];
			ds.cb.valid_i[2][1] <= trans.valid_i[1][2];
			ds.cb.valid_i[2][2] <= trans.valid_i[2][2];
			ds.cb.valid_i[2][3] <= trans.valid_i[3][2];
			ds.cb.valid_i[3][0] <= trans.valid_i[0][3];
			ds.cb.valid_i[3][1] <= trans.valid_i[1][3];
			ds.cb.valid_i[3][2] <= trans.valid_i[2][3];
			ds.cb.valid_i[3][3] <= trans.valid_i[3][3];
			ds.cb.credit_i[0][0] <= trans.credit_i[0][0];
			ds.cb.credit_i[0][1] <= trans.credit_i[1][0];
			ds.cb.credit_i[0][2] <= trans.credit_i[2][0];
			ds.cb.credit_i[0][3] <= trans.credit_i[3][0];
			ds.cb.credit_i[1][0] <= trans.credit_i[0][1];
			ds.cb.credit_i[1][1] <= trans.credit_i[1][1];
			ds.cb.credit_i[1][2] <= trans.credit_i[2][1];
			ds.cb.credit_i[1][3] <= trans.credit_i[3][1];
			ds.cb.credit_i[2][0] <= trans.credit_i[0][2];
			ds.cb.credit_i[2][1] <= trans.credit_i[1][2];
			ds.cb.credit_i[2][2] <= trans.credit_i[2][2];
			ds.cb.credit_i[2][3] <= trans.credit_i[3][2];
			ds.cb.credit_i[3][0] <= trans.credit_i[0][3];
			ds.cb.credit_i[3][1] <= trans.credit_i[1][3];
			ds.cb.credit_i[3][2] <= trans.credit_i[2][3];
			ds.cb.credit_i[3][3] <= trans.credit_i[3][3];
			if(trans.valid_i[0][0] == 1) begin
				ds.cb.data_i[0][0] <= trans.input_flits[0][0][trans.packet_tracker[0][0]].data;
			end
			if(trans.valid_i[1][0] == 1) begin
				ds.cb.data_i[0][1] <= trans.input_flits[1][0][trans.packet_tracker[1][0]].data;
			end
			if(trans.valid_i[2][0] == 1) begin
				ds.cb.data_i[0][2] <= trans.input_flits[2][0][trans.packet_tracker[2][0]].data;
			end
			if(trans.valid_i[3][0] == 1) begin	
				ds.cb.data_i[0][3] <= trans.input_flits[3][0][trans.packet_tracker[3][0]].data;
			end
			if(trans.valid_i[0][1] == 1) begin	
				ds.cb.data_i[1][0] <= trans.input_flits[0][1][trans.packet_tracker[0][1]].data;
			end
			if(trans.valid_i[1][1] == 1) begin	
				ds.cb.data_i[1][1] <= trans.input_flits[1][1][trans.packet_tracker[1][1]].data;
			end
			if(trans.valid_i[2][1] == 1) begin	
				ds.cb.data_i[1][2] <= trans.input_flits[2][1][trans.packet_tracker[2][1]].data;
			end
			if(trans.valid_i[3][1] == 1) begin	
				ds.cb.data_i[1][3] <= trans.input_flits[3][1][trans.packet_tracker[3][1]].data;
			end
			if(trans.valid_i[0][2] == 1) begin	
				ds.cb.data_i[2][0] <= trans.input_flits[0][2][trans.packet_tracker[0][2]].data;
			end
			if(trans.valid_i[1][2] == 1) begin	
				ds.cb.data_i[2][1] <= trans.input_flits[1][2][trans.packet_tracker[1][2]].data;
			end
			if(trans.valid_i[2][2] == 1) begin	
				ds.cb.data_i[2][2] <= trans.input_flits[2][2][trans.packet_tracker[2][2]].data;
			end
			if(trans.valid_i[3][2] == 1) begin	
				ds.cb.data_i[2][3] <= trans.input_flits[3][2][trans.packet_tracker[3][2]].data;
			end
			if(trans.valid_i[0][3] == 1) begin	
				ds.cb.data_i[3][0] <= trans.input_flits[0][3][trans.packet_tracker[0][3]].data;
			end
			if(trans.valid_i[1][3] == 1) begin	
				ds.cb.data_i[3][1] <= trans.input_flits[1][3][trans.packet_tracker[1][3]].data;
			end
			if(trans.valid_i[2][3] == 1) begin	
				ds.cb.data_i[3][2] <= trans.input_flits[2][3][trans.packet_tracker[2][3]].data;
			end
			if(trans.valid_i[3][3] == 1) begin	
				ds.cb.data_i[3][3] <= trans.input_flits[3][3][trans.packet_tracker[3][3]].data;
			end	
		
			my_noc.updateRouters(trans);
			foreach(trans.credit_i[i][j]) begin
				trans.credit_i[i][j] = my_noc.credit_o[i][j];
			end
			@(ds.cb);
			printResults();
		end
			
        repeat(5) begin
			$display("%t\n",$realtime);
			trans.randomize();
			//trans.reset = 1;
			ds.cb.reset <= trans.reset;
			ds.cb.valid_i[0][0] <= trans.valid_i[0][0];
			ds.cb.valid_i[0][1] <= trans.valid_i[1][0];
			ds.cb.valid_i[0][2] <= trans.valid_i[2][0];
			ds.cb.valid_i[0][3] <= trans.valid_i[3][0];
			ds.cb.valid_i[1][0] <= trans.valid_i[0][1];
			ds.cb.valid_i[1][1] <= trans.valid_i[1][1];
			ds.cb.valid_i[1][2] <= trans.valid_i[2][1];
			ds.cb.valid_i[1][3] <= trans.valid_i[3][1];
			ds.cb.valid_i[2][0] <= trans.valid_i[0][2];
			ds.cb.valid_i[2][1] <= trans.valid_i[1][2];
			ds.cb.valid_i[2][2] <= trans.valid_i[2][2];
			ds.cb.valid_i[2][3] <= trans.valid_i[3][2];
			ds.cb.valid_i[3][0] <= trans.valid_i[0][3];
			ds.cb.valid_i[3][1] <= trans.valid_i[1][3];
			ds.cb.valid_i[3][2] <= trans.valid_i[2][3];
			ds.cb.valid_i[3][3] <= trans.valid_i[3][3];
			ds.cb.credit_i[0][0] <= trans.credit_i[0][0];
			ds.cb.credit_i[0][1] <= trans.credit_i[1][0];
			ds.cb.credit_i[0][2] <= trans.credit_i[2][0];
			ds.cb.credit_i[0][3] <= trans.credit_i[3][0];
			ds.cb.credit_i[1][0] <= trans.credit_i[0][1];
			ds.cb.credit_i[1][1] <= trans.credit_i[1][1];
			ds.cb.credit_i[1][2] <= trans.credit_i[2][1];
			ds.cb.credit_i[1][3] <= trans.credit_i[3][1];
			ds.cb.credit_i[2][0] <= trans.credit_i[0][2];
			ds.cb.credit_i[2][1] <= trans.credit_i[1][2];
			ds.cb.credit_i[2][2] <= trans.credit_i[2][2];
			ds.cb.credit_i[2][3] <= trans.credit_i[3][2];
			ds.cb.credit_i[3][0] <= trans.credit_i[0][3];
			ds.cb.credit_i[3][1] <= trans.credit_i[1][3];
			ds.cb.credit_i[3][2] <= trans.credit_i[2][3];
			ds.cb.credit_i[3][3] <= trans.credit_i[3][3];
			if(trans.valid_i[0][0] == 1) begin
				ds.cb.data_i[0][0] <= trans.input_flits[0][0][trans.packet_tracker[0][0]].data;
			end
			if(trans.valid_i[1][0] == 1) begin
				ds.cb.data_i[0][1] <= trans.input_flits[1][0][trans.packet_tracker[1][0]].data;
			end
			if(trans.valid_i[2][0] == 1) begin
				ds.cb.data_i[0][2] <= trans.input_flits[2][0][trans.packet_tracker[2][0]].data;
			end
			if(trans.valid_i[3][0] == 1) begin	
				ds.cb.data_i[0][3] <= trans.input_flits[3][0][trans.packet_tracker[3][0]].data;
			end
			if(trans.valid_i[0][1] == 1) begin	
				ds.cb.data_i[1][0] <= trans.input_flits[0][1][trans.packet_tracker[0][1]].data;
			end
			if(trans.valid_i[1][1] == 1) begin	
				ds.cb.data_i[1][1] <= trans.input_flits[1][1][trans.packet_tracker[1][1]].data;
			end
			if(trans.valid_i[2][1] == 1) begin	
				ds.cb.data_i[1][2] <= trans.input_flits[2][1][trans.packet_tracker[2][1]].data;
			end
			if(trans.valid_i[3][1] == 1) begin	
				ds.cb.data_i[1][3] <= trans.input_flits[3][1][trans.packet_tracker[3][1]].data;
			end
			if(trans.valid_i[0][2] == 1) begin	
				ds.cb.data_i[2][0] <= trans.input_flits[0][2][trans.packet_tracker[0][2]].data;
			end
			if(trans.valid_i[1][2] == 1) begin	
				ds.cb.data_i[2][1] <= trans.input_flits[1][2][trans.packet_tracker[1][2]].data;
			end
			if(trans.valid_i[2][2] == 1) begin	
				ds.cb.data_i[2][2] <= trans.input_flits[2][2][trans.packet_tracker[2][2]].data;
			end
			if(trans.valid_i[3][2] == 1) begin	
				ds.cb.data_i[2][3] <= trans.input_flits[3][2][trans.packet_tracker[3][2]].data;
			end
			if(trans.valid_i[0][3] == 1) begin	
				ds.cb.data_i[3][0] <= trans.input_flits[0][3][trans.packet_tracker[0][3]].data;
			end
			if(trans.valid_i[1][3] == 1) begin	
				ds.cb.data_i[3][1] <= trans.input_flits[1][3][trans.packet_tracker[1][3]].data;
			end
			if(trans.valid_i[2][3] == 1) begin	
				ds.cb.data_i[3][2] <= trans.input_flits[2][3][trans.packet_tracker[2][3]].data;
			end
			if(trans.valid_i[3][3] == 1) begin	
				ds.cb.data_i[3][3] <= trans.input_flits[3][3][trans.packet_tracker[3][3]].data;
			end	
			my_noc.updateRouters(trans);
			
			trans.updatePackTrack();
			foreach(trans.credit_i[i][j]) begin
				trans.credit_i[i][j] = my_noc.credit_o[i][j];
			end
			@(ds.cb);
			printResults();
			
        end
    end
	
	function printResults();
		if(ds.cb.valid_o[0][0] != my_noc.valid_o[0][0]) begin
			$display("valid out 0,0: dut = %d bench = %d\n", ds.cb.valid_o[0][0], my_noc.valid_o[0][0]);
		end
		if(ds.cb.valid_o[0][1] != my_noc.valid_o[1][0]) begin
			$display("valid out 0,1: dut = %d bench = %d\n", ds.cb.valid_o[0][1], my_noc.valid_o[1][0]);
		end
		if(ds.cb.valid_o[0][2] != my_noc.valid_o[2][0]) begin
			$display("valid out 0,2: dut = %d bench = %d\n", ds.cb.valid_o[0][2], my_noc.valid_o[2][0]);
		end
		if(ds.cb.valid_o[0][3] != my_noc.valid_o[3][0]) begin
			$display("valid out 0,3: dut = %d bench = %d\n", ds.cb.valid_o[0][3], my_noc.valid_o[3][0]);
		end
		if(ds.cb.valid_o[1][0] != my_noc.valid_o[0][1]) begin
			$display("valid out 1,0: dut = %d bench = %d\n", ds.cb.valid_o[1][0], my_noc.valid_o[0][1]);
		end
		if(ds.cb.valid_o[1][1] != my_noc.valid_o[1][1]) begin
			$display("valid out 1,1: dut = %d bench = %d\n", ds.cb.valid_o[1][1], my_noc.valid_o[1][1]);
		end
		if(ds.cb.valid_o[1][2] != my_noc.valid_o[2][1]) begin
			$display("valid out 1,2: dut = %d bench = %d\n", ds.cb.valid_o[1][2], my_noc.valid_o[2][1]);
		end
		if(ds.cb.valid_o[1][3] != my_noc.valid_o[3][1]) begin
			$display("valid out 1,3: dut = %d bench = %d\n", ds.cb.valid_o[1][3], my_noc.valid_o[3][1]);
		end
		if(ds.cb.valid_o[2][0] != my_noc.valid_o[0][2]) begin
			$display("valid out 2,0: dut = %d bench = %d\n", ds.cb.valid_o[2][0], my_noc.valid_o[0][2]);
		end
		if(ds.cb.valid_o[2][1] != my_noc.valid_o[1][2]) begin
			$display("valid out 2,1: dut = %d bench = %d\n", ds.cb.valid_o[2][1], my_noc.valid_o[1][2]);
		end
		if(ds.cb.valid_o[2][2] != my_noc.valid_o[2][2]) begin
			$display("valid out 2,2: dut = %d bench = %d\n", ds.cb.valid_o[2][2], my_noc.valid_o[2][2]);
		end
		if(ds.cb.valid_o[2][3] != my_noc.valid_o[3][2]) begin
			$display("valid out 2,3: dut = %d bench = %d\n", ds.cb.valid_o[2][3], my_noc.valid_o[3][2]);
		end
		if(ds.cb.valid_o[3][0] != my_noc.valid_o[0][3]) begin
			$display("valid out 3,0: dut = %d bench = %d\n", ds.cb.valid_o[3][0], my_noc.valid_o[0][3]);
		end
		if(ds.cb.valid_o[3][1] != my_noc.valid_o[1][3]) begin
			$display("valid out 3,1: dut = %d bench = %d\n", ds.cb.valid_o[3][1], my_noc.valid_o[1][3]);
		end
		if(ds.cb.valid_o[3][2] != my_noc.valid_o[2][3]) begin
			$display("valid out 3,2: dut = %d bench = %d\n", ds.cb.valid_o[3][2], my_noc.valid_o[2][3]);
		end
		if(ds.cb.valid_o[3][3] != my_noc.valid_o[3][3]) begin
			$display("valid out 3,3: dut = %d bench = %d\n", ds.cb.valid_o[3][3], my_noc.valid_o[3][3]);
		end
		
		if(ds.cb.credit_o[0][0] != my_noc.credit_o[0][0]) begin
			$display("valid out 0,0: dut = %d bench = %d\n", ds.cb.credit_o[0][0], my_noc.credit_o[0][0]);
		end
		if(ds.cb.credit_o[0][1] != my_noc.credit_o[1][0]) begin
			$display("valid out 0,1: dut = %d bench = %d\n", ds.cb.credit_o[0][1], my_noc.credit_o[1][0]);
		end
		if(ds.cb.credit_o[0][2] != my_noc.credit_o[2][0]) begin
			$display("valid out 0,2: dut = %d bench = %d\n", ds.cb.credit_o[0][2], my_noc.credit_o[2][0]);
		end
		if(ds.cb.credit_o[0][3] != my_noc.credit_o[3][0]) begin
			$display("valid out 0,3: dut = %d bench = %d\n", ds.cb.credit_o[0][3], my_noc.credit_o[3][0]);
		end
		if(ds.cb.credit_o[1][0] != my_noc.credit_o[0][1]) begin
			$display("valid out 1,0: dut = %d bench = %d\n", ds.cb.credit_o[1][0], my_noc.credit_o[0][1]);
		end
		if(ds.cb.credit_o[1][1] != my_noc.credit_o[1][1]) begin
			$display("valid out 1,1: dut = %d bench = %d\n", ds.cb.credit_o[1][1], my_noc.credit_o[1][1]);
		end
		if(ds.cb.credit_o[1][2] != my_noc.credit_o[2][1]) begin
			$display("valid out 1,2: dut = %d bench = %d\n", ds.cb.credit_o[1][2], my_noc.credit_o[2][1]);
		end
		if(ds.cb.credit_o[1][3] != my_noc.credit_o[3][1]) begin
			$display("valid out 1,3: dut = %d bench = %d\n", ds.cb.credit_o[1][3], my_noc.credit_o[3][1]);
		end
		if(ds.cb.credit_o[2][0] != my_noc.credit_o[0][2]) begin
			$display("valid out 2,0: dut = %d bench = %d\n", ds.cb.credit_o[2][0], my_noc.credit_o[0][2]);
		end
		if(ds.cb.credit_o[2][1] != my_noc.credit_o[1][2]) begin
			$display("valid out 2,1: dut = %d bench = %d\n", ds.cb.credit_o[2][1], my_noc.credit_o[1][2]);
		end
		if(ds.cb.credit_o[2][2] != my_noc.credit_o[2][2]) begin
			$display("valid out 2,2: dut = %d bench = %d\n", ds.cb.credit_o[2][2], my_noc.credit_o[2][2]);
		end
		if(ds.cb.credit_o[2][3] != my_noc.credit_o[3][2]) begin
			$display("valid out 2,3: dut = %d bench = %d\n", ds.cb.credit_o[2][3], my_noc.credit_o[3][2]);
		end
		if(ds.cb.credit_o[3][0] != my_noc.credit_o[0][3]) begin
			$display("valid out 3,0: dut = %d bench = %d\n", ds.cb.credit_o[3][0], my_noc.credit_o[0][3]);
		end
		if(ds.cb.credit_o[3][1] != my_noc.credit_o[1][3]) begin
			$display("valid out 3,1: dut = %d bench = %d\n", ds.cb.credit_o[3][1], my_noc.credit_o[1][3]);
		end
		if(ds.cb.credit_o[3][2] != my_noc.credit_o[2][3]) begin
			$display("valid out 3,2: dut = %d bench = %d\n", ds.cb.credit_o[3][2], my_noc.credit_o[2][3]);
		end
		if(ds.cb.credit_o[3][3] != my_noc.credit_o[3][3]) begin
			$display("valid out 3,3: dut = %d bench = %d\n", ds.cb.credit_o[3][3], my_noc.credit_o[3][3]);
		end
		
		if(my_noc.valid_o[0][0] == 1) begin
			if(ds.cb.data_o[0][0] != my_noc.outputs[0][0].data) begin
				$display("valid out 0,0: dut = %d bench = %d\n", ds.cb.data_o[0][0], my_noc.outputs[0][0].data);
			end
		end
		if(my_noc.valid_o[1][0] == 1) begin
			if(ds.cb.data_o[0][1] != my_noc.outputs[1][0].data) begin
				$display("valid out 0,1: dut = %d bench = %d\n", ds.cb.data_o[0][1], my_noc.outputs[1][0].data);
			end
		end
		if(my_noc.valid_o[2][0] == 1) begin
			if(ds.cb.data_o[0][2] != my_noc.outputs[2][0].data) begin
				$display("valid out 0,2: dut = %d bench = %d\n", ds.cb.data_o[0][2], my_noc.outputs[2][0].data);
			end
		end
		if(my_noc.valid_o[3][0] == 1) begin
			if(ds.cb.data_o[0][3] != my_noc.outputs[3][0].data) begin
				$display("valid out 0,3: dut = %d bench = %d\n", ds.cb.data_o[0][3], my_noc.outputs[3][0].data);
			end
		end
		if(my_noc.valid_o[0][1] == 1) begin
			if(ds.cb.data_o[1][0] != my_noc.outputs[0][1].data) begin
				$display("valid out 1,0: dut = %d bench = %d\n", ds.cb.data_o[1][0], my_noc.outputs[0][1].data);
			end
		end
		if(my_noc.valid_o[1][1] == 1) begin
			if(ds.cb.data_o[1][1] != my_noc.outputs[1][1].data) begin
				$display("valid out 1,1: dut = %d bench = %d\n", ds.cb.data_o[1][1], my_noc.outputs[1][1].data);
			end
		end
		if(my_noc.valid_o[2][1] == 1) begin
			if(ds.cb.data_o[1][2] != my_noc.outputs[2][1].data) begin
				$display("valid out 1,2: dut = %d bench = %d\n", ds.cb.data_o[1][2], my_noc.outputs[2][1].data);
			end
		end
		if(my_noc.valid_o[3][1] == 1) begin
			if(ds.cb.data_o[1][3] != my_noc.outputs[3][1].data) begin
				$display("valid out 1,3: dut = %d bench = %d\n", ds.cb.data_o[1][3], my_noc.outputs[3][1].data);
			end
		end
		if(my_noc.valid_o[0][2] == 1) begin
			if(ds.cb.data_o[2][0] != my_noc.outputs[0][2].data) begin
				$display("valid out 2,0: dut = %d bench = %d\n", ds.cb.data_o[2][0], my_noc.outputs[0][2].data);
			end
		end
		if(my_noc.valid_o[1][2] == 1) begin
			if(ds.cb.data_o[2][1] != my_noc.outputs[1][2].data) begin
				$display("valid out 2,1: dut = %d bench = %d\n", ds.cb.data_o[2][1], my_noc.outputs[1][2].data);
			end
		end
		if(my_noc.valid_o[2][2] == 1) begin
			if(ds.cb.data_o[2][2] != my_noc.outputs[2][2].data) begin
				$display("valid out 2,2: dut = %d bench = %d\n", ds.cb.data_o[2][2], my_noc.outputs[2][2].data);
			end
		end
		if(my_noc.valid_o[3][2] == 1) begin
			if(ds.cb.data_o[2][3] != my_noc.outputs[3][2].data) begin
				$display("valid out 2,3: dut = %d bench = %d\n", ds.cb.data_o[2][3], my_noc.outputs[3][2].data);
			end
		end
		if(my_noc.valid_o[0][3] == 1) begin
			if(ds.cb.data_o[3][0] != my_noc.outputs[0][3].data) begin
				$display("valid out 3,0: dut = %d bench = %d\n", ds.cb.data_o[3][0], my_noc.outputs[0][3].data);
			end
		end
		if(my_noc.valid_o[1][3] == 1) begin
			if(ds.cb.data_o[3][1] != my_noc.outputs[1][3].data) begin
				$display("valid out 3,1: dut = %d bench = %d\n", ds.cb.data_o[3][1], my_noc.outputs[1][3].data);
			end
		end
		if(my_noc.valid_o[2][3] == 1) begin
			if(ds.cb.data_o[3][2] != my_noc.outputs[2][3].data) begin
				$display("valid out 3,2: dut = %d bench = %d\n", ds.cb.data_o[3][2], my_noc.outputs[2][3].data);
			end
		end
		if(my_noc.valid_o[3][3] == 1) begin
			if(ds.cb.data_o[3][3] != my_noc.outputs[3][3].data) begin
				$display("valid out 3,3: dut = %d bench = %d\n", ds.cb.data_o[3][3], my_noc.outputs[3][3].data);
			end
		end
		
		
		
		
		
	
	endfunction

endprogram
