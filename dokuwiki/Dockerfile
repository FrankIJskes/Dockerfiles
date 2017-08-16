FROM debian:jessie
MAINTAINER Frank IJskes

RUN 	apt-get update &&\
	apt-get install -y \
	dialog \
	lighttpd \
	php5-cgi php5

RUN	export DEBIAN_FRONTEND=noninteractive && apt-get install -y \
	dokuwiki \
	--no-install-recommends

RUN	lighty-enable-mod fastcgi fastcgi-php dokuwiki	 
# /etc/init.d/lighttpd force-reload

