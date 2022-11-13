# setting-ROSonWSL
wslのubuntu20.04上にturtlebotのシミュレーション環境を構築する。
環境変数の設定までを行う。

具体例は下記ブログ参照

https://tagebuchvonspargel.hatenablog.com/entry/2022/10/23/232641

# how to install
setting_ros_turtlebot.shをダウンロードし、
```
bash ./setting_ros_turtlebot.sh
```
を実行する。

# インストールするもの
* ROS-melodic
* turtlebot3
* open-ssh

# インストール後の実行方法
```
roslaunch turtlebot3_gazebo turtlebot3_empty_world.launch
```
とすればgazeboが起動する。
