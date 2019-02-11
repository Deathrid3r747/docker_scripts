#!/usr/bin/env bash

source config.conf
docker pull homeassistant/home-assistant

if docker ps | grep -q "homeassistant/home-assistant"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $HASSIO_NAME
  docker rm $HASSIO_NAME
  docker create \
        --name $HASSIO_NAME \
        --restart=always \
        --net $HASSIO_NET \
        --ip $HASSIO_IP \
        -p $HASSIO_PORT:8123 \
        -p $HASSIO_CERT_PORT:80 \
        -v $HASSIO_CONFIG:/config \
        -e "TZ=Africa/Johannesburg" \
        --privileged \
        homeassistant/home-assistant
  docker start $HASSIO_NAME
fi
