 #ifndef __define_LT_h__
#define __define_LT_h__

#include <systemc.h>

struct iostruct {
	// Input
	sc_uint<16> datain_a;
	sc_uint<16> datain_b;

 	// Output
	sc_uint<32> result;
};

#define ADDRESS_TYPE int
#define DATA_TYPE iostruct

#endif
