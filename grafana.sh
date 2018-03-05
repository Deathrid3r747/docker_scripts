#!/usr/bin/env bash

source config.conf
docker pull grafana/grafana
  echo "Upgrading container"
  docker stop $GRAFANA_NAME
  docker rm $GRAFANA_NAME
  docker create \
	--name $GRAFANA_NAME \
	--restart=always \
	--net $GRAFANA_NET \
	--ip $GRAFANA_IP \
	-p $GRAFANA_PORT:3000 \
	-e PUID=0 \
	-e PGID=0 \
	-v /mnt/Media/Containers/grafana/log:/var/log/grafana \
	-v /mnt/Media/Containers/grafana/lib:/var/lib/grafana \
	--privileged \
	grafana/grafana
  docker start $GRAFANA_NAME
