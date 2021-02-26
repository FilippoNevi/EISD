#!/bin/bash

docker run --rm -it \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=$DISPLAY \
  -v /opt/mentor-centos/opt:/opt:ro \
  -v /home/filippo:/home/user \
  mentor_tools_base:20201130
