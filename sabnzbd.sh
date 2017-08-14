#!/usr/bin/env bash

source config.conf
docker pull linuxserver/sabnzbd

#if docker ps | grep -q "linuxserver/sabnzbd"; then
#  echo "Already running latest image"
#else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $SAB_NAME
  docker rm $SAB_NAME
  docker create \
	--name=$SAB_NAME \
	--privileged \
	--restart=always \
        --net $SAB_NET \
        --ip $SAB_IP \
	-v $SAB_CONFIG:/config \
	$SAB_VOLUMES \
	-e PGID=0 \
	-e PUID=0 \
	-e TZ=Africa/Johannesburg \
	-p $SAB_PORT:8080 \
	-p $SAB_PORT_SSL:9090 \
	linuxserver/sabnzbd
  docker start $SAB_NAME
#fi

