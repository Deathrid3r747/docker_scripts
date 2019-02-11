#!/usr/bin/env bash

docker build . -t nginx-rp
docker run -d --privileged --restart=always -p 79:80 --net=media --ip=172.18.0.20 --name nginx-rp nginx-rp