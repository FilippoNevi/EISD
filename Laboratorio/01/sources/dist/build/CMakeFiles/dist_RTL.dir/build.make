# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/filippo/Scaricati/sources/dist

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/filippo/Scaricati/sources/dist/build

# Include any dependencies generated for this target.
include CMakeFiles/dist_RTL.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/dist_RTL.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/dist_RTL.dir/flags.make

CMakeFiles/dist_RTL.dir/src/dist_RTL.cc.o: CMakeFiles/dist_RTL.dir/flags.make
CMakeFiles/dist_RTL.dir/src/dist_RTL.cc.o: ../src/dist_RTL.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/filippo/Scaricati/sources/dist/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/dist_RTL.dir/src/dist_RTL.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dist_RTL.dir/src/dist_RTL.cc.o -c /home/filippo/Scaricati/sources/dist/src/dist_RTL.cc

CMakeFiles/dist_RTL.dir/src/dist_RTL.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dist_RTL.dir/src/dist_RTL.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/filippo/Scaricati/sources/dist/src/dist_RTL.cc > CMakeFiles/dist_RTL.dir/src/dist_RTL.cc.i

CMakeFiles/dist_RTL.dir/src/dist_RTL.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dist_RTL.dir/src/dist_RTL.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/filippo/Scaricati/sources/dist/src/dist_RTL.cc -o CMakeFiles/dist_RTL.dir/src/dist_RTL.cc.s

CMakeFiles/dist_RTL.dir/src/dist_RTL_testbench.cc.o: CMakeFiles/dist_RTL.dir/flags.make
CMakeFiles/dist_RTL.dir/src/dist_RTL_testbench.cc.o: ../src/dist_RTL_testbench.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/filippo/Scaricati/sources/dist/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/dist_RTL.dir/src/dist_RTL_testbench.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dist_RTL.dir/src/dist_RTL_testbench.cc.o -c /home/filippo/Scaricati/sources/dist/src/dist_RTL_testbench.cc

CMakeFiles/dist_RTL.dir/src/dist_RTL_testbench.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dist_RTL.dir/src/dist_RTL_testbench.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/filippo/Scaricati/sources/dist/src/dist_RTL_testbench.cc > CMakeFiles/dist_RTL.dir/src/dist_RTL_testbench.cc.i

CMakeFiles/dist_RTL.dir/src/dist_RTL_testbench.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dist_RTL.dir/src/dist_RTL_testbench.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/filippo/Scaricati/sources/dist/src/dist_RTL_testbench.cc -o CMakeFiles/dist_RTL.dir/src/dist_RTL_testbench.cc.s

CMakeFiles/dist_RTL.dir/src/main_dist_RTL.cc.o: CMakeFiles/dist_RTL.dir/flags.make
CMakeFiles/dist_RTL.dir/src/main_dist_RTL.cc.o: ../src/main_dist_RTL.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/filippo/Scaricati/sources/dist/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/dist_RTL.dir/src/main_dist_RTL.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dist_RTL.dir/src/main_dist_RTL.cc.o -c /home/filippo/Scaricati/sources/dist/src/main_dist_RTL.cc

CMakeFiles/dist_RTL.dir/src/main_dist_RTL.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dist_RTL.dir/src/main_dist_RTL.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/filippo/Scaricati/sources/dist/src/main_dist_RTL.cc > CMakeFiles/dist_RTL.dir/src/main_dist_RTL.cc.i

CMakeFiles/dist_RTL.dir/src/main_dist_RTL.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dist_RTL.dir/src/main_dist_RTL.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/filippo/Scaricati/sources/dist/src/main_dist_RTL.cc -o CMakeFiles/dist_RTL.dir/src/main_dist_RTL.cc.s

# Object files for target dist_RTL
dist_RTL_OBJECTS = \
"CMakeFiles/dist_RTL.dir/src/dist_RTL.cc.o" \
"CMakeFiles/dist_RTL.dir/src/dist_RTL_testbench.cc.o" \
"CMakeFiles/dist_RTL.dir/src/main_dist_RTL.cc.o"

# External object files for target dist_RTL
dist_RTL_EXTERNAL_OBJECTS =

dist_RTL: CMakeFiles/dist_RTL.dir/src/dist_RTL.cc.o
dist_RTL: CMakeFiles/dist_RTL.dir/src/dist_RTL_testbench.cc.o
dist_RTL: CMakeFiles/dist_RTL.dir/src/main_dist_RTL.cc.o
dist_RTL: CMakeFiles/dist_RTL.dir/build.make
dist_RTL: /home/filippo/pse_libraries/systemc/lib/libsystemc.so.2.3.3
dist_RTL: CMakeFiles/dist_RTL.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/filippo/Scaricati/sources/dist/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable dist_RTL"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dist_RTL.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/dist_RTL.dir/build: dist_RTL

.PHONY : CMakeFiles/dist_RTL.dir/build

CMakeFiles/dist_RTL.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/dist_RTL.dir/cmake_clean.cmake
.PHONY : CMakeFiles/dist_RTL.dir/clean

CMakeFiles/dist_RTL.dir/depend:
	cd /home/filippo/Scaricati/sources/dist/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/filippo/Scaricati/sources/dist /home/filippo/Scaricati/sources/dist /home/filippo/Scaricati/sources/dist/build /home/filippo/Scaricati/sources/dist/build /home/filippo/Scaricati/sources/dist/build/CMakeFiles/dist_RTL.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/dist_RTL.dir/depend
