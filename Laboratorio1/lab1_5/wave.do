onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /testcount/clk
add wave -noupdate -format Logic /testcount/reset
add wave -noupdate -color Gold -format Logic /testcount/counten
add wave -noupdate -format Logic /testcount/owfl
add wave -noupdate -format Literal -expand /testcount/countout
add wave -noupdate -expand -group c_out_half_adder -color Gold -format Logic /testcount/ucounter1/hadder1__1/hai/co
add wave -noupdate -expand -group c_out_half_adder -format Logic /testcount/ucounter1/hadder1__2/hai/co
add wave -noupdate -expand -group c_out_half_adder -format Logic /testcount/ucounter1/hadder1__3/hai/co
add wave -noupdate -expand -group c_out_half_adder -format Logic /testcount/ucounter1/hadder1__4/hai/co
add wave -noupdate -expand -group c_out_half_adder -format Logic /testcount/ucounter1/hadder1__5/hai/co
add wave -noupdate -expand -group c_out_half_adder -format Logic /testcount/ucounter1/hadder1__6/hai/co
add wave -noupdate -expand -group c_out_half_adder -format Logic /testcount/ucounter1/hadder1__7/hai/co
add wave -noupdate -expand -group c_out_half_adder -format Logic /testcount/ucounter1/hadder1__8/hai/co
add wave -noupdate -expand -group s_half_adder -color Gold -format Logic /testcount/ucounter1/hadder1__1/hai/s
add wave -noupdate -expand -group s_half_adder -format Logic /testcount/ucounter1/hadder1__2/hai/s
add wave -noupdate -expand -group s_half_adder -format Logic /testcount/ucounter1/hadder1__3/hai/s
add wave -noupdate -expand -group s_half_adder -format Logic /testcount/ucounter1/hadder1__4/hai/s
add wave -noupdate -expand -group s_half_adder -format Logic /testcount/ucounter1/hadder1__5/hai/s
add wave -noupdate -expand -group s_half_adder -format Logic /testcount/ucounter1/hadder1__6/hai/s
add wave -noupdate -expand -group s_half_adder -format Logic /testcount/ucounter1/hadder1__7/hai/s
add wave -noupdate -expand -group s_half_adder -format Logic /testcount/ucounter1/hadder1__8/hai/s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7310 ps} 0}
configure wave -namecolwidth 346
configure wave -valuecolwidth 58
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {2 ns} {12070 ps}
