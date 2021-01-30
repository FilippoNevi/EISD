# Restart the simulation (and ignore confirmation message).
restart

# Setup the clock signal behavior.
# @0ns   clk = 0
# @50ns  clk = 1
# @100ns clk = 0
# @150ns clk = 1
# ...
# N.B. -r 100 stays for "repeat this behavior every 100 time units"
add_force clk {0 0ns} {1 50ns} -repeat_every 100ns

# x changes its value on the clock rising edge.
add_force x {0 0ns}
add_force x {1 45ns}
add_force x {0 126ns}
add_force x {1 348ns}
add_force x {0 612ns}

# Run the simulation for 1000ns.
run 1000ns
