#!/bin/bash -e
mkdir -p build
if [ ! -e build/s2geometry ]; then
 wget https://github.com/google/s2geometry/archive/v0.9.0.zip
 unzip v0.9.0.zip -d build && rm v0.9.0.zip
 mv build/s2geometry-0.9.0 build/s2geometry
fi
cp Makefile k.cc build/s2geometry/src/
if [ ! -f build/s2geometry/src/k.h ]; then
 wget -O build/s2geometry/src/k.h https://raw.githubusercontent.com/KxSystems/kdb/master/c/c/k.h
fi
cd build/s2geometry/src
rm -f s2.so k.o
make

