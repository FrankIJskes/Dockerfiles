FROM debian:stretch
MAINTAINER Frank IJskes

# docker run -it -v /tmp/.X11-unix/:/tmp/.X11-unix/ -e DISPLAY=$DISPLAY --rm kongkoro/pycharm

RUN apt-get update &&\
    apt-get install -y \
    libxrender1 \
    gcc \
    procps \
    curl \
    lynx \
    libxtst6 \
    python3 \
    python3-pip \
	vim \
    python3-psutil \
    python3-joblib \
    python3-configargparse \
    python3-args \
    python3-configobj \
    python3-iniparse \
    python3-pandas \
    python3-xlrd \
    python3-all \
    --no-install-recommends
RUN apt-get install -y \
    git
RUN pip3 install pymongo requests pymysql
RUN pip3 install setuptools
RUN pip3 install git+https://github.com/webpy/webpy#egg=web.py
RUN pip3 install matplotlib

ENTRYPOINT ["/usr/bin/python3"]
