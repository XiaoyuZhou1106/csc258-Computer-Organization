# Set the working dir, where all compiled Verilog goes.
vlib work

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns part1.v

# Load simulation using mux as the top level simulation module.
vsim sequence_detector

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}


force {KEY[0]} 0 0, 1 5 -repeat 10

#at the beigining, reset. 000, 0
force {SW[0]} 0
force {SW[1]} 0
run 19ns

#begin to run. 0...1
force {SW[0]} 1
force {SW[1]} 1
#force {KEY[0]} 0 0, 1 5 -repeat 10
run 42ns

#begin to run. 0...1
force {SW[0]} 1
force {SW[1]} 0
#force {KEY[0]} 0 0, 1 5 -repeat 10
run 11ns

#begin to run. 0...1
force {SW[0]} 1
force {SW[1]} 1
#force {KEY[0]} 0 0, 1 5 -repeat 10
run 11ns

#begin to run. 0...1
force {SW[0]} 1
force {SW[1]} 0
#force {KEY[0]} 0 0, 1 5 -repeat 10
run 30ns





