#!/bin/bash

# rename the terminal to something more usefull
#export PROMPT_COMMAND='echo -en "\033]0;FRANKS PYCHARM\a"'
echo -en "\033]0;frankij/PyCharm CE\a"

# minimize the terminal
#xdotool windowminimize $(xdotool getactivewindow)

xhost +local:docker

# It uses the X socket
# and a redirect for the projects.
# and allow for the default port when developing with web.py

docker run  \
  -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
  -v /home/frank/Dropbox/PycharmProjects:/root/PycharmProjects \
  -v ~/.PyCharmCE2017.1:/root/.PyCharmCE2017.1 \
  -p 8080:8080 \
  -e DISPLAY=$DISPLAY \
  --rm  \
  frankij/pycharm &
