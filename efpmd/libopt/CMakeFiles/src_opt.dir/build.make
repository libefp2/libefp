# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /apps/spack/bell/apps/cmake/3.18.2-gcc-10.2.0-z3hxs65/bin/cmake

# The command to remove a file.
RM = /apps/spack/bell/apps/cmake/3.18.2-gcc-10.2.0-z3hxs65/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /scratch/bell/paulsk/tstefp/libefp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /scratch/bell/paulsk/tstefp/libefp

# Include any dependencies generated for this target.
include efpmd/libopt/CMakeFiles/src_opt.dir/depend.make

# Include the progress variables for this target.
include efpmd/libopt/CMakeFiles/src_opt.dir/progress.make

# Include the compile flags for this target's objects.
include efpmd/libopt/CMakeFiles/src_opt.dir/flags.make

efpmd/libopt/CMakeFiles/src_opt.dir/opt.c.o: efpmd/libopt/CMakeFiles/src_opt.dir/flags.make
efpmd/libopt/CMakeFiles/src_opt.dir/opt.c.o: efpmd/libopt/opt.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/scratch/bell/paulsk/tstefp/libefp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object efpmd/libopt/CMakeFiles/src_opt.dir/opt.c.o"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/src_opt.dir/opt.c.o -c /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/opt.c

efpmd/libopt/CMakeFiles/src_opt.dir/opt.c.i: cmake_force
	@echo "Preprocessing C source to CMakeFiles/src_opt.dir/opt.c.i"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/opt.c > CMakeFiles/src_opt.dir/opt.c.i

efpmd/libopt/CMakeFiles/src_opt.dir/opt.c.s: cmake_force
	@echo "Compiling C source to assembly CMakeFiles/src_opt.dir/opt.c.s"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/opt.c -o CMakeFiles/src_opt.dir/opt.c.s

efpmd/libopt/CMakeFiles/src_opt.dir/blas.f.o: efpmd/libopt/CMakeFiles/src_opt.dir/flags.make
efpmd/libopt/CMakeFiles/src_opt.dir/blas.f.o: efpmd/libopt/blas.f
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/scratch/bell/paulsk/tstefp/libefp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building Fortran object efpmd/libopt/CMakeFiles/src_opt.dir/blas.f.o"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/blas.f -o CMakeFiles/src_opt.dir/blas.f.o

efpmd/libopt/CMakeFiles/src_opt.dir/blas.f.i: cmake_force
	@echo "Preprocessing Fortran source to CMakeFiles/src_opt.dir/blas.f.i"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/blas.f > CMakeFiles/src_opt.dir/blas.f.i

efpmd/libopt/CMakeFiles/src_opt.dir/blas.f.s: cmake_force
	@echo "Compiling Fortran source to assembly CMakeFiles/src_opt.dir/blas.f.s"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/blas.f -o CMakeFiles/src_opt.dir/blas.f.s

efpmd/libopt/CMakeFiles/src_opt.dir/lbfgsb.f.o: efpmd/libopt/CMakeFiles/src_opt.dir/flags.make
efpmd/libopt/CMakeFiles/src_opt.dir/lbfgsb.f.o: efpmd/libopt/lbfgsb.f
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/scratch/bell/paulsk/tstefp/libefp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building Fortran object efpmd/libopt/CMakeFiles/src_opt.dir/lbfgsb.f.o"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/lbfgsb.f -o CMakeFiles/src_opt.dir/lbfgsb.f.o

efpmd/libopt/CMakeFiles/src_opt.dir/lbfgsb.f.i: cmake_force
	@echo "Preprocessing Fortran source to CMakeFiles/src_opt.dir/lbfgsb.f.i"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/lbfgsb.f > CMakeFiles/src_opt.dir/lbfgsb.f.i

efpmd/libopt/CMakeFiles/src_opt.dir/lbfgsb.f.s: cmake_force
	@echo "Compiling Fortran source to assembly CMakeFiles/src_opt.dir/lbfgsb.f.s"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/lbfgsb.f -o CMakeFiles/src_opt.dir/lbfgsb.f.s

efpmd/libopt/CMakeFiles/src_opt.dir/linpack.f.o: efpmd/libopt/CMakeFiles/src_opt.dir/flags.make
efpmd/libopt/CMakeFiles/src_opt.dir/linpack.f.o: efpmd/libopt/linpack.f
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/scratch/bell/paulsk/tstefp/libefp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building Fortran object efpmd/libopt/CMakeFiles/src_opt.dir/linpack.f.o"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/linpack.f -o CMakeFiles/src_opt.dir/linpack.f.o

efpmd/libopt/CMakeFiles/src_opt.dir/linpack.f.i: cmake_force
	@echo "Preprocessing Fortran source to CMakeFiles/src_opt.dir/linpack.f.i"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/linpack.f > CMakeFiles/src_opt.dir/linpack.f.i

efpmd/libopt/CMakeFiles/src_opt.dir/linpack.f.s: cmake_force
	@echo "Compiling Fortran source to assembly CMakeFiles/src_opt.dir/linpack.f.s"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/linpack.f -o CMakeFiles/src_opt.dir/linpack.f.s

efpmd/libopt/CMakeFiles/src_opt.dir/timer.f.o: efpmd/libopt/CMakeFiles/src_opt.dir/flags.make
efpmd/libopt/CMakeFiles/src_opt.dir/timer.f.o: efpmd/libopt/timer.f
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/scratch/bell/paulsk/tstefp/libefp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building Fortran object efpmd/libopt/CMakeFiles/src_opt.dir/timer.f.o"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/timer.f -o CMakeFiles/src_opt.dir/timer.f.o

efpmd/libopt/CMakeFiles/src_opt.dir/timer.f.i: cmake_force
	@echo "Preprocessing Fortran source to CMakeFiles/src_opt.dir/timer.f.i"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/timer.f > CMakeFiles/src_opt.dir/timer.f.i

efpmd/libopt/CMakeFiles/src_opt.dir/timer.f.s: cmake_force
	@echo "Compiling Fortran source to assembly CMakeFiles/src_opt.dir/timer.f.s"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/timer.f -o CMakeFiles/src_opt.dir/timer.f.s

# Object files for target src_opt
src_opt_OBJECTS = \
"CMakeFiles/src_opt.dir/opt.c.o" \
"CMakeFiles/src_opt.dir/blas.f.o" \
"CMakeFiles/src_opt.dir/lbfgsb.f.o" \
"CMakeFiles/src_opt.dir/linpack.f.o" \
"CMakeFiles/src_opt.dir/timer.f.o"

# External object files for target src_opt
src_opt_EXTERNAL_OBJECTS =

efpmd/libopt/libsrc_opt.a: efpmd/libopt/CMakeFiles/src_opt.dir/opt.c.o
efpmd/libopt/libsrc_opt.a: efpmd/libopt/CMakeFiles/src_opt.dir/blas.f.o
efpmd/libopt/libsrc_opt.a: efpmd/libopt/CMakeFiles/src_opt.dir/lbfgsb.f.o
efpmd/libopt/libsrc_opt.a: efpmd/libopt/CMakeFiles/src_opt.dir/linpack.f.o
efpmd/libopt/libsrc_opt.a: efpmd/libopt/CMakeFiles/src_opt.dir/timer.f.o
efpmd/libopt/libsrc_opt.a: efpmd/libopt/CMakeFiles/src_opt.dir/build.make
efpmd/libopt/libsrc_opt.a: efpmd/libopt/CMakeFiles/src_opt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/scratch/bell/paulsk/tstefp/libefp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking Fortran static library libsrc_opt.a"
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && $(CMAKE_COMMAND) -P CMakeFiles/src_opt.dir/cmake_clean_target.cmake
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/src_opt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
efpmd/libopt/CMakeFiles/src_opt.dir/build: efpmd/libopt/libsrc_opt.a

.PHONY : efpmd/libopt/CMakeFiles/src_opt.dir/build

efpmd/libopt/CMakeFiles/src_opt.dir/clean:
	cd /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt && $(CMAKE_COMMAND) -P CMakeFiles/src_opt.dir/cmake_clean.cmake
.PHONY : efpmd/libopt/CMakeFiles/src_opt.dir/clean

efpmd/libopt/CMakeFiles/src_opt.dir/depend:
	cd /scratch/bell/paulsk/tstefp/libefp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /scratch/bell/paulsk/tstefp/libefp /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt /scratch/bell/paulsk/tstefp/libefp /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt /scratch/bell/paulsk/tstefp/libefp/efpmd/libopt/CMakeFiles/src_opt.dir/DependInfo.cmake
.PHONY : efpmd/libopt/CMakeFiles/src_opt.dir/depend

