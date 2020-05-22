project compileall
vsim -t ns -novopt work.testbench
power add *
add wave *
run 100 us
power report -file lab4_1_data_power_report.txt
