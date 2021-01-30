#include "ap_fixed.h"

void mult(ap_fixed<16,8,AP_RND> a, ap_fixed<16,8,AP_RND> b, ap_fixed<32,16,AP_RND> &product) {
	product = a*b;
}
