transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/LAB601/Downloads/DE0_CV/design {C:/Users/LAB601/Downloads/DE0_CV/design/adder_4bit.sv}
vlog -sv -work work +incdir+C:/Users/LAB601/Downloads/DE0_CV/design {C:/Users/LAB601/Downloads/DE0_CV/design/DE0_CV.sv}

