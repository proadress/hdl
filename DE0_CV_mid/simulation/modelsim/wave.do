onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {TOP LEVEL INPUTS}
add wave -noupdate -divider cpu
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/rst
add wave -noupdate -radix hexadecimal /testbench/w_q
add wave -noupdate -radix unsigned /testbench/top1/ps
add wave -noupdate -radix hexadecimal /testbench/top1/prog_data
add wave -noupdate -radix hexadecimal /testbench/top1/ir_q
add wave -noupdate -radix hexadecimal /testbench/top1/ram_out
add wave -noupdate -radix unsigned /testbench/top1/op
add wave -noupdate -radix binary /testbench/top1/CLRF
add wave -noupdate -radix binary /testbench/top1/CLRW
add wave -noupdate -radix binary /testbench/top1/MOVLW
add wave -noupdate -radix binary /testbench/top1/ADDWF
add wave -noupdate -radix binary /testbench/top1/ADDLW
add wave -noupdate -radix binary /testbench/top1/GOTO

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {139 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {143 ps}
