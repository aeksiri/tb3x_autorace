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
ssh tb304@192.168.1.104 'killall -9 ssh'
ssh tb304@192.168.1.104 'killall -9 roslaunch'
ssh tb304@192.168.1.104 'killall -9 rosout'
ssh tb304@192.168.1.104 'killall -9 rosmaster'

#Kill in LAPTOP
killall -9 ssh
killall -9 roslaunch
killall -9 rosout
killall -9 rosmaster

echo "killall Completed!!!"
