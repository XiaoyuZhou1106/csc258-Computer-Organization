# Set the working dir, where all compiled Verilog goes.
vlib work

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns Lab7P2.v

# Load simulation using mux as the top level simulation module.
vsim control
# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

#at the beigining, reset.
force {clk} 0 0, 1 5 -repeat 10
force {ld} 0
force {reset_n} 0
force {draw} 0
run 10ns

force {clk} 0 0, 1 5 -repeat 10
force {ld} 1
force {reset_n} 1
force {draw} 0
run 10ns

force {clk} 0 0, 1 5 -repeat 10
force {ld} 0
force {reset_n} 1
force {draw} 0
run 10ns

force {clk} 0 0, 1 5 -repeat 10
force {ld} 1
force {reset_n} 1
force {draw} 0
run 10ns

force {clk} 0 0, 1 5 -repeat 10
force {ld} 0
force {reset_n} 1
force {draw} 0
run 10ns

force {clk} 0 0, 1 5 -repeat 10
force {ld} 0
force {reset_n} 1
force {draw} 0
run 10ns