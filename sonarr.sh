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
	--net media \
	--ip 172.18.0.2 \
	-p 8989:8989 \
	-e PUID=0 \
	-e PGID=0 \
	-v /dev/rtc:/dev/rtc:ro \
	-v /home/Containers/Sonarr:/config \
	-v /drive/ada0:/ada0 \
	-v /drive/ada1:/ada1 \
	-v /drive/ada2:/ada2 \
	-v /drive/ada3:/ada3 \
	--privileged \
	linuxserver/sonarr
  docker start sonarr
fi
