#!/usr/bin/env bash

LLVM_INSTALL_DIR="$HOME/llvm-8/build"

mkdir -p build
BUILD_DIR=$(realpath -L ./build)

cc=$LLVM_INSTALL_DIR/bin/clang
cxx=$LLVM_INSTALL_DIR/bin/clang++

cmake -S . -B $BUILD_DIR -G "Unix Makefiles"              \
    -DLLVM_DIR=${LLVM_INSTALL_DIR}/lib/cmake/llvm   \
    -DLLVM_INSTALL_DIR=$LLVM_INSTALL_DIR \
    -DCMAKE_C_COMPILER=$cc                      \
    -DCMAKE_CXX_COMPILER=$cxx                   \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .

cd build
cmake --build .