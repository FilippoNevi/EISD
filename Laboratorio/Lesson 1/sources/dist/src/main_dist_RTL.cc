#include "dist_RTL_testbench.hh"
#include "dist_RTL.hh"

int sc_main(int argc, char * argv[])
{
    sc_signal< bool > HCLK;

    sc_signal< sc_logic > rst;
    sc_signal< sc_uint<32> > datain;
    sc_signal< sc_uint<32> > address;
    sc_signal< bool > db_mode;
    sc_signal< sc_uint<32> > result;
    sc_signal< sc_logic > start;
    sc_signal< sc_logic > done;

    tb_rtl src_RTL("src_RTL");
    src_RTL.clk(HCLK);
    src_RTL.rst(rst);
    src_RTL.datain(datain);
    src_RTL.address(address);
    src_RTL.db_mode(db_mode);
    src_RTL.result(result);
    src_RTL.start(start);
    src_RTL.done(done);

    distModule dist_rtl("dist_rtl");
    dist_rtl.clk(HCLK);
    dist_rtl.rst(rst);
    dist_rtl.datain(datain);
    dist_rtl.address(address);
    dist_rtl.db_mode(db_mode);
    dist_rtl.result(result);
    dist_rtl.start(start);
    dist_rtl.done(done);

    start = sc_logic('0');
    sc_start();
    return 0;
};
