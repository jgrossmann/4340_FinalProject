`timescale 1ns/1ps

class buffer_stats;

// This keeps track of all of the important statistics of our testbench, names are self explanatory.
//The simulation time is in milliseconds.


    int flits_written;
    int flits_read;
    int resets;
    real sim_time_end;
    int total_tests;
    int total_tests_failed;

// ADD IN VARIABLES FOR TOTAL FEATURE TESTS
    

    function new();
        flits_written = 0;
        flits_read = 0;
        resets = 0;
        sim_time_end = 0;
        total_tests = 0;
        total_tests_failed = 0;
    endfunction

    function void results();
        $vcdpluson;
        $display("The total simulation time: %f\n", sim_time_end);
        $display("Flits written to the buffer: %d\n", flits_written);
        $display("Flits read from the buffer: %d\n", flits_read);
        $display("Total number of resets: %d\n", resets);
        $display("Total Test results: %d / %d Tests Failed\n", total_tests_failed, total_tests);
        if(total_tests_failed == 0) begin
            $display("ALL TESTS PASSED\n");
        end else begin
            $display("ONE OR MORE OF YOUR TESTS FAILED\n");
        end
    endfunction


endclass
