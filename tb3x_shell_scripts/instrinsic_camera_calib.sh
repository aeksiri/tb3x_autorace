#! /bin/bash


source /opt/ros/kinetic/setup.bash

source ~/catkin_ws/devel/setup.bash

export AUTO_IN_CALIB=calibration

export GAZEBO_MODE=false

roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch

