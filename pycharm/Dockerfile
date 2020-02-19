FROM ubuntu:bionic
MAINTAINER Frank IJskes

# arg zorgt ervoor dat een van buitenaf afkomstige variabale gebruikt kan worden
# met een default waarde. PASSED_VERSION komt vanuit de build.sh
ARG PASSED_VERSION=2019.2.4
ARG SHORT_VERSION=2019.2
ENV VERSION=${PASSED_VERSION}
ENV SHORT=${SHORT_VERSION}

ARG pycharm_source=https://download.jetbrains.com/python/pycharm-community-${VERSION}.tar.gz
ARG pycharm_local_dir=.PyCharmCE${SHORT}

ENV PYCHARM_HOME=/etc/pycharm
WORKDIR ${PYCHARM_HOME}

# docker run -it -v /tmp/.X11-unix/:/tmp/.X11-unix/ -e DISPLAY=$DISPLAY --rm frank/pycharm

RUN echo "Europe/Amsterdam" > /etc/timezone
ARG DEBIAN_FRONTEND=noninteractive
ARG DEBCONF_NONINTERACTIVE_SEEN=true

ADD stable.pref /etc/apt/preferences.d/stable.pref
ADD testing.pref /etc/apt/preferences.d/testing.pref

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
    python3-kivy \
    python3-setuptools \
    cython3 \
    --no-install-recommends
#RUN pip install --upgrade pip
RUN apt-get install -y \
	python3-termcolor \
	python3-openpyxl \
	python3-jinja2 \
	python3-matplotlib \
	python3-numpy \
	python3-pandas \
	python3-requests \
	python3-xlrd \
	python3-wheel \
	python3-pymysql \
	python3-gv \
	python3-graphviz \
	python3-pygraphviz \
	python3-mysql.connector \
  python3-jenkins \
	python3-multi-key-dict \
  python3-pbr \
    --no-install-recommends

ADD root_ca_certificate_tabsvm.crt /usr/local/share/ca-certificates/root_ca_certificate_tabsvm.crt
RUN chmod 644 /usr/local/share/ca-certificates/root_ca_certificate_tabsvm.crt && update-ca-certificates

RUN pip3 install asn1crypto bcrypt cached-property click colorama cryptography
RUN pip3 install docopt exchangelib future gitdb2 GitPython  jenkinsapi jsonschema  mccabe
RUN pip3 install docker docker-compose docker-pycreds dockerpty
RUN pip3 install web.py==0.40
RUN pip3 install ipaddress Django pymongo tabulate
RUN pip3 install --upgrade requests

#vanwege python3.7 (maar heeft wel impact op web.py die beter werkt met 3.5)
#RUN apt-get install -y \
#	python3.7 \
#	python3.7-dev \
#	python3.7-venv


#Kivy keeps skeletons running in pycharm...
#RUN apt install	python-kivy python3-kivy
RUN wget $pycharm_source -O /tmp/pycharm.tar.gz &&\
    tar -xzf /tmp/pycharm.tar.gz -C ${PYCHARM_HOME} --strip=1

#RUN /usr/bin/python3  /etc/pycharm/helpers/pydev/setup_cython.py build_ext --inplace
# Compile the cython debugger extensions
#RUN /usr/bin/python3 /${PYCHARM_HOME}/helpers/pydev/setup_cython.py build_ext --inplace


RUN apt-get clean ; rm -rf /var/lib/apt-lists; rm -rf /tmp/*; apt-get purge wget -y; apt-get autoremove -y

# USER MANAGEMENT, so we can use something else then root in this container
RUN useradd -m -d /home/frank -u 1000 -s /bin/bash frank
RUN mkdir /home/frank/.PyCharmCE2019 ; # echo "idea.config.path=/home/frank/.PyCharmCE2019/config" >> /etc/pycharm/bin/idea.properties
RUN mkdir /home/frank/.java ; mkdir -p /home/frank/.local/share/JetBrains
RUN ln -sf /home/frank/.PyCharmCE2019 /home/frank/.PyCharmCE${VERSION} ; ln -sf /home/frank/.PyCharmCE2019 /home/frank/.PyCharmCE${SHORT}
RUN chmod o+rwx -R /home ; chown -R frank.frank /home/frank
RUN ls -al /home/frank/

RUN chown -R frank.frank /etc/pycharm
RUN chmod o+rwx -R /etc/pycharm
RUN /usr/bin/python3  /etc/pycharm/plugins/python-ce/helpers/pydev/setup_cython.py build_ext --inplace

USER frank
ENV HOME /home/frank

ENTRYPOINT ["/etc/pycharm/bin/pycharm.sh"]
