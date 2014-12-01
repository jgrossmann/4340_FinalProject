DUT=demux_1to5.sv
BENCH_SRC=test_demux.sv
BENCH_BIN=test.exe

all:
    make clean
    make test
    make view

test:
    vcs -full64 -debug_pp -sverilog -notice +lint=all,noVCDE +define+SV +define+VPD $(DUT) $(BENCH_SRC) -o $(BENCH_BIN)
    ./$(BENCH_BIN)

view:
    dve -full64 -vpd vcdplus.vpd &

clean:
    rm -rf csrc *.exe.daidir *.exe *.log *.inf .leda_work *.key *.vpd *.vcd DVEfiles


