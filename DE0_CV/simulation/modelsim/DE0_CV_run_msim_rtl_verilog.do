transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/A610/Desktop/hdl/DE0_CV/design {C:/Users/A610/Desktop/hdl/DE0_CV/design/counter_register2.sv}
vlog -sv -work work +incdir+C:/Users/A610/Desktop/hdl/DE0_CV/design {C:/Users/A610/Desktop/hdl/DE0_CV/design/counter_8bit.sv}
vlog -sv -work work +incdir+C:/Users/A610/Desktop/hdl/DE0_CV/design {C:/Users/A610/Desktop/hdl/DE0_CV/design/DE0_CV.sv}

