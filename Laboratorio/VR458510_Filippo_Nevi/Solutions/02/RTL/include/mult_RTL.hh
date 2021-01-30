#ifndef mult_RTL_H__
#define mult_RTL_H__

//systemc include
#include "systemc.h"

SC_MODULE(mult_RTL){

  sc_in<sc_uint<1> >   numbers_areready;
  // 4 ports for input numbers (8 bits for integer parts and 8 bits for rational parts)
  sc_in<sc_uint<8> >  number_a_port;
  sc_in<sc_uint<8> >  number_b_port;
  sc_in<sc_uint<8> >  number_c_port;
  sc_in<sc_uint<8> >  number_d_port;
  // 4 ports for result (16 bits for integer part & 16 bits for rational part)
  sc_out<sc_uint<8> > result_port_1;
  sc_out<sc_uint<8> > result_port_2;
  sc_out<sc_uint<8> > result_port_3;
  sc_out<sc_uint<8> > result_port_4;
  sc_out<sc_uint<1> >  result_isready;
  sc_in<bool>          reset;
  sc_in_clk            clk;

  typedef enum {Reset_ST, ST_0, ST_1, ST_2, ST_3, ST_4, ST_5} STATES;

  sc_signal<STATES> STATUS, NEXT_STATUS;
  sc_signal<sc_uint<32> > Number_a;
  sc_signal<sc_uint<16> > Number_b;
  sc_signal<sc_uint<32> > Product;
  sc_signal<sc_uint<16> >  Counter;

  void elaborate_MULT(void);
  void elaborate_MULT_FSM(void);

  SC_CTOR(mult_RTL){
    SC_METHOD(elaborate_MULT_FSM);
    sensitive << reset.neg();
    sensitive << clk.pos();

    SC_METHOD(elaborate_MULT);
    sensitive << STATUS << numbers_areready << number_b_port << Counter << Number_b;
  };
};

#endif
