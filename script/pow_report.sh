#!/bin/bash

if [$1 == ""];
then
echo "Usage: pow_rep.sh run_time filename"

else

power add *
run $1 ns
power report -file $2

fi

