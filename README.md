# setting-ROSonWSL
wslのubuntu20.04上にturtlebotのシミュレーション環境を構築する。
環境変数の設定までを行う。
インストール時に下記エラーが出る場合があるが無視して大丈夫
```
E: Unable to locate package open-ssh
```

具体例は下記ブログ参照

https://tagebuchvonspargel.hatenablog.com/entry/2022/10/23/232641

# how to install
ターミナル上で下記実行

```
git clone https://github.com/Spargel125/setting-ROSonWSL.git
bash ./setting-ROSonWSL/setting_ros_turtlebot.sh
```

もしくは手動でsetting_ros_turtlebot.shをダウンロードし、
```
bash ./setting_ros_turtlebot.sh
```
を実行する。

# インストールするもの
* ROS-noetic
* turtlebot3
* open-ssh

# インストール後の実行方法
```
source ~/catkin_ws/devel/setup.bash
export TURTLEBOT3_MODEL=burger
roslaunch turtlebot3_gazebo turtlebot3_empty_world.launch
```
とすればgazeboが起動する。
