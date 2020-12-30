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

#01010101, reset, Load_n will be 0, so the output will be 00000000.
force {SW[7]} 0
force {SW[6]} 1
force {SW[5]} 0
force {SW[4]} 1
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 1
force {SW[9]} 0
force {KEY[3]} 0
force {KEY[2]} 0
force {KEY[1]} 0
force {KEY[0]} 0 0, 1 5 -repeat 10
run 10ns 
#0

#01010101, Load_n will be 0, so the output will be 01010101.
force {SW[7]} 0
force {SW[6]} 1
force {SW[5]} 0
force {SW[4]} 1
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 1
force {SW[9]} 1
force {KEY[3]} 0
force {KEY[2]} 0
force {KEY[1]} 0
force {KEY[0]} 0 0, 1 5 -repeat 10
run 10ns 
#0

#01010101, Load_n will be 1 and ShiftRight will be 0
#so the output keeps 01010101.
force {SW[7]} 0
force {SW[6]} 1
force {SW[5]} 0
force {SW[4]} 1
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 1
force {SW[9]} 1
force {KEY[3]} 0
force {KEY[2]} 0
force {KEY[1]} 1
force {KEY[0]} 0 0, 1 5 -repeat 10
run 10ns
#10

#01011111, Load_n will be 1 and ShiftRight will be 0
#so the output keeps 01010101.
force {SW[7]} 0
force {SW[6]} 1
force {SW[5]} 0
force {SW[4]} 1
force {SW[3]} 1
force {SW[2]} 1
force {SW[1]} 1
force {SW[0]} 1
force {SW[9]} 1
force {KEY[3]} 0
force {KEY[2]} 0
force {KEY[1]} 1
force {KEY[0]} 0 0, 1 5 -repeat 10
run 10ns
#20

#01010101, Load_n will be 1 and ShiftRight will be 1 and ASR be 0
#so the output will be 01010101, 00101010, 00010101, 00001010...
force {SW[7]} 0
force {SW[6]} 1
force {SW[5]} 0
force {SW[4]} 1
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 1
force {SW[9]} 1
force {KEY[3]} 0
force {KEY[2]} 1
force {KEY[1]} 1
force {KEY[0]} 0 0, 1 5 -repeat 10
run 20ns
#60

#11010101, Load_n will be 0, so the output will be 11010101.
force {SW[7]} 1
force {SW[6]} 1
force {SW[5]} 0
force {SW[4]} 1
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 1
force {SW[9]} 1
force {KEY[3]} 0
force {KEY[2]} 0
force {KEY[1]} 0
force {KEY[0]} 0 0, 1 5 -repeat 10
run 20ns 
#80

#11010101, Load_n will be 1 and ShiftRight will be 1 and ASR be 1
#so the output will be 11010101, 01101010, 00110101, 11111010...
force {SW[7]} 1
force {SW[6]} 1
force {SW[5]} 0
force {SW[4]} 1
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 1
force {SW[9]} 1
force {KEY[3]} 1
force {KEY[2]} 1
force {KEY[1]} 1
force {KEY[0]} 0 0, 1 5 -repeat 10
run 20ns
#100




