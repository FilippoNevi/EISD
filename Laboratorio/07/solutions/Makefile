.SILENT:

all:
	echo "===================================================="
	echo "    'make'             This help."
	echo "    'make verilog2hif' Parse the design to HIF."
	echo "    'make analyst'     Apply Analyst to the parsed HIF tree."
	echo "    'make ddt'         Apply Ddt to the parsed HIF tree."
	echo "    'make a2tool'      Apply A2tool to the parsed HIF tree."
	echo "    'make clean'       Clean all the code."
	echo "    'make compile'     Compile the platform.'"
	echo "    'make sim'         Simulate the platform.'"
	echo "    'make batch'       Simulate the platform in console mode."
	echo "===================================================="

verilog2hif:
	verilog2hif $(shell find components -type f -name "*.vams") \
				$(shell find components -type f -name "*.va") \
				$(shell find components -type f -name "*.v") --output hif/design
analyst:
	#analyst hif/design.hif.xml --output hif/design.analyst.hif.xml --debug-level 9 --no-parametric #--time-step 1e-09
	# can't use debug level 9 in hif release
	analyst hif/design.hif.xml --output hif/design.analyst.hif.xml --no-parametric #--time-step 1e-09
	hif2sc hif/design.analyst.hif.xml --directory modelscdt
ddt:
	ddt hif/design.analyst.hif.xml --output hif/design.analyst.ddt.hif.xml --support-library
	hif2sc hif/design.analyst.ddt.hif.xml --directory modelsc
a2tool:
	a2tool hif/design.analyst.ddt.hif.xml --output hif/design.analyst.ddt.a2tool.hif.xml --protocol CPP
	hif2sc hif/design.analyst.ddt.a2tool.hif.xml --directory modelcpp

compile:
	@make -C run-eldo compile

sim:
	@make -C run-eldo sim

batch:
	@make -C run-eldo batch

clean:
	@rm -rf hif
	@rm -rf modelsc
	@rm -rf modelscdt
	@rm -rf modelcpp
	@make -C run-eldo clean

.PHONY: all verilog2hif analyst ddt a2tool compile sim batch clean