
cmake_minimum_required(VERSION 3.10)
project(root_AT4)

find_package(SystemCLanguage CONFIG REQUIRED)
set (CMAKE_CXX_STANDARD ${SystemC_CXX_STANDARD})

include_directories(include)

set(SOURCES 
    src/${CMAKE_PROJECT_NAME}.cc
    src/${CMAKE_PROJECT_NAME}_testbench.cc
    src/main_${CMAKE_PROJECT_NAME}.cc
    )

add_executable(${CMAKE_PROJECT_NAME} ${SOURCES})
target_link_libraries(${CMAKE_PROJECT_NAME} SystemC::systemc)