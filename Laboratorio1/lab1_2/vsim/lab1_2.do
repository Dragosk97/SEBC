

vcom vhd/fa.vhd
vcom vhd/rca.vhd
vcom vhd/tb_rca.vhd

vsim -c work.tb_rca

add wave *

power add *

run 100 ns

power report

power report -file pow_report.txt


