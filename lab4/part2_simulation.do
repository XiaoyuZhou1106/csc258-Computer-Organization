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


#A is 0101, at the begining, the output should be 0.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 10ns

#A is 0101, after a second, the output still be 0.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 1
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 20ns

#A is 0101, at the begining, in case 1, the result is 01010101.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 10ns

#A is 0101, after 1 second, in case 1, the result is 01010000.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 1
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 20ns

#A is 0101, at the begining, in case 2, the output should be 00000101.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 0
force {SW[9]} 0
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 10ns

#A is 0101, after 1 second, in case 2, the result is 00001010.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 0
force {SW[9]} 1
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 20ns

#A is 0101, at the begining, in case 3, the output should be 00000101.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 0
force {SW[9]} 0
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 10ns

#A is 0101, after 1 second, in case 3, the result is 00001010.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 0
force {SW[9]} 1
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 20ns

#A is 0101, at the begining, in case 4, the output should be 00000110.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 1
force {SW[9]} 0
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 10ns

#A is 0101, after 1 second, in case 4, the result is 00000110.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 1
force {SW[9]} 1
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 20ns

#A is 0101, at the begining, in case 5, the output should be 1.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 1
force {SW[9]} 0
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 10ns

#A is 0101, after 1 second, in case 5, the result is 1.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 1
force {SW[9]} 1
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 20ns

#A is 0101, at the begining, in case 6, the output should be 0000000.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 1
force {SW[9]} 0
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 10ns

#A is 0101, after 1 second, in case 6, the result is 00000000.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 1
force {SW[9]} 1
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 20ns

#A is 0101, at the begining, in case 7, the output should be 00000000.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 1
force {SW[9]} 0
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 10ns

#A is 0101, after 1 second, in case 7, the result is 00000000.
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 1
force {SW[9]} 1
force {KEY[0]} 0 0, 1 5 -repeat 10
# Run simulation for a few ns.
run 20ns