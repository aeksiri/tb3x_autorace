#! /bin/bash

source /opt/ros/kinetic/setup.bash

source ~/catkin_ws/devel/setup.bash

#control_lane
roslaunch turtlebot3_autorace_control turtlebot3_autorace_control_lane.launch &
echo ...please wait for a while
sleep 5

#bringup
echo ...bringing up the tb3...
ssh tb304@192.168.1.104 'source /opt/ros/kinetic/setup.bash && export ROS_MASTER_URI=http://192.168.1.122:11311 && export ROS_HOSTNAME=192.168.1.104 && export TURTLEBOT3_MODEL=burger && source ~/catkin_ws/devel/setup.bash && ~/catkin_ws/src/tb3_shell_scripts/./bringup.sh' 

#kill in TB3
ssh tb304@192.168.1.104 'killall -9 bash'
ssh tb304@192.168.1.104 'killall -9 bringup.sh'
ssh tb304@192.168.1.104 'killall -9 python'
ssh tb304@192.168.1.104 'killall -9 hlds_laser_publisher'
ssh tb304@192.168.1.104 'killall -9 turtlebot3_diagnostics'

echo "lane tuning action Completed!!!"
