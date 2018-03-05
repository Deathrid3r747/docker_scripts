#!/usr/bin/env bash

docker pull linuxserver/unifi

if docker ps | grep -q "linuxserver/unifi"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop unifi
  docker rm unifi
  docker create \
    --name=unifi \
    -v /mnt/Media/Containers/unifi:/config \
    -e PGID=0 -e PUID=0  \
    --privileged \
    -p 8080:8080 \
    -p 8081:8081 \
    -p 8443:8443 \
    -p 8843:8843 \
    -p 8880:8880 \
    linuxserver/unifi
  docker start unifi
fi

