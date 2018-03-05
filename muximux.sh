#!/usr/bin/env bash

source config.conf
docker pull linuxserver/muximux

#if docker ps | grep -q "linuxserver/sonarr"; then
#  echo "Already running latest image"
#else
  echo "Upgrading container"
  docker stop $MUX_NAME
  docker rm $MUX_NAME
  docker create \
	--name $MUX_NAME \
	--restart=always \
	--net $MUX_NET \
	--ip $MUX_IP \
	-p $MUX_PORT:80 \
	-e TZ=Africa/Johannesburg \
	-v $MUX_CONFIG:/config \
	--privileged \
	linuxserver/muximux
  docker start $MUX_NAME
#fi
