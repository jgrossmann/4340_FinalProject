DUV=arbiter

TEST=arbiter_test
BENCH=testbench.exe

all: 
	make clean
	make test
	make view

test:
	vcs -full64 -sverilog -PP +define+VPD $(DUV).sv $(TEST).sv -o $(BENCH)
	./$(BENCH)

dut:    
	vcs -full64 -sverilog -PP +define+VPD "arbiter.sv"
view:
	vpd2vcd vcdplus.vpd vcdplus.vcd &
	gtkwave vcdplus.vcd &
	
leda:
	leda -full64 -sverilog -top $(DUV) $(DUV).sv
	
clean:
	rm -rf csrc *.exe.daidir *.exe *.log *.inf .leda_work *.key *.vpd *.vcd DVEfiles
