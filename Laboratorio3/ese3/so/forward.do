# Loads the Synopsys Power Lybrary
# dpfli.so with the routine dpfli_init
# accurary is ps
#
vsim -foreign "dpfli_init ./dpfli.so" work.tbinccomp -t ps

# Reads the Synopsys forward SAIF file...
read_rtl_saif ../power_rtl_forw.saif tbinccomp/uinccomp

# Initializes the toggle count for power
set_net_monitoring_policy rtl_on tbinccomp/uinccomp
set_toggle_region tbinccomp

# Starts simulation a little bit...
run 1ps

# Set toggle on...
toggle_start

# runs the simulation
run 2000ns

# Stops toggle and saves data in backward.saif
toggle_stop
toggle_report ../backward.saif 1e-12 tbinccomp.uinccomp
