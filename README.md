# Dead-Code-Elimination

Is a tool that eliminates non-obvious dead code based on range analysis. The source code is located in the lib directory and the tests in tests.

## How to use

In order to compile the code one can use the ``build.sh`` script, remember to change the tool paths in the script,the default values are:

```bash
LLVM_INSTALL_DIR=/usr/lib/llvm-8/build
cc=/usr/bin/clang
cxx=/usr/bin/clang++
```

To run the optimization use ``runDCE.sh``, you only need to pass the path to the c program you want to optimize, the outputs will be saved as dot files inside the tests dir. the files create will have the following structure: ``PHASE.FUNCTION.dot``, where PHASE will be before the analysis or after and FUNCTION the name of the optimized function.

There are already some tests and its outputs in the tests directory.
