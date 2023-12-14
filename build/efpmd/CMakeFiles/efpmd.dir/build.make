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


# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_SOURCE_DIR = /scratch/bell/paulsk/libefp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /scratch/bell/paulsk/libefp/build

# Include any dependencies generated for this target.
include efpmd/CMakeFiles/efpmd.dir/depend.make

# Include the progress variables for this target.
include efpmd/CMakeFiles/efpmd.dir/progress.make

# Include the compile flags for this target's objects.
include efpmd/CMakeFiles/efpmd.dir/flags.make

efpmd/CMakeFiles/efpmd.dir/src/cfg.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/cfg.c.o: ../efpmd/src/cfg.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object efpmd/CMakeFiles/efpmd.dir/src/cfg.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/cfg.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/cfg.c

efpmd/CMakeFiles/efpmd.dir/src/cfg.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/cfg.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/cfg.c > CMakeFiles/efpmd.dir/src/cfg.c.i

efpmd/CMakeFiles/efpmd.dir/src/cfg.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/cfg.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/cfg.c -o CMakeFiles/efpmd.dir/src/cfg.c.s

efpmd/CMakeFiles/efpmd.dir/src/common.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/common.c.o: ../efpmd/src/common.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object efpmd/CMakeFiles/efpmd.dir/src/common.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/common.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/common.c

efpmd/CMakeFiles/efpmd.dir/src/common.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/common.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/common.c > CMakeFiles/efpmd.dir/src/common.c.i

efpmd/CMakeFiles/efpmd.dir/src/common.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/common.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/common.c -o CMakeFiles/efpmd.dir/src/common.c.s

efpmd/CMakeFiles/efpmd.dir/src/efield.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/efield.c.o: ../efpmd/src/efield.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object efpmd/CMakeFiles/efpmd.dir/src/efield.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/efield.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/efield.c

efpmd/CMakeFiles/efpmd.dir/src/efield.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/efield.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/efield.c > CMakeFiles/efpmd.dir/src/efield.c.i

efpmd/CMakeFiles/efpmd.dir/src/efield.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/efield.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/efield.c -o CMakeFiles/efpmd.dir/src/efield.c.s

efpmd/CMakeFiles/efpmd.dir/src/energy.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/energy.c.o: ../efpmd/src/energy.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object efpmd/CMakeFiles/efpmd.dir/src/energy.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/energy.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/energy.c

efpmd/CMakeFiles/efpmd.dir/src/energy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/energy.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/energy.c > CMakeFiles/efpmd.dir/src/energy.c.i

efpmd/CMakeFiles/efpmd.dir/src/energy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/energy.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/energy.c -o CMakeFiles/efpmd.dir/src/energy.c.s

efpmd/CMakeFiles/efpmd.dir/src/grad.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/grad.c.o: ../efpmd/src/grad.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object efpmd/CMakeFiles/efpmd.dir/src/grad.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/grad.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/grad.c

efpmd/CMakeFiles/efpmd.dir/src/grad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/grad.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/grad.c > CMakeFiles/efpmd.dir/src/grad.c.i

efpmd/CMakeFiles/efpmd.dir/src/grad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/grad.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/grad.c -o CMakeFiles/efpmd.dir/src/grad.c.s

efpmd/CMakeFiles/efpmd.dir/src/gtest.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/gtest.c.o: ../efpmd/src/gtest.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object efpmd/CMakeFiles/efpmd.dir/src/gtest.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/gtest.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/gtest.c

efpmd/CMakeFiles/efpmd.dir/src/gtest.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/gtest.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/gtest.c > CMakeFiles/efpmd.dir/src/gtest.c.i

efpmd/CMakeFiles/efpmd.dir/src/gtest.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/gtest.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/gtest.c -o CMakeFiles/efpmd.dir/src/gtest.c.s

efpmd/CMakeFiles/efpmd.dir/src/hess.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/hess.c.o: ../efpmd/src/hess.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object efpmd/CMakeFiles/efpmd.dir/src/hess.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/hess.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/hess.c

efpmd/CMakeFiles/efpmd.dir/src/hess.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/hess.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/hess.c > CMakeFiles/efpmd.dir/src/hess.c.i

efpmd/CMakeFiles/efpmd.dir/src/hess.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/hess.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/hess.c -o CMakeFiles/efpmd.dir/src/hess.c.s

efpmd/CMakeFiles/efpmd.dir/src/md.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/md.c.o: ../efpmd/src/md.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object efpmd/CMakeFiles/efpmd.dir/src/md.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/md.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/md.c

efpmd/CMakeFiles/efpmd.dir/src/md.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/md.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/md.c > CMakeFiles/efpmd.dir/src/md.c.i

efpmd/CMakeFiles/efpmd.dir/src/md.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/md.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/md.c -o CMakeFiles/efpmd.dir/src/md.c.s

efpmd/CMakeFiles/efpmd.dir/src/msg.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/msg.c.o: ../efpmd/src/msg.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object efpmd/CMakeFiles/efpmd.dir/src/msg.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/msg.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/msg.c

efpmd/CMakeFiles/efpmd.dir/src/msg.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/msg.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/msg.c > CMakeFiles/efpmd.dir/src/msg.c.i

efpmd/CMakeFiles/efpmd.dir/src/msg.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/msg.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/msg.c -o CMakeFiles/efpmd.dir/src/msg.c.s

efpmd/CMakeFiles/efpmd.dir/src/opt.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/opt.c.o: ../efpmd/src/opt.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object efpmd/CMakeFiles/efpmd.dir/src/opt.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/opt.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/opt.c

efpmd/CMakeFiles/efpmd.dir/src/opt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/opt.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/opt.c > CMakeFiles/efpmd.dir/src/opt.c.i

efpmd/CMakeFiles/efpmd.dir/src/opt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/opt.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/opt.c -o CMakeFiles/efpmd.dir/src/opt.c.s

efpmd/CMakeFiles/efpmd.dir/src/main.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/main.c.o: ../efpmd/src/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object efpmd/CMakeFiles/efpmd.dir/src/main.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/main.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/main.c

efpmd/CMakeFiles/efpmd.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/main.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/main.c > CMakeFiles/efpmd.dir/src/main.c.i

efpmd/CMakeFiles/efpmd.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/main.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/main.c -o CMakeFiles/efpmd.dir/src/main.c.s

efpmd/CMakeFiles/efpmd.dir/src/parse.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/parse.c.o: ../efpmd/src/parse.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object efpmd/CMakeFiles/efpmd.dir/src/parse.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/parse.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/parse.c

efpmd/CMakeFiles/efpmd.dir/src/parse.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/parse.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/parse.c > CMakeFiles/efpmd.dir/src/parse.c.i

efpmd/CMakeFiles/efpmd.dir/src/parse.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/parse.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/parse.c -o CMakeFiles/efpmd.dir/src/parse.c.s

efpmd/CMakeFiles/efpmd.dir/src/rand.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/rand.c.o: ../efpmd/src/rand.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object efpmd/CMakeFiles/efpmd.dir/src/rand.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/rand.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/rand.c

efpmd/CMakeFiles/efpmd.dir/src/rand.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/rand.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/rand.c > CMakeFiles/efpmd.dir/src/rand.c.i

efpmd/CMakeFiles/efpmd.dir/src/rand.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/rand.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/rand.c -o CMakeFiles/efpmd.dir/src/rand.c.s

efpmd/CMakeFiles/efpmd.dir/src/sp.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/sp.c.o: ../efpmd/src/sp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object efpmd/CMakeFiles/efpmd.dir/src/sp.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/sp.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/sp.c

efpmd/CMakeFiles/efpmd.dir/src/sp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/sp.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/sp.c > CMakeFiles/efpmd.dir/src/sp.c.i

efpmd/CMakeFiles/efpmd.dir/src/sp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/sp.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/sp.c -o CMakeFiles/efpmd.dir/src/sp.c.s

efpmd/CMakeFiles/efpmd.dir/src/autodiff.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/autodiff.c.o: ../efpmd/src/autodiff.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object efpmd/CMakeFiles/efpmd.dir/src/autodiff.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/autodiff.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/autodiff.c

efpmd/CMakeFiles/efpmd.dir/src/autodiff.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/autodiff.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/autodiff.c > CMakeFiles/efpmd.dir/src/autodiff.c.i

efpmd/CMakeFiles/efpmd.dir/src/autodiff.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/autodiff.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/autodiff.c -o CMakeFiles/efpmd.dir/src/autodiff.c.s

efpmd/CMakeFiles/efpmd.dir/src/clib.c.o: efpmd/CMakeFiles/efpmd.dir/flags.make
efpmd/CMakeFiles/efpmd.dir/src/clib.c.o: ../efpmd/src/clib.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building C object efpmd/CMakeFiles/efpmd.dir/src/clib.c.o"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/efpmd.dir/src/clib.c.o -c /scratch/bell/paulsk/libefp/efpmd/src/clib.c

efpmd/CMakeFiles/efpmd.dir/src/clib.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/efpmd.dir/src/clib.c.i"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /scratch/bell/paulsk/libefp/efpmd/src/clib.c > CMakeFiles/efpmd.dir/src/clib.c.i

efpmd/CMakeFiles/efpmd.dir/src/clib.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/efpmd.dir/src/clib.c.s"
	cd /scratch/bell/paulsk/libefp/build/efpmd && /apps/spack/bell/apps/openmpi/3.1.6-gcc-10.2.0-kn4ct52/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /scratch/bell/paulsk/libefp/efpmd/src/clib.c -o CMakeFiles/efpmd.dir/src/clib.c.s

# Object files for target efpmd
efpmd_OBJECTS = \
"CMakeFiles/efpmd.dir/src/cfg.c.o" \
"CMakeFiles/efpmd.dir/src/common.c.o" \
"CMakeFiles/efpmd.dir/src/efield.c.o" \
"CMakeFiles/efpmd.dir/src/energy.c.o" \
"CMakeFiles/efpmd.dir/src/grad.c.o" \
"CMakeFiles/efpmd.dir/src/gtest.c.o" \
"CMakeFiles/efpmd.dir/src/hess.c.o" \
"CMakeFiles/efpmd.dir/src/md.c.o" \
"CMakeFiles/efpmd.dir/src/msg.c.o" \
"CMakeFiles/efpmd.dir/src/opt.c.o" \
"CMakeFiles/efpmd.dir/src/main.c.o" \
"CMakeFiles/efpmd.dir/src/parse.c.o" \
"CMakeFiles/efpmd.dir/src/rand.c.o" \
"CMakeFiles/efpmd.dir/src/sp.c.o" \
"CMakeFiles/efpmd.dir/src/autodiff.c.o" \
"CMakeFiles/efpmd.dir/src/clib.c.o"

# External object files for target efpmd
efpmd_EXTERNAL_OBJECTS =

efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/cfg.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/common.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/efield.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/energy.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/grad.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/gtest.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/hess.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/md.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/msg.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/opt.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/main.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/parse.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/rand.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/sp.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/autodiff.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/src/clib.c.o
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/build.make
efpmd/efpmd: libefp.a
efpmd/efpmd: /apps/spack/bell/apps/openblas/0.3.8-gcc-10.2.0-yierafl/lib/libopenblas.so
efpmd/efpmd: efpmd/CMakeFiles/efpmd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/scratch/bell/paulsk/libefp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Linking C executable efpmd"
	cd /scratch/bell/paulsk/libefp/build/efpmd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/efpmd.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
efpmd/CMakeFiles/efpmd.dir/build: efpmd/efpmd

.PHONY : efpmd/CMakeFiles/efpmd.dir/build

efpmd/CMakeFiles/efpmd.dir/clean:
	cd /scratch/bell/paulsk/libefp/build/efpmd && $(CMAKE_COMMAND) -P CMakeFiles/efpmd.dir/cmake_clean.cmake
.PHONY : efpmd/CMakeFiles/efpmd.dir/clean

efpmd/CMakeFiles/efpmd.dir/depend:
	cd /scratch/bell/paulsk/libefp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /scratch/bell/paulsk/libefp /scratch/bell/paulsk/libefp/efpmd /scratch/bell/paulsk/libefp/build /scratch/bell/paulsk/libefp/build/efpmd /scratch/bell/paulsk/libefp/build/efpmd/CMakeFiles/efpmd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : efpmd/CMakeFiles/efpmd.dir/depend

