transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/code/hdl/DE0_CV_mid/design {D:/code/hdl/DE0_CV_mid/design/Stack.sv}
vlog -sv -work work +incdir+D:/code/hdl/DE0_CV_mid/design {D:/code/hdl/DE0_CV_mid/design/single_port_ram_128x8.sv}
vlog -sv -work work +incdir+D:/code/hdl/DE0_CV_mid/design {D:/code/hdl/DE0_CV_mid/design/top.sv}
vlog -sv -work work +incdir+D:/code/hdl/DE0_CV_mid/design {D:/code/hdl/DE0_CV_mid/design/Program_Rom.sv}
vlog -sv -work work +incdir+D:/code/hdl/DE0_CV_mid/design {D:/code/hdl/DE0_CV_mid/design/DE0_CV.sv}

