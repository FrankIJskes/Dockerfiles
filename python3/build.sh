#!/bin/bash

docker build . -t frank/python3

docker tag frank/python3:latest registry.beheer.tabsvm.local/tabsvm/franks-python3:latest
docker push registry.beheer.tabsvm.local/tabsvm/franks-python3:latest

