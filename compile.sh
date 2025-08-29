#!/bin/bash

rm -rf build
mkdir build
cd build
cmake -DPCAPPP_BUILD_TESTS=OFF ..
make VERBOSE=1
cd ..