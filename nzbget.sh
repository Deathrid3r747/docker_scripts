#!/usr/bin/env bash

source config.conf
docker pull linuxserver/nzbget

#if docker ps | grep -q "linuxserver/nzbget"; then
#  echo "Already running latest image"
#else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $NZBGET_NAME
  docker rm $NZBGET_NAME
  docker create \
        --name=$NZBGET_NAME \
        --privileged \
        --restart=always \
        --net $NZBGET_NET \
        --ip $NZBGET_IP \
	-p $NZBGET_PORT:6789 \
	-e PUID=0 -e PGID=0 \
	-e TZ=Africa/Johannesburg \
	-v $NZBGET_CONFIG:/config \
	$NZBGET_VOLUMES \
	linuxserver/nzbget       
  docker start $NZBGET_NAME
#fi

