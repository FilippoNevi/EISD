#include "root_RTL_testbench.hh"

root_RTL_testbench::root_RTL_testbench(sc_module_name name_)
  : sc_module(name_)
  {

  SC_THREAD(run);
	sensitive << clk.pos();
}

void root_RTL_testbench::run()
{
  
  sc_uint<32> temp_data_in, result = 0;
  
  cout<<"Calculate the square root of 128  numbers!"<<endl;

  for (int i = 1; i <= 128; i++){
    temp_data_in = (rand() % 256);

    cout<<"\tThe square root of "<<temp_data_in;

    reset_to_RTL.write(1);
    p_Out_enable.write(1);
    p_Out_data.write(temp_data_in);
    wait();
    
    while(p_In_enable.read() != 1) wait();
    result=p_In_data.read();
    cout << "\t is: " << result << endl;
    
  }
  
  reset_to_RTL.write(0);
  p_Out_enable.write(0);
  p_Out_data.write(0);
  
  sc_stop();
  
}


