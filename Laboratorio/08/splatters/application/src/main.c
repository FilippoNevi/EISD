//----------------------------------------------------------
//-- TITLE: Example of C main code rom for mos6502
//--
//-- Author: Stefano Centomo
//--
//-- Date:19/04/2018
//----------------------------------------------------------
//---------------------------------------
//---------------------------------------
//
//	M6502 
//	SUPPORTED TYPES & DIMENSIONS
//
//  int 		=>	16 bits	
//  char		=>	8 bits
//  uint8_t/int8_t	=>	8 bits
//  uint16_t/int16_t	=>	16 bits
//  uint32_t/int32_t	=>	32 bits
//  float/double	=> not supported
//	
//---------------------------------------
//---------------------------------------


#include <stdbool.h>
#include "custom_stdlib.h"
#include "routines.h"


int main()
{
	
	// VARIABLES
	uint16_t op1_mul = 5;
	uint16_t op2_mul = 2;

	uint8_t op1_root = 228;
	uint8_t op2_root = 234;
	uint8_t op3_root = 126;
	uint8_t op4_root = 177;
	
	uint32_t result	= 0;
	
	// Test the multiplier pheripheral
 	result = mul(op1_mul, op2_mul);
 	//Write the result on IO Module
 	io_write(result);
 	//Read new data from IO Module
	op2_mul	= (uint16_t) io_read();
	//Execute multiplication with new op2
 	result = mul(op1_mul, op2_mul);
 	//Write result on IO Module
 	io_write(result);

	// Main for Root
	result = root(op1_root, op2_root, op3_root, op4_root);
	io_write(result);

	op1_root = (uint8_t) io_read();
	op2_root = 0;
	op3_root = 0;
	op4_root = 0;

	// Execute root with new operators
	result = root(op1_root, op2_root, op3_root, op4_root);
	io_write(result);

	return 0;
}
