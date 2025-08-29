#!/bin/bash

# clean up
rm -rf build
mkdir build
cd build

ARG1=$1

if [ "$ARG1" = "sanitized" ]; then
    echo "Compiling Pcap++ library with AddressSanitizer..."
	cmake -DPCAPPP_BUILD_TESTS=OFF -DPCAPPP_BUILD_EXAMPLES=OFF -DPCAPPP_USE_SANITIZER=AddressSanitizer ..
else
    echo "Compiling Pcap++ library..."
	cmake -DPCAPPP_BUILD_TESTS=OFF -DPCAPPP_BUILD_EXAMPLES=OFF ..
fi
make VERBOSE=1

echo "Compiling Pcap++ library..."
sudo make install

# clean up
cd ..
rm -rf build

echo "Done!"