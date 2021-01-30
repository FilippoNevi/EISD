#include "mult_RTL.hh"

void mult_RTL :: elaborate_MULT_FSM(void){
  if (reset.read() == 0){
	STATUS = Reset_ST;
  }
  else if (clk.read() == 1) {

  	sc_uint<8> result_1, result_2, result_3, result_4;
  	sc_uint<32> temp;

	STATUS = NEXT_STATUS;
	
	switch(STATUS){
	case Reset_ST:
		result_port_1.write(0);
		result_port_2.write(0);
		result_port_3.write(0);
		result_port_4.write(0);
		result_isready.write(0);
		break;
	case ST_0:
		result_port_1.write(0);
		result_port_2.write(0);
		result_port_3.write(0);
		result_port_4.write(0);
		result_isready.write(0);
		Product.write(0);
		Number_a.write(0);
		Number_b.write(0);
		break;
	case ST_1:
		// Read and store the two numbers to elaborate
		temp = number_a_port.read() << 8;
		temp = temp + number_b_port.read();
		Number_a.write(temp);
		Counter.write(temp);

		temp = number_c_port.read() << 8;
		temp = temp + number_d_port.read();
		Number_b.write(temp);
		break;
	case ST_2:
		break;
	case ST_3:
		Product.write(Product.read() + Number_a.read());
		break;
	case ST_4:
		Number_a.write(Number_a.read() << 1);
		Number_b.write(Number_b.read() >> 1);
		Counter.write(Counter.read() >> 1);
		break;
	case ST_5:
		// Split the product in 4 single bytes
		temp = Product.read() & 4278190080;
		temp = temp >> 24;
		result_1 = temp;

		temp = Product.read() & 16711680;
		temp = temp >> 16;
		result_2 = temp;

		temp = Product.read() & 65280;
		temp = temp >> 8;
		result_3 = temp;

		temp = Product.read() & 255;
		result_4 = temp;
		result_port_1.write(result_1);
		result_port_2.write(result_2);
		result_port_3.write(result_3);
		result_port_4.write(result_4);
		result_isready.write(1);
		break;
	}
  }
}


void mult_RTL :: elaborate_MULT(void){
  
  
  NEXT_STATUS = STATUS;

  switch(STATUS){
  case Reset_ST:
    NEXT_STATUS = ST_0;
    break;

  case ST_0:
    if (numbers_areready.read() == 1) {
      NEXT_STATUS = ST_1;
    } else {
      NEXT_STATUS = ST_0;
    }
    break;
    
  case ST_1:
  	NEXT_STATUS = ST_2;
    break;

  case ST_2:
  	if((Number_b.read() & 1) == 1) {
  		NEXT_STATUS = ST_3;
  	} else {
  		NEXT_STATUS = ST_4;
  	}
    break;
        
  case ST_3:
    NEXT_STATUS = ST_4;
    break;
    
  case ST_4:
  	if(Counter.read() > 0) {
	  	NEXT_STATUS = ST_2;
	} else {
		NEXT_STATUS = ST_5;
	}
    break;
  case ST_5:
  	NEXT_STATUS = ST_0;
  	break;
  }
}
