FROM debian:stretch
MAINTAINER Frank IJskes

# arg zorgt ervoor dat een van buitenaf afkomstige variabale gebruikt kan worden
# met een default waarde
ARG PASSED_VERSION=2018.1.4
ENV VERSION=$PASSED_VERSION

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
    python-setuptools \
    python-wheel \
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
	python3-setuptools \
    cython3 \
    --no-install-recommends
RUN pip install --upgrade pip
RUN apt-get install -y \
	python-termcolor \
	python3-termcolor \
	python-ipaddress \
	python-openpyxl \
	python3-openpyxl \
	python3-jinja2 \
	python3-matplotlib \
	python3-numpy \
	python3-pandas \
	python3-xlrd \
    --no-install-recommends

RUN pip  install web.py
RUN pip3 install git+https://github.com/webpy/webpy#egg=web.py
RUN pip3 install ipaddress Django pymongo
RUN pip  install --upgrade requests
RUN pip3 install --upgrade requests
#Kivy keeps skeletons running in pycharm...
#RUN apt install	python-kivy python3-kivy
RUN wget https://download.jetbrains.com/python/pycharm-community-${VERSION}.tar.gz -O /tmp/pycharm.tar.gz &&\
    mkdir ${PYCHARM_HOME} && tar -xzvf /tmp/pycharm.tar.gz -C ${PYCHARM_HOME} --strip=1
RUN /usr/bin/python  /etc/pycharm/helpers/pydev/setup_cython.py build_ext --inplace
RUN /usr/bin/python3  /etc/pycharm/helpers/pydev/setup_cython.py build_ext --inplace

#RUN wget -P /tmp/ https://bootstrap.pypa.io/get-pip.py && python /tmp/get-pip.py
RUN apt-get clean ; rm -rf /var/lib/apt-lists; rm -rf /tmp/*; apt-get purge wget -y; apt-get autoremove -y

ENTRYPOINT ["/etc/pycharm/bin/pycharm.sh"]
