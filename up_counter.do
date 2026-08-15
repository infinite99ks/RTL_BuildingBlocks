vlib work
vlog up_counter.v up_counter_tb.v
vsim -voptargs=+acc work.up_counter_tb
add wave *
run -all