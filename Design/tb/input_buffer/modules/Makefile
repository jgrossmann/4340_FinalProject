INTERFACE="modules/buffer_interface.sv"
DUT="modules/input_buffer_test.sv"
TOP="modules/buffer_top.sv"

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
	vcs -full64 -PP -sverilog +define+SV +define+VPD +lint=all,noVCDE -notice "rw_pointer.sv" "rw_pointer_test.sv" -o testbench.exe

clean:
	rm -rf *.o *~ *.vpd sim* csrc DVEfiles *daidir *exe *.key
