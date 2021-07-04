#!/bin/bash

cd /home/filippo/Documents/Git/EISD/Laboratorio/10/10_sources/models/FMU_Assignment/controller_system
gcc -shared -fPIC -Iinclude src/controller.c -o fmu/binaries/linux64/controller_system.so
cd fmu
zip -r controller_system.fmu modelDescription.xml binaries/

cd /home/filippo/Documents/Git/EISD/Laboratorio/10/10_sources/models/FMU_Assignment/multiplicator_system
gcc -shared -fPIC -Iinclude src/multiplicator.c -o fmu/binaries/linux64/multiplicator_system.so
cd fmu
zip -r multiplicator_system.fmu modelDescription.xml binaries/
