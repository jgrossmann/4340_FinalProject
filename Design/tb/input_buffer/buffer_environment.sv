class buffer_environment;

	rand int random_seed;
	rand int reset_density;
	rand bit write_density;
    rand bit read_density;
	bit auto_config;
	int max_cycles;
	int file;
	real val;
	string t_var;
	constraint densities {
	    reset_density <= 100;
	    write_density <= 100;
        read_density <= 100;
	}	
	function new();
		file = $fopen("config.txt" ,"r");
		if(file == 0) begin
			$display("ERROR: can not open file 'config.txt'");
			$finish;
		end
		while(!$feof(file)) begin
			if($fscanf(file,"%s %f\n", t_var, val)) begin
					$display("scan: %s %f", t_var, val);
			end
			case(t_var)
				"RANDOM_SEED": random_seed = val;
				"MAX_CYCLES": max_cycles = val;
				"RESET_DENSITY": reset_density = val*100;
				"WRITE_DENSITY": write_density = val*100;
                "READ_DENSITY": read_density = val*100;
				"AUTO_CONFIGURE": auto_config = val;
			endcase
		end
		$fclose(file);
	endfunction
endclass
