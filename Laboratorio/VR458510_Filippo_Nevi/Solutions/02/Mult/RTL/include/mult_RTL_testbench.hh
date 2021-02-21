#ifndef _mult_RTL_TESTBENCH_H_
#define _mult_RTL_TESTBENCH_H_

#include <systemc.h>

SC_MODULE(mult_RTL_testbench) {

private:
  void run();
  float get_float_value(sc_uint<32> number, sc_uint<6> total_bits_number);

public:
  sc_in<sc_uint<1> >  	p_In_enable;
  sc_in<sc_uint<8> > 	p_In_data_1;
  sc_in<sc_uint<8> >  p_In_data_2;
  sc_in<sc_uint<8> >  p_In_data_3;
  sc_in<sc_uint<8> >  p_In_data_4;
  sc_out<sc_uint<1> >  	p_Out_enable;
  sc_out<sc_uint<8> > 	p_Out_data_a;
  sc_out<sc_uint<8> >	p_Out_data_b;
  sc_out<sc_uint<8> > p_Out_data_c;
  sc_out<sc_uint<8> > p_Out_data_d;
  sc_out<bool> 		reset_to_RTL;
  sc_in_clk            	clk;

  SC_HAS_PROCESS(mult_RTL_testbench);
  mult_RTL_testbench(sc_module_name name);

};

#endif
