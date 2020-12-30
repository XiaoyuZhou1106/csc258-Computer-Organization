# Set the working dir, where all compiled Verilog goes.
vlib work

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns part1.v

# Load simulation using mux as the top level simulation module.
vsim mux

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

#SW[0] should control LEDR[0]
force {SW[0]} 0 0, 1 10 -repeat 20
force {SW[1]} 0 0 -repeat 40
force {SW[2]} 0 0 -repeat 40
force {SW[3]} 0 0 -repeat 40
force {SW[4]} 0 0 -repeat 40
force {SW[5]} 0 0 -repeat 40
force {SW[6]} 0 0 -repeat 40
force {SW[9]} 0 0 -repeat 40
force {SW[8]} 0 0 -repeat 40
force {SW[7]} 0 0 -repeat 40
run 40ns

#SW[1] should control LEDR[0]
force {SW[0]} 0 0 -repeat 40
force {SW[1]} 0 0, 1 10 -repeat 20
force {SW[2]} 0 0 -repeat 40
force {SW[3]} 0 0 -repeat 40
force {SW[4]} 0 0 -repeat 40
force {SW[5]} 0 0 -repeat 40
force {SW[6]} 0 0 -repeat 40
force {SW[9]} 0 0 -repeat 40
force {SW[8]} 0 0 -repeat 40
force {SW[7]} 1 0 -repeat 40
run 40ns

#SW[0] should control LEDR[0]
force {SW[0]} 0 0 -repeat 40
force {SW[1]} 0 0 -repeat 40
force {SW[2]} 0 0, 1 10 -repeat 20
force {SW[3]} 0 0 -repeat 40
force {SW[4]} 0 0 -repeat 40
force {SW[5]} 0 0 -repeat 40
force {SW[6]} 0 0 -repeat 40
force {SW[9]} 0 0 -repeat 40
force {SW[8]} 1 0 -repeat 40
force {SW[7]} 1 0 -repeat 40
run 40ns

#SW[0] should control LEDR[0]
force {SW[0]} 0 0 -repeat 40
force {SW[1]} 0 0 -repeat 40
force {SW[2]} 0 0 -repeat 40
force {SW[3]} 0 0, 1 10 -repeat 20
force {SW[4]} 0 0 -repeat 40
force {SW[5]} 0 0 -repeat 40
force {SW[6]} 0 0 -repeat 40
force {SW[9]} 1 0 -repeat 40
force {SW[8]} 0 0 -repeat 40
force {SW[7]} 0 0 -repeat 40
run 40ns

#SW[0] should control LEDR[0]
force {SW[0]} 0 0 -repeat 40
force {SW[1]} 0 0 -repeat 40
force {SW[2]} 0 0 -repeat 40
force {SW[3]} 0 0 -repeat 40
force {SW[4]} 0 0, 1 10 -repeat 20
force {SW[5]} 0 0 -repeat 40
force {SW[6]} 0 0 -repeat 40
force {SW[9]} 1 0 -repeat 40
force {SW[8]} 0 0 -repeat 40
force {SW[7]} 1 0 -repeat 40
run 40ns

#SW[0] should control LEDR[0]
force {SW[0]} 0 0 -repeat 40
force {SW[1]} 0 0 -repeat 40
force {SW[2]} 0 0 -repeat 40
force {SW[3]} 0 0 -repeat 40
force {SW[4]} 0 0 -repeat 40
force {SW[5]} 0 0, 1 10 -repeat 20
force {SW[6]} 0 0 -repeat 40
force {SW[9]} 1 0 -repeat 40
force {SW[8]} 1 0 -repeat 40
force {SW[7]} 0 0 -repeat 40
run 40ns

#SW[0] should control LEDR[0]
force {SW[0]} 0 0 -repeat 40
force {SW[1]} 0 0 -repeat 40
force {SW[2]} 0 0 -repeat 40
force {SW[3]} 0 0 -repeat 40
force {SW[4]} 0 0 -repeat 40
force {SW[5]} 0 0 -repeat 40
force {SW[6]} 0 0, 1 10 -repeat 20
force {SW[9]} 1 0 -repeat 40
force {SW[8]} 1 0 -repeat 40
force {SW[7]} 1 0 -repeat 40
run 40ns