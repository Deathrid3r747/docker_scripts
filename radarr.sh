#!/usr/bin/env bash

docker pull linuxserver/radarr

if docker ps | grep -q "linuxserver/radarr"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop radarr
  docker rm radarr
  docker create \
	--name=radarr \
	--restart=always \
	-v /home/Containers/Radarr:/config \
	-v /home/Media:/media \
	-e PGID=0 \
	-e PUID=0 \
	-e TZ=Africa/Johannesburg \
	--privileged \
	-p 7878:7878 \
	linuxserver/radarr
  docker start radarr
fi

