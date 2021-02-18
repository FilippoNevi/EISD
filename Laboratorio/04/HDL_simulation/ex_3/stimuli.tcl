# Restart the simulation (and ignore confirmation message).
restart

# E changes its value at t = 5 ns
add_force D {0 0ns}
add_force D {1 5ns}

# Run the simulation for 200 ns.
run 200ns