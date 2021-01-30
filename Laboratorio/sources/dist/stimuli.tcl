
set clockPeriod 20ns

proc StoreImage {} {
	
	set data 0

	for {set i 0}  {$i < 120} {incr i} {

		set data [expr ($i << 24) + ($i <<16) + ($i << 8);];
		set addr [expr $i*4]
		add_force din -radix dec $data
		add_force addr -radix dec $addr
		add_force din_rdy 1 
		add_force db_mode 1

		while {[get_value dout_rdy] == 0} {
			run 20ns 
		}
		
		run 20ns
	}

}

add_force clk {1 0ns} {0 10ns} -repeat_every 20ns
StoreImage
