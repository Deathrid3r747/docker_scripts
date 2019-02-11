#!/usr/bin/env bash

#https://github.com/freefoote/docker-mosquitto-simple

source config.conf
docker pull $MQTT_REPO

if docker ps | grep -q "$MQTT_REPO"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $MQTT_NAME
  docker rm $MQTT_NAME
  docker create \
        --name $MQTT_NAME \
        --restart=always \
        --net $MQTT_NET \
        --ip $MQTT_IP \
        -p $MQTT_PORT:1883 \
        --privileged \
        -v $MQTT_CONFIG/config:/mqtt/config:ro \
	-v $MQTT_CONFIG/log:/mqtt/log \
	-v $MQTT_CONFIG/data/:/mqtt/data/ \
        $MQTT_REPO
  docker start $MQTT_NAME
fi
