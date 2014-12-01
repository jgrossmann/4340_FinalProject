DUT=noc
BENCH_SRC=top.sv
BENCH_BIN=testbench.exe

all:
    make clean
    make test
    make gtkwave

bench:
    vcs -full64 -debug_pp -sverilog -notice +lint=all,noVCDE +define+SV +define+VPD $(BENCH_SRC) -o $(BENCH_BIN)
    ./$(BENCH_BIN)

view:
    dve -full64 -vpd vcdplus.vpd &

wave:
    vcs -vpd2vcd vcdplus.vpd waveform.vcd
    gtkwave waveform.vcd &

clean:
    rm -rf csrc *.exe.daidir *.exe *.log *.inf .leda_work *.key *.vpd *.vcd DVEfiles

