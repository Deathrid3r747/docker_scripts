#!/usr/bin/env bash

source config.conf
docker pull sitespeedio/graphite
echo "Upgrading container"
docker stop $GRAPHITE_NAME
docker rm $GRAPHITE_NAME
docker create \
--name $GRAPHITE_NAME \
--restart=always \
--net $GRAPHITE_NET \
--ip $GRAPHITE_IP \
-p $GRAPHITE_HTTP_PORT:80 \
-p $GRAPHITE_API_PORT:2003 \
-e PUID=0 \
-e PGID=0 \
-v /mnt/Media/Containers/Plexpy:/opt/graphite/storage/whisper \
--privileged \
sitespeedio/graphite
docker start $GRAPHITE_NAME
