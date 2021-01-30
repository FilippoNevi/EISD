#ifndef DIV_H
#define DIV_H

#include <systemc.h>

SC_MODULE(divModule) {
  public : 
    sc_in< sc_logic > start;
    sc_out< sc_logic > done;
    sc_in < sc_uint<32> > datain;
    sc_out< sc_uint<32> > result;
    sc_in< sc_logic > rst;
    sc_in< bool > clk;


  SC_HAS_PROCESS(divModule);
  public: divModule(const sc_module_name& module_name) : 
    sc_module(module_name),
    start("start"),
    done("done"),
    datain("datain"), 
    result("result"), 
    clk("clk"),
    rst("rst")
  {
    SC_THREAD(div_proc);
	  sensitive << clk.pos();
  }

private:
  void div_proc();
};

#endif
