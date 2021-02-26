.SILENT:

help:
	echo ""
	echo "        'make'           This help."
	echo "        'make clean'     Clean all the code."
	echo "        'make compile'   Compile the platform.'"
	echo "        'make sim'       Simulate the platform.'"
	echo "        'make batch'     Simulate the platform in console mode."

clean:
	echo "===================================================="
	echo "CLEANING"
	echo "===================================================="
	rm -rf work
	rm -rf vsim.wlf
	rm -rf modelsim.ini
	rm -rf transcript transcript_ms *.log *.vstf *.chi *.reuse *.id *.wdb *.ez.do
	rm -rf DefaultVlogALib
	echo "===================================================="
	echo "CLEAN DONE!"
	echo "===================================================="

compile: clean
	valib work
	echo "===================================================="
	echo "COMPILING"
	echo "===================================================="
	valog ../components/*.vams ../testbenches/motor_long_tb.vams
	echo "===================================================="
	echo "COMPILATION COMPLETED!"
	echo "===================================================="

sim:
	echo "===================================================="
	vasim -cmd module.cir
	echo "===================================================="

batch:
	echo "===================================================="
	vasim -cmd module.cir -do module.do -c
	echo "===================================================="

