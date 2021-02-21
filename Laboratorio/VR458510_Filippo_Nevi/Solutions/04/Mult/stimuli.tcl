set clockPeriod 20ns

proc MultStimuli {} {
	set maxVal 11

	for {set i 10} {$i < $maxVal} {incr i} {

		# Operation = (i << 8)+i * (i << 8)+i

		# Set the ports values
		add_force rst 0
		run 10ns
		add_force rst 1
		add_force din_1 -radix dec $i
		add_force din_2 -radix dec $i
		add_force din_3 -radix dec $i
		add_force din_4 -radix dec $i
		add_force din_rdy 1

		# Wait until the output_ready port is False
		while {[get_value dout_rdy] != 1} {
			run 20ns
		}

		# Read the output ports and convert the values in decimal
		set out1_hex [get_value dout_1]
		set out2_hex [get_value dout_2]
		set out3_hex [get_value dout_3]
		set out4_hex [get_value dout_4]
		set out1 [expr 0x$out1_hex]
		set out2 [expr 0x$out2_hex]
		set out3 [expr 0x$out3_hex]
		set out4 [expr 0x$out4_hex]

		# Calculate the fixed-point value of operand1
		set operand1_temp $i
		set operand1_rational 0
		for {set j 8} {$j > 0} {incr j -1} {
			set temp [expr ($operand1_temp & 1)*(1 / double(1 << $j))]
			set temp_val $operand1_rational
			set operand1_rational [expr $temp_val + $temp]
			set temp [expr $operand1_temp >> 1]
			set operand1_temp $temp
		}
		set operand1 [expr double($i) + $operand1_rational]

		# Calculate the fixed-point value of operand2
		set operand2_temp $i
		set operand2_rational 0
		for {set j 8} {$j > 0} {incr j -1} {
			set temp [expr ($operand2_temp & 1)*(1 / double(1 << $j))]
			set temp_val $operand2_rational
			set operand2_rational [expr $temp_val + $temp]
			set temp [expr $operand2_temp >> 1]
			set operand2_temp $temp
		}
		set operand2 [expr double($i) + $operand2_rational]

		# Calculate the fixed-point value of result
		set result_temp [expr ($out3 << 8) + $out4]
		set result_rational 0
		for {set j 16} {$j > 0} {incr j -1} {
			set temp [expr ($result_temp & 1)*(1 / double(1 << $j))]
			set temp_val $result_rational
			set result_rational [expr $temp_val + $temp]
			set temp [expr $result_temp >> 1]
			set result_temp $temp
		}

		set result_integer [expr double($out1 << 8) + $out2]
		set result [expr double($result_integer) + $result_rational]

		# Print the whole operation
		puts "$operand1 * $operand2 = $result"

		run 20ns
	}
}

add_force clk {1 0ns} {0 10ns} -repeat_every $clockPeriod
MultStimuli
