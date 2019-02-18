#!/bin/bash -e
cd build
q ../q/geo.q &
QPID=$!
echo "QPID $QPID"
sleep 1
xdg-open ../html/geo.html
