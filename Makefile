# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/joaovam/llvm-project/llvm/lib/Transforms/Dead-Code-Elimination

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/joaovam/llvm-project/llvm/lib/Transforms/Dead-Code-Elimination

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/joaovam/llvm-project/llvm/lib/Transforms/Dead-Code-Elimination/CMakeFiles /home/joaovam/llvm-project/llvm/lib/Transforms/Dead-Code-Elimination//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/joaovam/llvm-project/llvm/lib/Transforms/Dead-Code-Elimination/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named intrinsics_gen

# Build rule for target.
intrinsics_gen: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 intrinsics_gen
.PHONY : intrinsics_gen

# fast build rule for target.
intrinsics_gen/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/intrinsics_gen.dir/build.make CMakeFiles/intrinsics_gen.dir/build
.PHONY : intrinsics_gen/fast

#=============================================================================
# Target rules for targets named omp_gen

# Build rule for target.
omp_gen: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 omp_gen
.PHONY : omp_gen

# fast build rule for target.
omp_gen/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/omp_gen.dir/build.make CMakeFiles/omp_gen.dir/build
.PHONY : omp_gen/fast

#=============================================================================
# Target rules for targets named acc_gen

# Build rule for target.
acc_gen: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 acc_gen
.PHONY : acc_gen

# fast build rule for target.
acc_gen/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/acc_gen.dir/build.make CMakeFiles/acc_gen.dir/build
.PHONY : acc_gen/fast

#=============================================================================
# Target rules for targets named DeadCodeElimination

# Build rule for target.
DeadCodeElimination: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 DeadCodeElimination
.PHONY : DeadCodeElimination

# fast build rule for target.
DeadCodeElimination/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/DeadCodeElimination.dir/build.make CMakeFiles/DeadCodeElimination.dir/build
.PHONY : DeadCodeElimination/fast

lib/DeadCodeElimination/ClientRA.o: lib/DeadCodeElimination/ClientRA.cpp.o
.PHONY : lib/DeadCodeElimination/ClientRA.o

# target to build an object file
lib/DeadCodeElimination/ClientRA.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/DeadCodeElimination.dir/build.make CMakeFiles/DeadCodeElimination.dir/lib/DeadCodeElimination/ClientRA.cpp.o
.PHONY : lib/DeadCodeElimination/ClientRA.cpp.o

lib/DeadCodeElimination/ClientRA.i: lib/DeadCodeElimination/ClientRA.cpp.i
.PHONY : lib/DeadCodeElimination/ClientRA.i

# target to preprocess a source file
lib/DeadCodeElimination/ClientRA.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/DeadCodeElimination.dir/build.make CMakeFiles/DeadCodeElimination.dir/lib/DeadCodeElimination/ClientRA.cpp.i
.PHONY : lib/DeadCodeElimination/ClientRA.cpp.i

lib/DeadCodeElimination/ClientRA.s: lib/DeadCodeElimination/ClientRA.cpp.s
.PHONY : lib/DeadCodeElimination/ClientRA.s

# target to generate assembly for a file
lib/DeadCodeElimination/ClientRA.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/DeadCodeElimination.dir/build.make CMakeFiles/DeadCodeElimination.dir/lib/DeadCodeElimination/ClientRA.cpp.s
.PHONY : lib/DeadCodeElimination/ClientRA.cpp.s

lib/DeadCodeElimination/DeadCodeElimination.o: lib/DeadCodeElimination/DeadCodeElimination.cpp.o
.PHONY : lib/DeadCodeElimination/DeadCodeElimination.o

# target to build an object file
lib/DeadCodeElimination/DeadCodeElimination.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/DeadCodeElimination.dir/build.make CMakeFiles/DeadCodeElimination.dir/lib/DeadCodeElimination/DeadCodeElimination.cpp.o
.PHONY : lib/DeadCodeElimination/DeadCodeElimination.cpp.o

lib/DeadCodeElimination/DeadCodeElimination.i: lib/DeadCodeElimination/DeadCodeElimination.cpp.i
.PHONY : lib/DeadCodeElimination/DeadCodeElimination.i

# target to preprocess a source file
lib/DeadCodeElimination/DeadCodeElimination.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/DeadCodeElimination.dir/build.make CMakeFiles/DeadCodeElimination.dir/lib/DeadCodeElimination/DeadCodeElimination.cpp.i
.PHONY : lib/DeadCodeElimination/DeadCodeElimination.cpp.i

lib/DeadCodeElimination/DeadCodeElimination.s: lib/DeadCodeElimination/DeadCodeElimination.cpp.s
.PHONY : lib/DeadCodeElimination/DeadCodeElimination.s

# target to generate assembly for a file
lib/DeadCodeElimination/DeadCodeElimination.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/DeadCodeElimination.dir/build.make CMakeFiles/DeadCodeElimination.dir/lib/DeadCodeElimination/DeadCodeElimination.cpp.s
.PHONY : lib/DeadCodeElimination/DeadCodeElimination.cpp.s

lib/DeadCodeElimination/RangeAnalysis.o: lib/DeadCodeElimination/RangeAnalysis.cpp.o
.PHONY : lib/DeadCodeElimination/RangeAnalysis.o

# target to build an object file
lib/DeadCodeElimination/RangeAnalysis.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/DeadCodeElimination.dir/build.make CMakeFiles/DeadCodeElimination.dir/lib/DeadCodeElimination/RangeAnalysis.cpp.o
.PHONY : lib/DeadCodeElimination/RangeAnalysis.cpp.o

lib/DeadCodeElimination/RangeAnalysis.i: lib/DeadCodeElimination/RangeAnalysis.cpp.i
.PHONY : lib/DeadCodeElimination/RangeAnalysis.i

# target to preprocess a source file
lib/DeadCodeElimination/RangeAnalysis.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/DeadCodeElimination.dir/build.make CMakeFiles/DeadCodeElimination.dir/lib/DeadCodeElimination/RangeAnalysis.cpp.i
.PHONY : lib/DeadCodeElimination/RangeAnalysis.cpp.i

lib/DeadCodeElimination/RangeAnalysis.s: lib/DeadCodeElimination/RangeAnalysis.cpp.s
.PHONY : lib/DeadCodeElimination/RangeAnalysis.s

# target to generate assembly for a file
lib/DeadCodeElimination/RangeAnalysis.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/DeadCodeElimination.dir/build.make CMakeFiles/DeadCodeElimination.dir/lib/DeadCodeElimination/RangeAnalysis.cpp.s
.PHONY : lib/DeadCodeElimination/RangeAnalysis.cpp.s

lib/DeadCodeElimination/vSSA.o: lib/DeadCodeElimination/vSSA.cpp.o
.PHONY : lib/DeadCodeElimination/vSSA.o

# target to build an object file
lib/DeadCodeElimination/vSSA.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/DeadCodeElimination.dir/build.make CMakeFiles/DeadCodeElimination.dir/lib/DeadCodeElimination/vSSA.cpp.o
.PHONY : lib/DeadCodeElimination/vSSA.cpp.o

lib/DeadCodeElimination/vSSA.i: lib/DeadCodeElimination/vSSA.cpp.i
.PHONY : lib/DeadCodeElimination/vSSA.i

# target to preprocess a source file
lib/DeadCodeElimination/vSSA.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/DeadCodeElimination.dir/build.make CMakeFiles/DeadCodeElimination.dir/lib/DeadCodeElimination/vSSA.cpp.i
.PHONY : lib/DeadCodeElimination/vSSA.cpp.i

lib/DeadCodeElimination/vSSA.s: lib/DeadCodeElimination/vSSA.cpp.s
.PHONY : lib/DeadCodeElimination/vSSA.s

# target to generate assembly for a file
lib/DeadCodeElimination/vSSA.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/DeadCodeElimination.dir/build.make CMakeFiles/DeadCodeElimination.dir/lib/DeadCodeElimination/vSSA.cpp.s
.PHONY : lib/DeadCodeElimination/vSSA.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... acc_gen"
	@echo "... intrinsics_gen"
	@echo "... omp_gen"
	@echo "... DeadCodeElimination"
	@echo "... lib/DeadCodeElimination/ClientRA.o"
	@echo "... lib/DeadCodeElimination/ClientRA.i"
	@echo "... lib/DeadCodeElimination/ClientRA.s"
	@echo "... lib/DeadCodeElimination/DeadCodeElimination.o"
	@echo "... lib/DeadCodeElimination/DeadCodeElimination.i"
	@echo "... lib/DeadCodeElimination/DeadCodeElimination.s"
	@echo "... lib/DeadCodeElimination/RangeAnalysis.o"
	@echo "... lib/DeadCodeElimination/RangeAnalysis.i"
	@echo "... lib/DeadCodeElimination/RangeAnalysis.s"
	@echo "... lib/DeadCodeElimination/vSSA.o"
	@echo "... lib/DeadCodeElimination/vSSA.i"
	@echo "... lib/DeadCodeElimination/vSSA.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

