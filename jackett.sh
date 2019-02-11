#!/usr/bin/env bash

source /home/server/docker_scripts/config.conf
docker pull linuxserver/jackett

if docker ps | grep -q "linuxserver/jackett"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $JACKETT_NAME
  docker rm $JACKETT_NAME
  docker create \
	--name $JACKETT_NAME \
	--restart=always \
	--net $JACKETT_NET \
	--ip $JACKETT_IP \
	-p $JACKETT_PORT:9117 \
	-e PUID=0 \
	-e PGID=0 \
	-v /etc/localtime:/etc/localtime:ro \
	-v $JACKETT_CONFIG:/config \
	$JACKETT_VOLUMES \
	--privileged \
	linuxserver/jackett
  docker start $JACKETT_NAME
fi
