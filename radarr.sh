#!/usr/bin/env bash

source config.conf
docker pull linuxserver/radarr

#if docker ps | grep -q "linuxserver/radarr"; then
#  echo "Already running latest image"
#else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $RADARR_NAME
  docker rm $RADARR_NAME
  docker create \
	--name=$RADARR_NAME \
	--restart=always \
	-v $RADARR_CONFIG:/config \
	$RADARR_VOLUMES \
        --net $RADARR_NET \
        --ip $RADARR_IP \
	-e PGID=0 \
	-e PUID=0 \
	-e TZ=Africa/Johannesburg \
	--privileged \
	-p $RADARR_PORT:7878 \
	linuxserver/radarr
  docker start $RADARR_NAME
#fi

