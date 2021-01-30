#ifndef _DIST_H_
#define _DIST_H_

#define IMAGE_SEGMENT_SIZE 512

#include <systemc.h>

class distModule : sc_core::sc_module
{
    public : 
        sc_in< sc_logic > start;
        sc_out< sc_logic > done;
        sc_in < sc_uint<32> > datain;
        sc_in < sc_uint<32> > address;
        sc_in < bool > db_mode;
        sc_out< sc_uint<32> > result;
        sc_in< bool > clk;
        sc_in< sc_logic > rst;

    private:
        void dist_proc();
        sc_uint<8> image_segment[IMAGE_SEGMENT_SIZE];

        SC_HAS_PROCESS(distModule);

    public: 

        distModule(const sc_module_name& module_name);
        ~distModule();
};

#endif
