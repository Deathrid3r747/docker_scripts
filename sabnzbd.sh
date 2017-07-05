#!/usr/bin/env bash

docker pull linuxserver/sabnzbd

if docker ps | grep -q "linuxserver/sabnzbd"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop sabnzbd
  docker rm sabnzbd
  docker create \
	--name=sabnzbd \
	--privileged \
	--restart=always \
	-v /home/Containers/Sabnzbd:/config \
	-v /home/Media/Download/nzb/complete:/downloads \
	-v /home/Media/Download/nzb/incomplete:/incomplete-downloads \
	-e PGID=0 \
	-e PUID=0 \
	-e TZ=Africa/Johannesburg \
	-p 8080:8080 \
	-p 9090:9090 \
	linuxserver/sabnzbd
  docker start sabnzbd
fi

