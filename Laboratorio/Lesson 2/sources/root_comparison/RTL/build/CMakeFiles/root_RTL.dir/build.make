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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/build"

# Include any dependencies generated for this target.
include CMakeFiles/root_RTL.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/root_RTL.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/root_RTL.dir/flags.make

CMakeFiles/root_RTL.dir/src/root_RTL.cc.o: CMakeFiles/root_RTL.dir/flags.make
CMakeFiles/root_RTL.dir/src/root_RTL.cc.o: ../src/root_RTL.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/root_RTL.dir/src/root_RTL.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/root_RTL.dir/src/root_RTL.cc.o -c "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/src/root_RTL.cc"

CMakeFiles/root_RTL.dir/src/root_RTL.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/root_RTL.dir/src/root_RTL.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/src/root_RTL.cc" > CMakeFiles/root_RTL.dir/src/root_RTL.cc.i

CMakeFiles/root_RTL.dir/src/root_RTL.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/root_RTL.dir/src/root_RTL.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/src/root_RTL.cc" -o CMakeFiles/root_RTL.dir/src/root_RTL.cc.s

CMakeFiles/root_RTL.dir/src/root_RTL_testbench.cc.o: CMakeFiles/root_RTL.dir/flags.make
CMakeFiles/root_RTL.dir/src/root_RTL_testbench.cc.o: ../src/root_RTL_testbench.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/root_RTL.dir/src/root_RTL_testbench.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/root_RTL.dir/src/root_RTL_testbench.cc.o -c "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/src/root_RTL_testbench.cc"

CMakeFiles/root_RTL.dir/src/root_RTL_testbench.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/root_RTL.dir/src/root_RTL_testbench.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/src/root_RTL_testbench.cc" > CMakeFiles/root_RTL.dir/src/root_RTL_testbench.cc.i

CMakeFiles/root_RTL.dir/src/root_RTL_testbench.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/root_RTL.dir/src/root_RTL_testbench.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/src/root_RTL_testbench.cc" -o CMakeFiles/root_RTL.dir/src/root_RTL_testbench.cc.s

CMakeFiles/root_RTL.dir/src/main_root_RTL.cc.o: CMakeFiles/root_RTL.dir/flags.make
CMakeFiles/root_RTL.dir/src/main_root_RTL.cc.o: ../src/main_root_RTL.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/root_RTL.dir/src/main_root_RTL.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/root_RTL.dir/src/main_root_RTL.cc.o -c "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/src/main_root_RTL.cc"

CMakeFiles/root_RTL.dir/src/main_root_RTL.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/root_RTL.dir/src/main_root_RTL.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/src/main_root_RTL.cc" > CMakeFiles/root_RTL.dir/src/main_root_RTL.cc.i

CMakeFiles/root_RTL.dir/src/main_root_RTL.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/root_RTL.dir/src/main_root_RTL.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/src/main_root_RTL.cc" -o CMakeFiles/root_RTL.dir/src/main_root_RTL.cc.s

# Object files for target root_RTL
root_RTL_OBJECTS = \
"CMakeFiles/root_RTL.dir/src/root_RTL.cc.o" \
"CMakeFiles/root_RTL.dir/src/root_RTL_testbench.cc.o" \
"CMakeFiles/root_RTL.dir/src/main_root_RTL.cc.o"

# External object files for target root_RTL
root_RTL_EXTERNAL_OBJECTS =

root_RTL: CMakeFiles/root_RTL.dir/src/root_RTL.cc.o
root_RTL: CMakeFiles/root_RTL.dir/src/root_RTL_testbench.cc.o
root_RTL: CMakeFiles/root_RTL.dir/src/main_root_RTL.cc.o
root_RTL: CMakeFiles/root_RTL.dir/build.make
root_RTL: /home/filippo/pse_libraries/systemc/lib/libsystemc.a
root_RTL: CMakeFiles/root_RTL.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable root_RTL"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/root_RTL.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/root_RTL.dir/build: root_RTL

.PHONY : CMakeFiles/root_RTL.dir/build

CMakeFiles/root_RTL.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/root_RTL.dir/cmake_clean.cmake
.PHONY : CMakeFiles/root_RTL.dir/clean

CMakeFiles/root_RTL.dir/depend:
	cd "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL" "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL" "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/build" "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/build" "/home/filippo/Documents/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_comparison/RTL/build/CMakeFiles/root_RTL.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/root_RTL.dir/depend

