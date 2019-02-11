#!/usr/bin/env bash

source config.conf
docker pull $MQTT_REPO

if docker ps | grep -q "$NODE_RED_REPO"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $NODE_RED_NAME
  docker rm $NODE_RED_NAME
  docker create \
        --name $NODE_RED_NAME \
        --restart=always \
        --net $NODE_RED_NET \
        --ip $NODE_RED_IP \
        -p $NODE_RED_PORT:1880 \
        -v $NODE_RED_CONFIF:/data \
        --privileged \
        $NODE_RED_REPO
  docker start $NODE_RED_NAME
fi
