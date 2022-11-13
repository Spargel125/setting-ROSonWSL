#!/bin/bash
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install -y curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt install -y ros-noetic-desktop-full
source /opt/ros/noetic/setup.bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt install -y python3-rosdep
sudo rosdep init
rosdep update

# install turtlebot
sudo apt-get install -y ros-noetic-joy ros-noetic-teleop-twist-joy \
  ros-noetic-teleop-twist-keyboard ros-noetic-laser-proc \
  ros-noetic-rgbd-launch ros-noetic-rosserial-arduino \
  ros-noetic-rosserial-python ros-noetic-rosserial-client \
  ros-noetic-rosserial-msgs ros-noetic-amcl ros-noetic-map-server \
  ros-noetic-move-base ros-noetic-urdf ros-noetic-xacro \
  ros-noetic-compressed-image-transport ros-noetic-rqt* ros-noetic-rviz \
  ros-noetic-gmapping ros-noetic-navigation ros-noetic-interactive-markers

#Install TurtleBot3 via Debian Packages.
sudo apt install -y ros-noetic-dynamixel-sdk
sudo apt install -y ros-noetic-turtlebot3-msgs
sudo apt install -y ros-noetic-turtlebot3

#install gazebo simulator
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src/
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
cd ~/catkin_ws && catkin_make

#setting system arguments
echo 'export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '"'{print \$2}'):0.0" >> ~/.bashrc
echo export LIBGL_ALWAYS_INDIRECT=0 >> ~/.bashrc
echo export GAZEBO_IP=127.0.0.1 >> ~/.bashrc
echo 'export ROS_MASTER_URI=http://$(hostname -I | tr -d [:blank:]):11311' >> ~/.bashrc
echo 'export ROS_IP=$(hostname -I | tr -d [:blank:])' >> ~/.bashrc 


#open-ssh install
# sudo apt install open-ssh
sudo ssh-keygen -A
sudo service ssh restart

source ~/.bashrc
