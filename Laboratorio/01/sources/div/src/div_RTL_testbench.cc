#include "div_RTL_testbench.hh"
#include <cstdlib>
#include <ctime>

tb_rtl::tb_rtl(sc_module_name name)
{
	SC_THREAD(run);
  sensitive << clk.pos();
}

void tb_rtl::run()
{
  sc_uint<32> data;

  srand(1000);
  cout<<"Calculate the div function of up to 128 pixels!"<<endl;

  for (int i = 0; i < 128; i++) {

    data = (rand() % 256) << 24;
    data += (rand() % 256) << 16;
    data += (rand() % 256) << 8;
    data += (rand() % 256);
    cout << "\tpixel:\t" << data << endl;
    datain.write(data);
    start.write(sc_logic('1'));
    wait();

    start.write(sc_logic('0'));
    while (done.read() != sc_logic('1')) wait();

    cout << "\tresult:\t" << result.read() << endl;
    cout<<endl;
    wait();
  }

  sc_stop();
}
