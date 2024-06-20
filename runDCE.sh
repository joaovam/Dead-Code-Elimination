#! /bin/bash


if [ $# -lt 1 ]
then
    echo Syntax: ./runDCE.sh file.c
    exit 1
else
    LLVM_INSTALL_DIR="/usr/lib/llvm-8/build"
    suffix=".so"

    CLANG=$LLVM_INSTALL_DIR/Release/bin/clang
    OPT=$LLVM_INSTALL_DIR/Release/bin/opt
    DCE_LIB="lib/libDeadCodeElimination${suffix}"

    file_name=$1
    base_name=$(basename $1 .c)
    program_ll="$base_name.ll"
    

    $CLANG -Xclang -disable-O0-optnone -S -emit-llvm $1 -o $program_ll
    $OPT -instnamer -mem2reg -break-crit-edges -S $program_ll -o $program_ll
    $OPT -load $DCE_LIB -vssa -S $program_ll -o $program_ll
    $OPT -dot-cfg $program_ll -cfg-dot-filename-prefix=./tests/before -disable-output

    $OPT -stats -load $DCE_LIB -dead-code-elimination -S $program_ll -o $program_ll
    $OPT -dot-cfg $program_ll -cfg-dot-filename-prefix=./tests/after -disable-output
fi