#include "div_RTL.hh"

void divModule::div_proc() { 
  
  sc_uint<32> tmp_result;
  sc_uint<32> tmp_value;
  sc_uint<16> r, g, b;
  done.write(sc_logic('0'));
  result.write(0);
  
  while(true){
    if (rst.read() == sc_logic('1')){
        tmp_value = 0;
        tmp_result = 0;
        r = 0;
        g = 0;
        b = 0;
    }
    
    else{
      while(start.read() != sc_logic('1'))
        wait();
      tmp_value = datain.read();
      wait();
      r = tmp_value.range(7,0);
      g = tmp_value.range(15,8);
      b = tmp_value.range(23,16);
      wait();
      r = (r <<10)/(r+g+b);
      g = (g <<10)/(r+g+b);
      wait();
      tmp_result.range(23, 16) = r.range(15, 0);
      tmp_result.range(15, 0) = g.range(15, 0);
      wait();
      result.write(tmp_result);
      wait();
      done.write(sc_logic('1'));
    }
  }
}

