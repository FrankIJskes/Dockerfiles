FROM debian:wheezy
MAINTAINER Frank IJskes

# docker run -it -v /tmp/.X11-unix/:/tmp/.X11-unix/ -e DISPLAY=$DISPLAY --rm kongkoro/pycharm

RUN apt-get update &&\
    apt-get install -y \
    libxrender1 \
    gcc \
    libxtst6 \
    python \
    python-pip \
	vim \
    python-psutil \
    python-joblib \
    python-argparse \
    python-argvalidate \
    python-configobj \
    python-configglue \
    python-iniparse \
    --no-install-recommends
RUN pip install web.py

ENTRYPOINT ["/usr/bin/python"]
