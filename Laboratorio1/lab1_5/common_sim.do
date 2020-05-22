#usage: common_sim.do res ent arch runtime
project compileall
vsim -t "$1" -novopt work."$2"("$3")
add wave *
run "$4" ns
