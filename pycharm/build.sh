#!/bin/bash

if [ "$1" == "" ]; then
	echo 'Geef buildnummer mee'
	exit 1
fi

short_version=$( echo $1 |  awk -F. '{ print $1"."$2 }' )

docker build . -t frankij/pycharm:$1 --build-arg PASSED_VERSION=$1 --build-arg SHORT_VERSION=$short_version --label $1
docker tag frankij/pycharm:$1 frankij/pycharm:latest
docker push frankij/pycharm:latest
