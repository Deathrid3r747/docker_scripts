#!/usr/bin/env bash

source /home/server/docker_scripts/config.conf
docker pull lsiocommunity/organizr

if docker ps | grep -q "lsiocommunity/organizr"; then
  echo "Already running latest image"
else
  echo "Upgrading container"
  docker stop $ORGANIZR_NAME
  docker rm $ORGANIZR_NAME
  docker create \
    --name $ORGANIZR_NAME \
    -v $ORGANIZR_CONFIG:/config \
    -p $ORGANIZR_PORT:80 \
    --privileged \
    --restart=always lsiocommunity/organizr
  docker start $ORGANIZR_NAME
fi
