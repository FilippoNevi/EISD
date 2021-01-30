#ifndef _TB_RTL_H_
#define _TB_RTL_H_

#include <systemc.h>
#define THRESHOLD 25000
#define PERIOD 100

class tb_rtl : sc_core::sc_module
{
    public:
        sc_out   <bool> clk;
        sc_out  <sc_uint<32> > datain;
        sc_in   <sc_uint<32> > result;
        sc_out  <sc_logic > start;
        sc_in   <sc_logic > done;
        sc_out  < sc_uint<32> > address;
        sc_out  < bool > db_mode;
        sc_out  < sc_logic > rst;


        SC_HAS_PROCESS(tb_rtl);

        tb_rtl(sc_module_name name);

        ~tb_rtl()
        {
        }

    private:

        void run();
        void clk_gen();

};

#endif
