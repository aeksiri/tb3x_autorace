#! /bin/bash

#kill in TB3
ssh tb304@192.168.1.104 'rosnode kill -a'
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

echo /////////////////////////////////////////////
echo /////////////// source files ////////////////
echo /////////////////////////////////////////////
source /opt/ros/kinetic/setup.bash

source ~/catkin_ws/devel/setup.bash

echo /////////////////////////////////////////////
echo //////////////// rosmaster //////////////////
echo /////////////////////////////////////////////
#roscore &
#ssh tb304@192.168.1.104 'source ~/.bashrc && source /opt/ros/kinetic/setup.bash && roscore' &
#echo ...please wait for a while
#sleep 5
#echo done

echo /////////////////////////////////////////////
echo //////////////// raspi_camera ///////////////
echo /////////////////////////////////////////////
ssh tb304@192.168.1.104 'source /opt/ros/kinetic/setup.bash && source ~/catkin_ws/devel/setup.bash && export ROS_MASTER_URI=http://192.168.1.104:11311 && export ROS_HOSTNAME=192.168.1.104 && ~/catkin_ws/src/tb3_shell_scripts/./raspi_camera.sh' &
echo ...please wait for a while
sleep 10
echo done

echo /////////////////////////////////////////////
echo ////// instrinsic_camera_action ////////
echo /////////////////////////////////////////////
ssh tb304@192.168.1.104 'source /opt/ros/kinetic/setup.bash && source ~/catkin_ws/devel/setup.bash && export ROS_MASTER_URI=http://192.168.1.104:11311 && export ROS_HOSTNAME=192.168.1.104 && ~/catkin_ws/src/tb3_shell_scripts/./instrinsic_camera_action.sh' &
echo ...please wait for a while
sleep 10
echo done

echo /////////////////////////////////////////////
echo /////// extrinsic_camera_calibration ////////
echo /////////////////////////////////////////////
export AUTO_EX_CALIB=calibration
roslaunch turtlebot3_autorace_camera turtlebot3_autorace_extrinsic_camera_calibration.launch &
echo ...please wait for a while
sleep 10
echo done

echo /////////////////////////////////////////////
echo ////////// detect_lane_tuning ///////////////
echo /////////////////////////////////////////////
export AUTO_DT_CALIB=calibration
roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_lane.launch &
echo ...please wait for a while
sleep 10
echo done

echo /////////////////////////////////////////////
echo ///////////// image view ////////////////////
echo /////////////////////////////////////////////
rqt_image_view &
echo ...please wait for a while
sleep 5
echo done

echo /////////////////////////////////////////////
echo ////////////// rqt reconfig /////////////////
echo /////////////////////////////////////////////
rosrun rqt_reconfigure rqt_reconfigure &
echo ...please wait for a while
sleep 5
echo done

echo /////////////////////////////////////////////
echo ///////////////// bringup ///////////////////
echo /////////////////////////////////////////////
ssh tb304@192.168.1.104 'source /opt/ros/kinetic/setup.bash && export ROS_MASTER_URI=http://192.168.1.104:11311 && export ROS_HOSTNAME=192.168.1.104 && export TURTLEBOT3_MODEL=burger && source ~/catkin_ws/devel/setup.bash && ~/catkin_ws/src/tb3_shell_scripts/./bringup.sh' 
echo done

#kill in TB3
ssh tb304@192.168.1.104 'rosnode kill -a'
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

#kill in LAPTOP
killall -9 ssh
killall -9 roslaunch
killall -9 rosout
killall -9 rosmaster

echo ///////////////////////////
echo ///////////////////////////
echo "Lane Tunning Completed!!!"
echo ///////////////////////////
echo ///////////////////////////




