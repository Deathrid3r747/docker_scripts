#!/bin/bash

docker kill syncthing
docker rm syncthing
 docker create -p 8384:8384 -p 22000:22000 \
    --name syncthing \
    -v /home/server/docker_config/syncthing:/var/syncthing/config \
    -v /mnt/Media:/mnt/Media \
    --privileged \
    syncthing/syncthing

docker start syncthing
