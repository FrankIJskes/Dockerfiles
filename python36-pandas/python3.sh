#!/bin/bash

#xhost +local:docker
#docker run -it -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /home/frank/Dropbox/PycharmProjects:/root/PycharmProjects -v ~/.PyCharm40:/root/.PyCharm40 -e DISPLAY=$DISPLAY --rm frank/pycharm
docker run --rm -v /:/ frank/python3

