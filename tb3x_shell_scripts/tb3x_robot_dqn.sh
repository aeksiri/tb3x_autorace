#! /bin/bash

#kill in TB3
ssh tb304@192.168.1.104 'killall -9 bash'
ssh tb304@192.168.1.104 'killall -9 bringup.sh'
ssh tb304@192.168.1.104 'killall -9 python'
ssh tb304@192.168.1.104 'killall -9 hlds_laser_publisher'
ssh tb304@192.168.1.104 'killall -9 turtlebot3_diagnostics'
ssh tb304@192.168.1.104 'killall -9 sshd'
ssh tb304@192.168.1.104 'killall -9 raspi_camera.sh'
ssh tb304@192.168.1.104 'killall -9 roslaunch'
ssh tb304@192.168.1.104 'killall -9 raspicam_node'

#Kill in LAPTOP
killall -9 ssh
killall -9 roslaunch
killall -9 rosout
killall -9 rosmaster

source /opt/ros/kinetic/setup.bash

source ~/catkin_ws/devel/setup.bash

#run master
roscore &

sleep 5

#bringup in TB3
ssh tb304@192.168.1.104 'source /opt/ros/kinetic/setup.bash && export ROS_MASTER_URI=http://192.168.1.124:11311 && export ROS_HOSTNAME=192.168.1.104 && export TURTLEBOT3_MODEL=burger && source ~/catkin_ws/devel/setup.bash && ~/catkin_ws/src/tb3_shell_scripts/./bringup.sh' &

sleep 20 

#machine learning
roslaunch turtlebot3_dqn turtlebot3_dqn_stage_1_robot.launch

sleep 10

#kill in TB3
ssh tb304@192.168.1.104 'killall -9 bash'
ssh tb304@192.168.1.104 'killall -9 bringup.sh'
ssh tb304@192.168.1.104 'killall -9 python'
ssh tb304@192.168.1.104 'killall -9 hlds_laser_publisher'
ssh tb304@192.168.1.104 'killall -9 turtlebot3_diagnostics'
ssh tb304@192.168.1.104 'killall -9 sshd'
ssh tb304@192.168.1.104 'killall -9 raspi_camera.sh'
ssh tb304@192.168.1.104 'killall -9 roslaunch'
ssh tb304@192.168.1.104 'killall -9 raspicam_node'

#Kill in LAPTOP
killall -9 ssh
killall -9 roslaunch
killall -9 rosout
killall -9 rosmaster

echo "Machine learning complete"
