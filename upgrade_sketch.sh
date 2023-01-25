#!/usr/bin/env bash
echo "Setting environment variables"
cd ardas/
echo "export CMAKE_CURRENT_SOURCE_DIR=$pwd" >> ~/.bashrc

cd arduino_sketch/
echo "export CMAKE_SOURCE_DIR=$pwd" > ~/.bashrc

source ~/.bashrc


rm -rf build
mkdir build
cd build
cmake ..
make
make upload
