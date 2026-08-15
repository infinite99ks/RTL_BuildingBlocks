vlib work
vlog seq_tb.v
vsim -voptargs=+acc work.dff_tb
add wave *
run -all