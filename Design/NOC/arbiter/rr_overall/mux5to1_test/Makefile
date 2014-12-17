
.PHONY: help

help:
	@echo "The following make targets are supported:" ;\
	echo " bench  - builds the testbench";\
	echo " wave   - convert vcd to vpd";\
	echo " expand - expands veritedium directives (autoargs, inst etc.)";\
	echo " indent - automatically indents verilog and c files" ;\
	echo " clean  - cleans testbench and intermediate files" ;\
	echo " help   - show this information";\

indent:
	emacs --batch *.sv -f verilog-batch-indent
	indent -linux *.c *.h
	rm *~

bench: 
	vcs -full64 -PP -sverilog +define+SV +define+VPD +lint=all,noVCDE -notice "mux_5to1_test.sv" -o testbench.exe

view:	
	./testbench.exe
	vpd2vcd vcdplus.vpd vcdplus.vcd &
	gtkwave vcdplus.vcd &


clean:
	rm -rf *.o *~ *.vpd sim* csrc DVEfiles *daidir *exe *.key
