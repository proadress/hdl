transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/A610/Desktop/mi/mid_A/design {C:/Users/A610/Desktop/mi/mid_A/design/DE0_CV.sv}

