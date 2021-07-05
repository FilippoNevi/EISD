//-------------------------------------------------------------
// Title:	Driver Library for m6502-Splatters platform
// Author:	Stefano Centomo
// Date:	15/06/2018
//-------------------------------------------------------------
#include "mmio.h"
#include "stdbool.h"
// Send op1 and op2 to multiplier connected to psel2, and return the result.
uint32_t mul(uint16_t op1, uint16_t op2);
// WRITE to IO module
void io_write(uint32_t data);
// READ from IO module
uint32_t io_read(void);

// Root driver
uint32_t root(uint8_t op1, uint8_t op2, uint8_t op3, uint8_t op4);