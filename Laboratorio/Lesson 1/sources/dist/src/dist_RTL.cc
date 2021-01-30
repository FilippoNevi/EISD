#include "dist_RTL.hh"


distModule::distModule(const sc_module_name& module_name) : 
    sc_module(module_name),
    start("start"),
    done("done"),
    datain("datain"), 
    result("result"), 
    clk("clk"),
    rst("rst")
{
    SC_THREAD(dist_proc);
    sensitive << clk.pos();

    image_segment[0] = 128;
    image_segment[1] = 128;
    image_segment[2] = 128;
    image_segment[3] = 128;
}


distModule::~distModule()
{
}

void distModule::dist_proc() { 
    sc_uint<32> datain_reg, address_reg;
    bool db_mode_reg;
    sc_uint<8> tmp1, tmp2, tmp3, tmp4;
    sc_uint<9> middleres1, middleres2, middleres3, middleres4;
    sc_uint<16> p1, p2, p3, p4;

    done.write(sc_logic(0));
    result.write(0);

    while(true){
        while(start.read() != sc_logic(1))
            wait();

        datain_reg = datain.read();               
        address_reg = address.read();
        db_mode_reg = db_mode.read();

        wait();

        if (db_mode_reg) {
            tmp1 = datain_reg.range(7, 0);
            tmp2 = datain_reg.range(15, 8);
            tmp3 = datain_reg.range(23, 16);
            tmp4 = datain_reg.range(31, 24);
            wait();
            image_segment[address_reg] = tmp4;
            address_reg++;
            image_segment[address_reg] = tmp3;
            address_reg++;
            image_segment[address_reg] = tmp2;
            address_reg++;
            image_segment[address_reg] = tmp1;
            wait();
        } 
        else {
            tmp1 = datain_reg.range(7, 0);
            tmp2 = datain_reg.range(15, 8);
            tmp3 = datain_reg.range(23, 16);
            tmp4 = datain_reg.range(31, 24);
            wait();
            middleres1 = tmp4 - image_segment[address_reg];
            address_reg++;
            middleres2 = tmp3 - image_segment[address_reg];
            address_reg++;
            middleres3 = tmp2 - image_segment[address_reg];
            address_reg++;
            middleres4 = tmp1 - image_segment[address_reg];
            wait();
            p1 = middleres1 * middleres1;
            p2 = middleres2 * middleres2;
            p3 = middleres3 * middleres3;
            p4 = middleres4 * middleres4;
            wait();
            result.write(p1 + p2 + p3 + p4);
        }
        done.write(sc_logic(1));
        wait();
    }
}

