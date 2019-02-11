#!/usr/bin/env bash

source config.conf
docker pull $TRANSMISSION_REPO

if docker ps | grep -q "$TRANSMISSION_REPO"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $TRANSMISSION_NAME
  docker rm $TRANSMISSION_NAME
  docker create \
        --name=$TRANSMISSION_NAME \
        --restart=always \
        -v $TRANSMISSION_DOWNLOADS:/downloads \
	--net $TRANSMISSION_NET \
	--ip $TRANSMISSION_IP \
        -e PGID=0 \
        -e PUID=0 \
        -e TZ=Africa/Johannesburg \
        --privileged \
        -p $TRANSMISSION_PORT:9091 -p 51413:51413 \
        $TRANSMISSION_REPO
  docker start $TRANSMISSION_NAME
fi
