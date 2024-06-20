#! /bin/bash


if [ $# -lt 1 ]
then
    echo Syntax: ./runDCE.sh file.c
    exit 1
else
    LLVM_INSTALL_DIR="/usr/lib/llvm-8/build"
    suffix=".dylib"
    if [[$("uname -s") == "Linux" ]]; then
        suffix=".so"
    fi

    CLANG=$LLVM_INSTALL_DIR/Release/bin/clang
    OPT=$LLVM_INSTALL_DIR/Release/bin/opt
    DCE_LIB="/lib/DeadCodeElimination${suffix}"

    file_name=$1
    base_name=$(basename $1 .c)
    program_ll="$base_name.ll"
    

    $CLANG -Xclang -disable-O0-optnone -S -emit-llvm $1 -o $INPUT_IR
    $OPT -instnamer -mem2reg -break-crit-edges -S $INPUT_IR -o $INPUT_IR
    $OPT -load build/lib/libDeadCodeElimination.so -vssa -S $INPUT_IR -o $INPUT_IR
    $OPT -dot-cfg $INPUT_IR -cfg-dot-filename-prefix=./input/before -disable-output

    $OPT -stats -load build/lib/libDeadCodeElimination.so -dead-code-elimination -S $INPUT_IR -o $INPUT_IR
    $OPT -dot-cfg $INPUT_IR -cfg-dot-filename-prefix=./input/after -disable-output
fi