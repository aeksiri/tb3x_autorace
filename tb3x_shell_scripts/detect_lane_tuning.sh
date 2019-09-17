#! /bin/bash


source /opt/ros/kinetic/setup.bash

source ~/catkin_ws/devel/setup.bash

export AUTO_DT_CALIB=calibration

roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_lane.launch
