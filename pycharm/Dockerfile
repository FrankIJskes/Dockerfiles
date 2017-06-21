FROM debian:stretch
MAINTAINER Frank IJskes

# docker run -it -v /tmp/.X11-unix/:/tmp/.X11-unix/ -e DISPLAY=$DISPLAY --rm frank/pycharm

ENV PYCHARM_HOME=/etc/pycharm
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    wget \
    git \
    openjdk-8-jre \
    libxrender1 \
    gcc \
    libxtst6 \
    build-essential \
    qt4-dev-tools \
    qt4-designer \
    mesa-common-dev \
    libsdl1.2-dev \
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
    python-yaml \
    python-xmltodict \
    python-lxml \
    python-cssselect \
    cython \
    python3 \
    python3-dev \
    python3-pip \
    python3-all \
    python3-psutil \
    python3-joblib \
    python3-configobj \
    python3-yaml \
    python3-lxml \
    python3-cssselect \
    python3-psycopg2 \
    cython3 \
    --no-install-recommends 
RUN pip install --upgrade pip
RUN pip  install web.py openpyxl ipaddress kivy termcolor
RUN pip3 install        openpyxl ipaddress kivy termcolor
RUN pip  install --upgrade requests
RUN pip3 install --upgrade requests
RUN wget https://download.jetbrains.com/python/pycharm-community-2017.1.4.tar.gz -O /tmp/pycharm.tar.gz &&\
    mkdir ${PYCHARM_HOME} && tar -xzvf /tmp/pycharm.tar.gz -C ${PYCHARM_HOME} --strip=1
RUN /usr/bin/python  /etc/pycharm/helpers/pydev/setup_cython.py build_ext --inplace
RUN /usr/bin/python3  /etc/pycharm/helpers/pydev/setup_cython.py build_ext --inplace

#RUN wget -P /tmp/ https://bootstrap.pypa.io/get-pip.py && python /tmp/get-pip.py
RUN rm -rf /var/lib/apt-lists; rm -rf /tmp/*; apt-get purge wget -y; apt-get autoremove -y

ENTRYPOINT ["/etc/pycharm/bin/pycharm.sh"]
