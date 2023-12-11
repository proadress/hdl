onerror {quit -f}
vlib work
vlog -work work DE0_test.vo
vlog -work work DE0_test.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.DE0_test_vlg_vec_tst
vcd file -direction DE0_test.msim.vcd
vcd add -internal DE0_test_vlg_vec_tst/*
vcd add -internal DE0_test_vlg_vec_tst/i1/*
add wave /*
run -all