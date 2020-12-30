# Set the working dir, where all compiled Verilog goes.
vlib work

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns part3.v

# Load simulation using mux as the top level simulation module.
vsim mux

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

# First test case
# there would have 0
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
# Run simulation for a few ns.
run 10ns

# there would have 1
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
# Run simulation for a few ns.
run 10ns

# there would have 2
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
# Run simulation for a few ns.
run 10ns

# there would have 3
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
# Run simulation for a few ns.
run 10ns

# there would have 4
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
# Run simulation for a few ns.
run 10ns

# there would have 5
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
# Run simulation for a few ns.
run 10ns

# there would have 6
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
# Run simulation for a few ns.
run 10ns

# there would have 7
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
# Run simulation for a few ns.
run 10ns

# there would have 8
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
# Run simulation for a few ns.
run 10ns

# there would have 9
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
# Run simulation for a few ns.
run 10ns

# there would have A
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
# Run simulation for a few ns.
run 10ns

# there would have b
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
# Run simulation for a few ns.
run 10ns

# there would have C
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
# Run simulation for a few ns.
run 10ns

# there would have d
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
# Run simulation for a few ns.
run 10ns

# there would have E
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
# Run simulation for a few ns.
run 10ns

# there would have F
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
# Run simulation for a few ns.
run 10ns