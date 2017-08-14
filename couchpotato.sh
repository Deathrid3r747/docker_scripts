#!/usr/bin/env bash

docker pull linuxserver/couchpotato

if docker ps | grep -q "linuxserver/couchpotato"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop couchpotato
  docker rm couchpotato
  docker create \
    --name=couchpotato \
    -v /home/Containers/couchpotato:/config \
    -v /home/Media/Downloads:/downloads \
    -v /home/Media/Movies:/data/movies \
    -e PUID=0  \
	-e PGID=0 \
	-e TZ=Africa/Johannesburg \
    -p 5050:5050 \
    linuxserver/couchpotato
  docker start couchpotato
fi
