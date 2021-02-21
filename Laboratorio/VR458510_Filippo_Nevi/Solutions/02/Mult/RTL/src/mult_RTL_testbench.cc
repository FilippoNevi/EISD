#include "mult_RTL_testbench.hh"

mult_RTL_testbench::mult_RTL_testbench(sc_module_name name_)
  : sc_module(name_)
  {

  SC_THREAD(run);
	sensitive << clk.pos();
}

void mult_RTL_testbench::run()
{
  
  sc_uint<8> temp_data_a_in, temp_data_b_in, temp_data_c_in, temp_data_d_in;
  sc_uint<8> result_1 = 0;
  sc_uint<8> result_2 = 0;
  sc_uint<8> result_3 = 0;
  sc_uint<8> result_4 = 0;
  sc_uint<32> total_result = 0;
  
  cout<<"Calculate the product of 2 numbers, 128 times!"<<endl;

  for (int i = 1; i <= 128; i++){
    temp_data_a_in = (rand() % 256);
    temp_data_b_in = (rand() % 256);
    temp_data_c_in = (rand() % 256);
    temp_data_d_in = (rand() % 256);

    sc_uint<16> number_1 = ((temp_data_a_in<<8)+temp_data_b_in);
    sc_uint<16> number_2 = ((temp_data_c_in<<8)+temp_data_d_in);

    cout<<"\tThe product of "<<get_float_value(number_1, 16)<<" and "<<get_float_value(number_2, 16);

    reset_to_RTL.write(1);
    p_Out_enable.write(1);
    p_Out_data_a.write(temp_data_a_in);
    p_Out_data_b.write(temp_data_b_in);
    p_Out_data_c.write(temp_data_c_in);
    p_Out_data_d.write(temp_data_d_in);
    wait();
    
    while(p_In_enable.read() != 1) wait();
    result_1=p_In_data_1.read();
    result_2=p_In_data_2.read();
    result_3=p_In_data_3.read();
    result_4=p_In_data_4.read();
    total_result = (result_1 << 24) + (result_2 << 16) + (result_3 << 8) + result_4;

    cout <<std::fixed<< "\t is: " << get_float_value(total_result, 32) << endl;
    
  }
  
  reset_to_RTL.write(0);
  p_Out_enable.write(0);
  p_Out_data_a.write(0);
  p_Out_data_b.write(0);
  p_Out_data_c.write(0);
  p_Out_data_d.write(0);
  
  sc_stop();
  
}

// Returns the fixed point value represented by the integer number
float mult_RTL_testbench::get_float_value(sc_uint<32> number, sc_uint<6> total_bits_number) {
	float return_value = 0;
	int i, power, integer_mask, rational_mask;
	int half_bits_number = total_bits_number/2;
	int half_bits_mask = 1;

	for(i = 1; i < half_bits_number; i++) {
		half_bits_mask = half_bits_mask << 1;
		half_bits_mask += 1;
	}

	// Get the integer part of the number (most significant half)
	integer_mask = (half_bits_mask << half_bits_number);
	return_value = (number & integer_mask) >> half_bits_number;

	// Compute rational part
	rational_mask = half_bits_mask >> 1;
	rational_mask += 1;

	int rational_part = number & half_bits_mask;
	for(i = 1, power = 2; i <= half_bits_number; i++, power = power << 1) {
		if ((rational_part & rational_mask) != 0)
			return_value += (1/(float)power);
		rational_mask = rational_mask >> 1;
	}

	return return_value;
}
