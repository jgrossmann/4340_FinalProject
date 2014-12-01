class stats;

// This keeps track of all of the important statistics of our testbench, names are self explanatory.
//The simulation time is in milliseconds.


    int flits_input;
    int flits_output;
    int resets;
    real sim_time;
    int total_tests;
    int total_tests_failed;

// ADD IN VARIABLES FOR TOTAL FEATURE TESTS
    

    function new();
        flits_input = 0;
        flits_output = 0;
        resets = 0;
        sim_time = 0;
        total_tests = 0;
        total_tests_failed = 0;
    endfunction

    function void results();
        $vcdpluson;
        $display("The total simulation time: %f\n", sim_time);
        $display("Flits input to the NOC: %d\n", flits_input);
        $display("Flits output from the NOC: %d\n", flits_output);
        $display("Total number of resets: %d\n", resets);
        $display("Total Test results: %d / %d Tests Failed\n", total_tests_failed, total_tests);
        if(total_tests_failed == 0) begin
            $display("ALL TESTS PASSED\n");
        end else begin
            $display("ONE OR MORE OF YOUR TESTS FAILED\n");
        end
    endfunction


endclass
