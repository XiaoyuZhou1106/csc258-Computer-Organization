# Set the working dir, where all compiled Verilog goes.
vlib work

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns Lab7P2.v

# Load simulation using mux as the top level simulation module.
vsim datapath
# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

#at the beigining, reset.
force {clk} 0 0, 1 5 -repeat 10
force {temp_x} 0
force {temp_y} 0
force {temp_c} 0
force {reset_n} 0
force {go} 0
force {position[6]} 1
force {position[5]} 1
force {position[4]} 1
force {position[3]} 1
force {position[2]} 1
force {position[1]} 1
force {position[0]} 1
force {color_in[2]} 1
force {color_in[1]} 1
force {color_in[0]} 1
run 10ns


force {clk} 0 0, 1 5 -repeat 10
force {temp_x} 1
force {temp_y} 0
force {temp_c} 0
force {reset_n} 1
force {go} 1
force {position[6]} 0
force {position[5]} 0
force {position[4]} 1
force {position[3]} 0
force {position[2]} 1
force {position[1]} 1
force {position[0]} 1
force {color_in[2]} 0
force {color_in[1]} 0
force {color_in[0]} 0
run 10ns

force {clk} 0 0, 1 5 -repeat 10
force {temp_x} 0
force {temp_y} 1
force {temp_c} 0
force {reset_n} 1
force {go} 0
force {position[6]} 0
force {position[5]} 1
force {position[4]} 1
force {position[3]} 0
force {position[2]} 1
force {position[1]} 0
force {position[0]} 0
force {color_in[2]} 0
force {color_in[1]} 0
force {color_in[0]} 0
run 10ns

force {clk} 0 0, 1 5 -repeat 10
force {temp_x} 0
force {temp_y} 0
force {temp_c} 1
force {reset_n} 1
force {go} 0
force {position[6]} 0
force {position[5]} 0
force {position[4]} 0
force {position[3]} 0
force {position[2]} 0
force {position[1]} 0
force {position[0]} 0
force {color_in[2]} 0
force {color_in[1]} 1
force {color_in[0]} 0
run 10ns