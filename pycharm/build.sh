#!/bin/bash

if [ "$1" == "" ]; then
	echo 'Geef buildnummer mee'
	exit 1
fi



docker build . -t frankij/pycharm:$1 --build-arg PASSED_VERSION=$1 --label $1
docker tag frankij/pycharm:$1 frankij/pycharm:latest

