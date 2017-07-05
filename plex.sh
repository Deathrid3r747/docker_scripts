#!/usr/bin/env bash

docker pull linuxserver/plex

if docker ps | grep -q "linuxserver/plex"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop plex
  docker rm plex
  docker create \
	--name=plex \
	--net=host \
	-e VERSION=latest \
	-e PUID=0 \
	-e PGID=0 \
	-e TZ=Africa/Johannesburg \
	-v /home/Containers/Plex:/config \
	-v /home/Media/Series:/data/tvshows \
	-v /home/Media/Movies:/data/movies \
	-v /home/Media/Transcode:/transcode \
	linuxserver/plex
  docker start plex
fi

