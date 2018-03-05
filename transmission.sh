#!/usr/bin/env bash

source config.conf
docker pull linuxserver/transmission

#if docker ps | grep -q "linuxserver/transmission"; then
#  echo "Already running latest image"
#else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop transmission
  docker rm transmission
  docker create \
	--name=transmission \
	--restart=always \
        -v /mnt/Media/Download/torrent:/downloads \
	-e PGID=0 \
	-e PUID=0 \
	-e TZ=Africa/Johannesburg \
	--privileged \
	-p 9091:9091 -p 51413:51413 \
	linuxserver/transmission
  docker start transmission
#fi

