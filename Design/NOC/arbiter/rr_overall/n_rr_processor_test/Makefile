DUT=../n_rr_processor.sv
BENCH_SRC=test_n_rr_processor.sv
BENCH_BIN=test.exe

all:
	make clean
	make test

test:
	vcs -full64 -debug_pp -sverilog -notice +lint=all,noVCDE +define+SV +define+VPD $(DUT) $(BENCH_SRC) -o $(BENCH_BIN)
	./$(BENCH_BIN)

clean:
	rm -rf csrc *.exe.daidir *.exe *.log *.inf .leda_work *.key *.vpd *.vcd DVEfiles

view:
	./test.exe
	vpd2vcd vcdplus.vpd vcdplus.vcd &
	gtkwave vcdplus.vcd &

