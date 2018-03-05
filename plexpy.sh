#!/usr/bin/env bash

source config.conf
docker pull linuxserver/plexpy

if docker ps | grep -q "linuxserver/plexpy"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $PLEXPY_NAME
  docker rm $PLEXPY_NAME
  docker create \
	--name $PLEXPY_NAME \
	--restart=always \
	--net $PLEXPY_NET \
	--ip $PLEXPY_IP \
	-p $PLEXPY_PORT:8181 \
	-e PUID=0 \
	-e PGID=0 \
	-v $PLEXPY_CONFIG:/config \
	$PLEXPY_VOLUMES \
	--privileged \
	linuxserver/plexpy
  docker start $PLEXPY_NAME
fi
