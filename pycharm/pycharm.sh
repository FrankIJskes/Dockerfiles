#!/bin/bash

# rename the terminal to something more usefull
#export PROMPT_COMMAND='echo -en "\033]0;FRANKS PYCHARM\a"'
echo -en "\033]0;frankij/PyCharm CE\a"

# minimize the terminal
xdotool windowminimize $(xdotool getactivewindow)

xhost +local:docker

# .PyCharmCE2016.3 is the default directory to store the settings for pycharm
# It uses the X socket
# and a redirect for the projects.
# and allow for the default port when developing with web.py

nohup docker run -it \
  -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
  -v /home/frank/Dropbox/PycharmProjects:/root/PycharmProjects \
  -v ~/.PyCharmCE2016.3:/root/.PyCharmCE2016.3 \
  -p 8080:8080
  -e DISPLAY=$DISPLAY \
  --rm  \
  frankij/pycharm \
  &
