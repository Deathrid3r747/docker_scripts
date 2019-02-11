#!/usr/bin/env bash

source config.conf

docker pull grafana/grafana
  echo "Upgrading container"
  docker stop $GRAFANA_NAME
  docker rm $GRAFANA_NAME
  docker create \
        --name=$GRAFANA_NAME \
        --restart=always \
        --net $GRAFANA_NET \
        --ip $GRAFANA_IP \
        -p $GRAFANA_PORT:3000 \
        --privileged \
        --volume $GRAFANA_CONFIG \
        grafana/grafana
  docker start $GRAFANA_NAME

