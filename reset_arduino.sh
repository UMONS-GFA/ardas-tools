#!/usr/bin/env bash
cd ardas/arduino_reset
rm -rf build
mkdir build
cd build
cmake ..
make
make upload
