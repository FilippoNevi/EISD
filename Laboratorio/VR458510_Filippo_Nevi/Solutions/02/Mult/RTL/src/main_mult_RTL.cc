#include "mult_RTL_testbench.hh"
#include "mult_RTL.hh"

int sc_main(int argc, char **argv)
{
  sc_clock                  clock;
  
  sc_signal < bool >        reset_signal;
  sc_signal<sc_uint<8> >       p_In_data_a;
  sc_signal<sc_uint<8> >		    p_In_data_b;
  sc_signal<sc_uint<8> >        p_In_data_c;
  sc_signal<sc_uint<8> >        p_In_data_d;
  sc_signal<sc_uint<1> >        p_In_enable;
  sc_signal<sc_uint<1> >        p_Out_enable;
  sc_signal<sc_uint<8> >       p_Out_data_1;
  sc_signal<sc_uint<8> >       p_Out_data_2;
  sc_signal<sc_uint<8> >       p_Out_data_3;
  sc_signal<sc_uint<8> >       p_Out_data_4;
  
  mult_RTL_testbench            i_src_RTL("src_RTL");             // source module
  mult_RTL                      i_mult_RTL("mult_RTL");    // mult RTL module

  i_mult_RTL.clk(clock);
  i_mult_RTL.reset(reset_signal);
  i_mult_RTL.numbers_areready(p_In_enable);
  i_mult_RTL.number_a_port(p_In_data_a);
  i_mult_RTL.number_b_port(p_In_data_b);
  i_mult_RTL.number_c_port(p_In_data_c);
  i_mult_RTL.number_d_port(p_In_data_d);
  i_mult_RTL.result_port_1(p_Out_data_1);
  i_mult_RTL.result_port_2(p_Out_data_2);
  i_mult_RTL.result_port_3(p_Out_data_3);
  i_mult_RTL.result_port_4(p_Out_data_4);
  i_mult_RTL.result_isready(p_Out_enable);
  
  i_src_RTL.clk(clock);
  i_src_RTL.p_In_enable(p_Out_enable);
  i_src_RTL.p_In_data_1(p_Out_data_1);
  i_src_RTL.p_In_data_2(p_Out_data_2);
  i_src_RTL.p_In_data_3(p_Out_data_3);
  i_src_RTL.p_In_data_4(p_Out_data_4);
  i_src_RTL.p_Out_enable(p_In_enable);
  i_src_RTL.p_Out_data_a(p_In_data_a);
  i_src_RTL.p_Out_data_b(p_In_data_b);
  i_src_RTL.p_Out_data_c(p_In_data_c);
  i_src_RTL.p_Out_data_d(p_In_data_d);
  i_src_RTL.reset_to_RTL(reset_signal);
  
  sc_start();
  
  return 0;
};
