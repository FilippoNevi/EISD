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
add_force x {1 15ns}
add_force x {0 54ns}
add_force x {1 60ns}
add_force x {0 75ns}

add_force x {1 202ns}
add_force x {0 225ns}
add_force x {1 240ns}
add_force x {0 245ns}

add_force x {1 430ns}
add_force x {0 455ns}

add_force x {1 675ns}
add_force x {0 710ns}

# Run the simulation for 1000ns.
run 1000ns
