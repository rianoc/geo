#!/bin/bash -e
mkdir -p build
cp -r q s2 build/
cp Makefile k.h k.cc build/s2/
find build -name "*.o" -exec rm -rf {} \;
find build -name "*.so" -exec rm -rf {} \;
cd build/s2
make

