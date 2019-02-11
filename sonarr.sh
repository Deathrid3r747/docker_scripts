#!/usr/bin/env bash

source /home/server/docker_scripts/config.conf
docker pull linuxserver/sonarr

if docker ps | grep -q "linuxserver/sonarr"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $SONARR_NAME
  docker rm $SONARR_NAME
  docker create \
	--name $SONARR_NAME \
	--restart=always \
	--net $SONARR_NET \
	--ip $SONARR_IP \
	-p $SONARR_PORT:8989 \
	-e PUID=0 \
	-e PGID=0 \
	-v /dev/rtc:/dev/rtc:ro \
	-v $SONARR_CONFIG:/config \
	$SONARR_VOLUMES \
	--privileged \
	linuxserver/sonarr
  docker start $SONARR_NAME
fi
