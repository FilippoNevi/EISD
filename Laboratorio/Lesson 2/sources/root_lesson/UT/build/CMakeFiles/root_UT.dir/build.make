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
CMAKE_SOURCE_DIR = "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/build"

# Include any dependencies generated for this target.
include CMakeFiles/root_UT.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/root_UT.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/root_UT.dir/flags.make

CMakeFiles/root_UT.dir/src/root_UT.cc.o: CMakeFiles/root_UT.dir/flags.make
CMakeFiles/root_UT.dir/src/root_UT.cc.o: ../src/root_UT.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/root_UT.dir/src/root_UT.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/root_UT.dir/src/root_UT.cc.o -c "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/src/root_UT.cc"

CMakeFiles/root_UT.dir/src/root_UT.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/root_UT.dir/src/root_UT.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/src/root_UT.cc" > CMakeFiles/root_UT.dir/src/root_UT.cc.i

CMakeFiles/root_UT.dir/src/root_UT.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/root_UT.dir/src/root_UT.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/src/root_UT.cc" -o CMakeFiles/root_UT.dir/src/root_UT.cc.s

CMakeFiles/root_UT.dir/src/root_UT_testbench.cc.o: CMakeFiles/root_UT.dir/flags.make
CMakeFiles/root_UT.dir/src/root_UT_testbench.cc.o: ../src/root_UT_testbench.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/root_UT.dir/src/root_UT_testbench.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/root_UT.dir/src/root_UT_testbench.cc.o -c "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/src/root_UT_testbench.cc"

CMakeFiles/root_UT.dir/src/root_UT_testbench.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/root_UT.dir/src/root_UT_testbench.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/src/root_UT_testbench.cc" > CMakeFiles/root_UT.dir/src/root_UT_testbench.cc.i

CMakeFiles/root_UT.dir/src/root_UT_testbench.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/root_UT.dir/src/root_UT_testbench.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/src/root_UT_testbench.cc" -o CMakeFiles/root_UT.dir/src/root_UT_testbench.cc.s

CMakeFiles/root_UT.dir/src/main_root_UT.cc.o: CMakeFiles/root_UT.dir/flags.make
CMakeFiles/root_UT.dir/src/main_root_UT.cc.o: ../src/main_root_UT.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/root_UT.dir/src/main_root_UT.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/root_UT.dir/src/main_root_UT.cc.o -c "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/src/main_root_UT.cc"

CMakeFiles/root_UT.dir/src/main_root_UT.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/root_UT.dir/src/main_root_UT.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/src/main_root_UT.cc" > CMakeFiles/root_UT.dir/src/main_root_UT.cc.i

CMakeFiles/root_UT.dir/src/main_root_UT.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/root_UT.dir/src/main_root_UT.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/src/main_root_UT.cc" -o CMakeFiles/root_UT.dir/src/main_root_UT.cc.s

# Object files for target root_UT
root_UT_OBJECTS = \
"CMakeFiles/root_UT.dir/src/root_UT.cc.o" \
"CMakeFiles/root_UT.dir/src/root_UT_testbench.cc.o" \
"CMakeFiles/root_UT.dir/src/main_root_UT.cc.o"

# External object files for target root_UT
root_UT_EXTERNAL_OBJECTS =

root_UT: CMakeFiles/root_UT.dir/src/root_UT.cc.o
root_UT: CMakeFiles/root_UT.dir/src/root_UT_testbench.cc.o
root_UT: CMakeFiles/root_UT.dir/src/main_root_UT.cc.o
root_UT: CMakeFiles/root_UT.dir/build.make
root_UT: /home/filippo/systemc-2.3.3/build/src/libsystemc.a
root_UT: CMakeFiles/root_UT.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable root_UT"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/root_UT.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/root_UT.dir/build: root_UT

.PHONY : CMakeFiles/root_UT.dir/build

CMakeFiles/root_UT.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/root_UT.dir/cmake_clean.cmake
.PHONY : CMakeFiles/root_UT.dir/clean

CMakeFiles/root_UT.dir/depend:
	cd "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT" "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT" "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/build" "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/build" "/run/media/filippo/AUKEY/Università/Embedded & IoT Systems Design/Laboratorio/Lesson 2/sources/root_lesson/UT/build/CMakeFiles/root_UT.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/root_UT.dir/depend

