#!/usr/bin/env bash

LLVM_INSTALL_DIR=/usr/lib/llvm-8/build

mkdir -p build
BUILD_DIR=$(realpath -L ./build/)

cc=/usr/bin/clang
cxx=/usr/bin/clang++

echo "$BUILD_DIR"

cmake -S . -B $BUILD_DIR -G "Unix Makefiles"              \
    -DLLVM_DIR=${LLVM_INSTALL_DIR}/lib/cmake/llvm   \
    -DLLVM_INSTALL_DIR=$LLVM_INSTALL_DIR \
    -DCMAKE_C_COMPILER=$cc                      \
    -DCMAKE_CXX_COMPILER=$cxx                   \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .

cd build
cmake --build .