# Set the working dir, where all compiled Verilog goes.
vlib work

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns part2.v

# Load simulation using mux as the top level simulation module.
vsim mux

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}


#All outputs are 0.
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[8]} 0
# Run simulation for a few ns.
run 10ns

#1111, 1111 All outputs are 1， 00011110
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[4]} 1
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 1
force {SW[8]} 1
# Run simulation for a few ns.
run 10ns

#1111, 1110 - 00011101
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 1
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 1
force {SW[8]} 1
# Run simulation for a few ns.
run 10ns

#1111, 1100 - 00011011
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 1
force {SW[8]} 1
# Run simulation for a few ns.
run 10ns

#s0 s1 s2 are 0 then other are 1
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 1
force {SW[8]} 1
# Run simulation for a few ns.
run 10ns

#cout is 1 other are 0
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 1
force {SW[8]} 1
# Run simulation for a few ns.
run 10ns

#cout is 0 others are 1
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 1
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 0
force {SW[8]} 1
# Run simulation for a few ns.
run 10ns

#cour and s1 are 1 others are 0
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 1
force {SW[8]} 1
# Run simulation for a few ns.
run 10ns

#cour and s3 are 1 others are 0
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 1
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 1
force {SW[8]} 1
# Run simulation for a few ns.
run 10ns

#s0 and s2 and s3 are 1
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 1
force {SW[8]} 0
# Run simulation for a few ns.
run 10ns
