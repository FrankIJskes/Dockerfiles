#!/bin/bash

xhost +local:docker

# .PyCharmCE2016.3 is the default directory to store the settings for pycharm
# It uses the X socket
# and a redirect for the projects.

docker run -it \
  -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
  -v /home/frank/Dropbox/PycharmProjects:/root/PycharmProjects \
  -v ~/.PyCharmCE2016.3:/root/.PyCharmCE2016.3 \
  -e DISPLAY=$DISPLAY \
  --rm  \
  frank/pycharm

