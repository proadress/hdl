#vlib work



# ------------------------------------------------------------
vlog ../tb/testbench.sv
vlog ../../design/adder_4bit.sv
vlog ../../design/mux8to1.sv
vlog ../../design/DE0_CV.sv
vlog ../../design/alu.sv
vlog ../../design/counter_4bit.sv
vlog ../../design/counter_24hr.sv
vlog ../../design/counter_register.sv
vlog ../../design/fsm_ryg.sv
# ------------------------------------------------------------
do sim.do
   
