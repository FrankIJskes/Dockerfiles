FROM debian:wheezy
MAINTAINER Frank IJskes

# docker run -it -v /tmp/.X11-unix/:/tmp/.X11-unix/ -e DISPLAY=$DISPLAY --rm frank/pycharm

ENV PYCHARM_HOME=/etc/pycharm
RUN apt-get update &&\
    apt-get install -y \
    wget \
    git \
    openjdk-7-jre \
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
    python-all \
    build-essential \
    --no-install-recommends
RUN pip install web.py
RUN wget https://download.jetbrains.com/python/pycharm-community-2016.3.1.tar.gz -O /tmp/pycharm.tar.gz &&\
    mkdir ${PYCHARM_HOME} && tar -xzvf /tmp/pycharm.tar.gz -C ${PYCHARM_HOME} --strip=1 &&\
    wget -P /tmp/ https://bootstrap.pypa.io/get-pip.py && python /tmp/get-pip.py &&\
    rm -rf /var/lib/apt-lists; rm -rf /tmp/*; apt-get purge wget -y; apt-get autoremove -y

ENTRYPOINT ["/etc/pycharm/bin/pycharm.sh"]
