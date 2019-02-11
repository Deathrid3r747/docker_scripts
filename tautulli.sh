#!/usr/bin/env bash

source config.conf
docker pull linuxserver/tautulli

if docker ps | grep -q "linuxserver/tautulli"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $TAUTULLI_NAME
  docker rm $TAUTULLI_NAME
  docker create \
	--name $TAUTULLI_NAME \
	--restart=always \
	--net $TAUTULLI_NET \
	--ip $TAUTULLI_IP \
	-p $TAUTULLI_PORT:8181 \
	-v $TAUTULLI_CONFIG:/config \
	--privileged \
	linuxserver/tautulli
  docker start $TAUTULLI_NAME
fi

