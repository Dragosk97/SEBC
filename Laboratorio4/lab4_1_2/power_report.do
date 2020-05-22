vsim -t ns -novopt work.testbench
power add *
run 100 us
power report -file lab4_1_2_"$1"_power_report.txt
