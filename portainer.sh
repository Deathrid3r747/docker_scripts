#!/usr/bin/env bash

source config.conf
docker pull portainer/portainer

if docker ps | grep -q "portainer/portainer"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $PORT_NAME
  docker rm $PORT_NAME
  docker create \
	--name=$PORT_NAME \
	--restart=always \
	--privileged \
	-p $PORT_PORT:9000 \
	--net $PORT_NET \
	--ip $PORT_IP \
	-v /var/run/docker.sock:/var/run/docker.sock \
	portainer/portainer
  docker start $PORT_NAME
fi

