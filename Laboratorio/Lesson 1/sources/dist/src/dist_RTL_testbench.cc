#include "dist_RTL_testbench.hh"
#include <cstdlib>
#include <ctime>

tb_rtl::tb_rtl(sc_module_name name)
{
    SC_THREAD(run);
    sensitive << clk.pos();

    SC_THREAD(clk_gen);
}

void tb_rtl::clk_gen()
{
    while(true)
    {
        clk.write( true );
        wait( PERIOD / 2, SC_NS );
        clk.write( false );
        wait( PERIOD / 2, SC_NS);
    }
}

void tb_rtl::run()
{
    sc_uint<32> data;
    sc_uint<32> result_data;

    // initialize random seed
    //srand(time(NULL));
    srand(1000);
    cout<<"Comparing two random images. The DIST module will not "<<endl;
    cout<<"recognize them as photographs of the same person."<<endl;

    //PHASE 1: memorize the reference image
    for (uint i = 0; i < 128; i++) {

        data = (rand() % 256) << 24;
        data += (rand() % 256) << 16;
        data += (rand() % 256) << 8;
        data += (rand() % 256);
        cout << "\tpixel:\t" << data << endl;
        datain.write(data);
        address.write(i*4);
        db_mode.write(1);
        start.write(sc_logic('1'));
        wait();
        //		cout << "@ " << sc_time_stamp() << ": tb_rtl provided datain = " << datain.read() << "\n";

        start.write(sc_logic('0'));
        while (done.read() != sc_logic('1')) wait();
    }

    //PHASE 2: compare with a new image
    for (uint i = 0; i < 128; i++) {

        data = (rand() % 256) << 24;
        data += (rand() % 256) << 16;
        data += (rand() % 256) << 8;
        data += (rand() % 256);
        //		cout << "\tpixel:\t" << data << endl;
        datain.write(data);
        address.write(i*4);
        db_mode.write(0);
        start.write(sc_logic('1'));
        wait();
        //		cout << "@ " << sc_time_stamp() << ": tb_rtl provided datain = " << datain.read() << "\n";

        start.write(sc_logic('0'));
        while (done.read() != sc_logic('1')) wait();
    }			
    //		cout << sc_time_stamp() << ": div(" << datain.read()<< ") = " << result.read() << "\n";
    result_data = result.read();
    //		cout << "\tresult:\t" << result_data << endl;
    cout<<endl;
    wait();

    if ((result_data * result_data) < THRESHOLD){

        //the two images represent the same person
        cout<<"RECOGNIZED: the two images represent the same person"<<endl;
        cout<<"            access allowed!"<<endl;
        cout<<endl;
    }
    else{

        //the two images represent two different persons
        cout<<"WRONG IMAGE: the two images represent two different persons"<<endl;
        cout<<"            access forbidden!"<<endl;
        cout<<endl;
    }

    cout<<"Second check: comparing two identical images, with only few errors."<<endl;
    cout<<"The DIST module will recognize them as photographs of the same person."<<endl;

    unsigned int a [512];

    //PHASE 1: memorize the reference image
    /*	for (uint i = 0; i < 128; i++) {*/
    for (uint i = 1; i <= 128; i++) {

        a[i*4-3] = (rand() % 256); 
        a[i*4-2] = (rand() % 256); 
        a[i*4-2] = (rand() % 256); 
        a[i*4-1] = (rand() % 256); 

        data = a[i*4-4] << 24;
        data += a[i*4-3] << 16;
        data += a[i*4-2] << 8;
        data += a[i*4-1];
        //		cout << "\tpixel:\t" << data << endl;
        datain.write(data);
        address.write(i*4-4);
        db_mode.write(1);
        start.write(sc_logic('1'));
        wait();
        //		cout << "@ " << sc_time_stamp() << ": tb_rtl provided datain = " << datain.read() << "\n";

        start.write(sc_logic('0'));
        while (done.read() != sc_logic('1')) wait();
    }

    //PHASE 2: compare with a new image
    // 	for (uint i = 0; i < 128; i++) {
    for (uint i = 1; i <= 128; i++) {	  
        data = a[i*4-4] << 24;
        data += a[i*4-3] << 16;
        data += a[i*4-2] << 8;
        data += a[i*4-1];
        //		cout << "\tpixel:\t" << data << endl;
        datain.write(data);
        address.write(i*4-4);
        db_mode.write(0);
        start.write(sc_logic('1'));
        wait();
        //		cout << "@ " << sc_time_stamp() << ": tb_rtl provided datain = " << datain.read() << "\n";

        start.write(sc_logic('0'));
        while (done.read() != sc_logic('1')) wait();
    }			
    //		cout << sc_time_stamp() << ": div(" << datain.read()<< ") = " << result.read() << "\n";
    result_data = result.read();
    //		cout << "\tresult:\t" << result_data << endl;
    cout<<endl;
    wait();

    if ((result_data * result_data) < THRESHOLD){

        //the two images represent the same person
        cout<<"RECOGNIZED: the two images represent the same person"<<endl;
        cout<<"            access allowed!"<<endl;
        cout<<endl;
    }
    else{

        //the two images represent two different persons
        cout<<"WRONG IMAGE: the two images represent two different persons"<<endl;
        cout<<"            access forbidden!"<<endl;
        cout<<endl;
    }


    sc_stop();
}
