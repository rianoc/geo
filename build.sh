#!/bin/bash -e
mkdir -p build
if [ ! -e build/s2 ]; then
 cp -r s2 build/ 
fi
cp Makefile k.cc build/s2/
if [ ! -f build/s2/k.h ]; then
 wget -O build/s2/k.h https://raw.githubusercontent.com/KxSystems/kdb/master/c/c/k.h
fi
cd build/s2
rm -f s2.so k.o
make

