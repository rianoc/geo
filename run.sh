#!/bin/bash -e
cd build/s2geometry/src
q ../../../q/geo.q &
QPID=$!
echo "QPID $QPID"
sleep 1
xdg-open ../../../html/geo.html
