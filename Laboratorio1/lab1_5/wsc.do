project compileall
vsim -t ps -novopt work.testcount(test)
add wave *
power add /testcount/UCOUNTER1/*
run 518 ns
power report -file report_power_lab1_5_2ns.txt
