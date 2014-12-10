class arbiter_environment;

	rand int random_seed;
	rand int reset_density;
	rand int empty_density;
    rand int credit_density;
	rand int x_cor;
	rand int y_cor;
	
	bit auto_config;
	int max_cycles;
	int file;
	real val;
	string t_var;
	constraint densities {
	    reset_density <= 100;
	    empty_density <= 100;
        credit_density <= 100;
		x_cor >= 0;
		x_cor <= 3;
		y_cor >= 0;
		y_cor <= 3;
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
				"EMPTY_DENSITY": empty_density = val*100;
                "CREDIT_DENSITY": credit_density = val*100;
				"AUTO_CONFIGURE": auto_config = val;
			endcase
		end
		$fclose(file);
	endfunction
endclass
