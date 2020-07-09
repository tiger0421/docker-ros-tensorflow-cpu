# docker-ros-tensroflow-cpu

this images is based on [this container](https://hub.docker.com/layers/ros/library/ros/melodic/images/sha256-ffadb42c6346b45d82335ecd64e266c97132444441385b675d81eed83f658f4d?context=explore).

## Version
- ubuntu 18.04
- ROS melodic
- Python      2.7
- Tensorflow  2.1.0

## User account
User named "docker" is already created and this user is beloged to sudoers.  
So, you can use `sudo` command.  
For example  
`$ sudo apt update`
password is `ubuntu`.

## How to running
```
$ docker run --rm -it tiger0421/ros-tensorflow-cpu bash
```

If you want to use some devices(web-camera, IMU, etc.) or share network with host, add the option like `-v /dev:/dev` or `--net ***`.
