#!/bin/bash

if [$1 == ""];
then
echo "Usage: pow_rep.sh run_time_in_ns filename"

else

vsim power add *
vsim run $1 ns
vsim power report -file $2

fi

