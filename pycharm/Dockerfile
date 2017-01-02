FROM debian:jessie
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
    python-dev \
    python-pip \
    python-all \
    python-openpyxl \
    python-psutil \
    python-joblib \
    python-argparse \
    python-argvalidate \
    python-configobj \
    python-configglue \
    python-iniparse \
    cython \
    python3 \
    python3-dev \
    python3-pip \
    python3-all \
    python3-psutil \
    python3-joblib \
    python3-configobj \
    cython3 \
    build-essential \
    --no-install-recommends 
RUN pip install --upgrade pip
RUN pip install web.py openpyxl ipaddress
RUN pip3 install openpyxl ipaddress
RUN wget https://download.jetbrains.com/python/pycharm-community-2016.3.2.tar.gz -O /tmp/pycharm.tar.gz &&\
    mkdir ${PYCHARM_HOME} && tar -xzvf /tmp/pycharm.tar.gz -C ${PYCHARM_HOME} --strip=1
RUN /usr/bin/python  /etc/pycharm/helpers/pydev/setup_cython.py build_ext --inplace
RUN /usr/bin/python3  /etc/pycharm/helpers/pydev/setup_cython.py build_ext --inplace

RUN wget -P /tmp/ https://bootstrap.pypa.io/get-pip.py && python /tmp/get-pip.py
#RUN /usr/bin/python3 /etc/pycharm/helpers/pydev/setup_cython.py build_ext --inplace
RUN rm -rf /var/lib/apt-lists; rm -rf /tmp/*; apt-get purge wget -y; apt-get autoremove -y

ENTRYPOINT ["/etc/pycharm/bin/pycharm.sh"]
