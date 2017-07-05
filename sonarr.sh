#!/usr/bin/env bash

docker pull linuxserver/sonarr

if docker ps | grep -q "linuxserver/sonarr"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop sonarr
  docker rm sonarr
  docker create \
	--name sonarr \
	--restart=always \
	-p 8989:8989 \
	-e PUID=0 \
	-e PGID=0 \
	-v /dev/rtc:/dev/rtc:ro \
	-v /home/Containers/Sonarr:/config \
	-v /home/Media/Series:/tv \
	-v /home/Media/Download/nzb/complete/:/downloads \
	--privileged \
	linuxserver/sonarr
  docker start sonarr
fi
