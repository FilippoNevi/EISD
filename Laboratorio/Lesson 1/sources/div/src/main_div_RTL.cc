#include "div_RTL_testbench.hh"
#include "div_RTL.hh"

int sc_main(int argc, char **argv)
{
	sc_clock HCLK;

	sc_signal< sc_logic > rst;
	sc_signal< sc_uint<32> > datain;
	sc_signal< sc_uint<32> > result;
	sc_signal< sc_logic > start;
	sc_signal< sc_logic > done;

	tb_rtl tb("tb_rtl"); 
        tb.clk(HCLK);
	tb.datain(datain);
	tb.result(result);
	tb.start(start);
	tb.done(done);

	divModule div_rtl("div_rtl");
	div_rtl.clk(HCLK);
	div_rtl.rst(rst);
	div_rtl.datain(datain);
	div_rtl.result(result);
	div_rtl.start(start);
	div_rtl.done(done);

	sc_start();

	return 0;
};
