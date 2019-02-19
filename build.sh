#!/bin/bash -e
mkdir -p build
if [ ! -e build/s2geometry ]; then
 git clone https://github.com/google/s2geometry.git build/s2geometry
fi
cp Makefile k.cc build/s2geometry/src/
if [ ! -f build/s2geometry/src/k.h ]; then
 wget -O build/s2geometry/src/k.h https://raw.githubusercontent.com/KxSystems/kdb/master/c/c/k.h
fi
cd build/s2geometry/src
rm -f s2.so k.o
make

