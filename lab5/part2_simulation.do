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


#at the beigining, reset. 0
force {SW[1]} 0
force {SW[0]} 0
force {KEY[0]} 0
force {CLOCK_50} 0 0, 1 10 -repeat 20
run 20ns

#start. 
force {SW[1]} 0
force {SW[0]} 0
force {KEY[0]} 1
force {CLOCK_50} 0 0, 1 10 -repeat 20
run 20ns

#reset, frequency to 1Hz. 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[0]} 0
force {CLOCK_50} 0 0, 1 10 -repeat 20
run 20ns

#begin to change
force {SW[1]} 0
force {SW[0]} 1
force {KEY[0]} 1
force {CLOCK_50} 0 0, 1 10 -repeat 20
run 1000ns


