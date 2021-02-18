#ifndef _root_RTL_TESTBENCH_H_
#define _root_RTL_TESTBENCH_H_

#include <systemc.h>

SC_MODULE(root_RTL_testbench) 
{

private:



  void run();

public:
  
  sc_in<sc_uint<1> >  	p_In_enable;
  sc_in<sc_uint<32> > 	p_In_data;
  sc_out<sc_uint<1> >  	p_Out_enable;
  sc_out<sc_uint<32> > 	p_Out_data;
  sc_out<bool> 		reset_to_RTL;
  sc_in_clk            	clk;

  SC_HAS_PROCESS(root_RTL_testbench);
  root_RTL_testbench(sc_module_name name);

};

#endif
