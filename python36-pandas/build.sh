#!/bin/bash

docker build . -t frank/python36-pandas

docker tag frank/python36-pandas:latest registry.beheer.tabsvm.local/tabsvm/franks-python36-pandas:latest
docker push registry.beheer.tabsvm.local/tabsvm/franks-python36-pandas:latest

