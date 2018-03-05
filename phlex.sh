#!/usr/bin/env bash

source config.conf
docker pull digitalhigh/phlex

if docker ps | grep -q "digitalhigh/phlex"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $PHLEX_NAME
  docker rm $PHLEX_NAME
  docker create \
	--name $PHLEX_NAME \
	--restart=always \
	--net $PHLEX_NET \
	--ip $PHLEX_IP \
        -p $PHLEX_PORT1:5666 \
        -p $PHLEX_PORT2:5667 \
	-e PUID=1000 \
	-e PGID=1000 \
        -e TZ=Africa/Johannesburg \
	-v /dev/rtc:/dev/rtc:ro \
         -v /var/log \
	-v $PHLEX_CONFIG:/config \
	--privileged \
	digitalhigh/phlex
  docker start $PHLEX_NAME
fi
