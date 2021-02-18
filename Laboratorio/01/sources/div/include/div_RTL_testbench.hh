#ifndef TB_RTL_H
#define TB_RTL_H

#include <systemc.h>

SC_MODULE(tb_rtl) {
public:
	sc_in   <bool > clk;
	sc_out  <sc_uint<32> > datain;
	sc_in   <sc_uint<32> > result;
	sc_out  <sc_logic > start;
	sc_in   <sc_logic > done;

	SC_HAS_PROCESS(tb_rtl);
	tb_rtl(sc_module_name name);
	~tb_rtl()
	{
	}

private:

	void run();

};

#endif
