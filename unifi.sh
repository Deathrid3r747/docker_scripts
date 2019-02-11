#!/usr/bin/env bash

source /home/server/docker_scripts/config.conf
docker pull brettm357/unifi:latest

if docker ps | grep -q "brettm357/unifi"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $UNIFI_NAME
  docker rm $UNIFI_NAME
  docker create \
	--name $UNIFI_NAME \
	--restart=always \
	-v $UNIFI_CONFIG:/usr/lib/unifi/data \
	-p 8080:8080 \
	-p 8081:8081 \
	-p 8443:8443 \
	-p 8843:8843 \
	-p 8880:8880 \
	-p 3478:3478/udp \
	-e PUID=0 \
	-e PGID=0 \
	-m 1g \
	--privileged \
	brettm357/unifi:latest
  docker start $UNIFI_NAME
fi
