class router_environment;

	int random_seed;
	int reset_density;
	int n_valid_density;
	int s_valid_density;
	int w_valid_density;
	int e_valid_density;
	int l_valid_density;
    int n_credit_density;
	int s_credit_density;
	int w_credit_density;
	int e_credit_density;
	int l_credit_density;
	int x_cor = 1;
	int y_cor = 1;
	
	bit auto_config;
	int max_cycles;
	int file;
	real val;
	string t_var;
	/*constraint densities {
		x_cor >= 0;
		x_cor <= 3;
		y_cor >= 0;
		y_cor <= 3;
	}	*/
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
				"NORTH_VALID_DENSITY": n_valid_density = val*100;
				"SOUTH_VALID_DENSITY": s_valid_density = val*100;
				"WEST_VALID_DENSITY": w_valid_density = val*100;
				"EAST_VALID_DENSITY": e_valid_density = val*100;
				"LOCAL_VALID_DENSITY": l_valid_density = val*100;
                "NORTH_CREDIT_DENSITY": n_credit_density = val*100;
				"SOUTH_CREDIT_DENSITY": s_credit_density = val*100;
				"WEST_CREDIT_DENSITY": w_credit_density = val*100;
				"EAST_CREDIT_DENSITY": e_credit_density = val*100;
				"LOCAL_CREDIT_DENSITY": l_credit_density = val*100;
				"AUTO_CONFIGURE": auto_config = val;
			endcase
		end
		$fclose(file);
	endfunction
endclass
