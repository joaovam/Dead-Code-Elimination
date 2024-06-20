#! /bin/bash


if [ $# -lt 1 ]
then
    echo Syntax: run_RA file.c
    exit 1
else

    suffix=".dylib"
    if [[$("uname -s") == "Linux" ]]; then
        suffix=".so"
    fi

    CLANG="/usr/bin/clang++"
    OPT="/usr/bin/opt"
    DCE_LIB="/home/joaovam/projects/courses/Dead-Code-Elimination/lib/DeadCodeElimination${suffix}"

    file_name=$1
    base_name=$(basename $1 .c)
    program_ll="$base_name.ll"
    

    # Produce a bytecode file:
    $CLANG $file_name -o $program_ll  -Xclang -disable-O0-optnone -S -emit-llvm

    # Convert the bytecode to SSA form, find nice names for variables and
    # break critical edges:
    $OPT -instnamer -mem2reg -break-crit-edges $program_ll -S -o $program_ll

    # Break live ranges after conditionals to improve precision:
    $OPT -load $DCE_LIB -vssa -dead-code-elimination  -simplifycfg -stats -S -o=$program_ll < $program_ll

    # Producing a dot file for the vssa version of the bytecode file:
    $OPT -dot-cfg $program_ll -disable-output

    # Remove the temporary files produced. We keep the '.s' file if the option
    # -s was passed in the command line.
    
fi