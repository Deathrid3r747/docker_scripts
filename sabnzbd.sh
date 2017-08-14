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
        --net media \
        --ip 172.18.0.3 \
        -v /home/Containers/Sabnzbd:/config \
        -v /drive/ada0:/ada0 \
        -v /drive/ada1:/ada1 \
        -v /drive/ada2:/ada2 \
        -v /drive/ada3:/ada3 \
	-e PGID=0 \
	-e PUID=0 \
	-e TZ=Africa/Johannesburg \
	-p 8080:8080 \
	-p 9090:9090 \
	linuxserver/sabnzbd
  docker start sabnzbd
fi

