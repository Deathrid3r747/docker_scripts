#!/usr/bin/env bash

source config.conf
docker pull linuxserver/couchpotato

#if docker ps | grep -q "linuxserver/couchpotato"; then
#  echo "Already running latest image"
#else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $COUCH_NAME
  docker rm $COUCH_NAME
  docker create \
	--name=$COUCH_NAME \
	-v $COUCH_CONFIG:/config \
	$COUCH_VOLUMES \
	--privileged \
	-e PUID=0  \
	-e PGID=0 \
	-e TZ=Africa/Johannesburg \
	--net $COUCH_NET \
	--ip $COUCH_IP \
	-p $COUCH_PORT:5050 \
    linuxserver/couchpotato
  docker start $COUCH_NAME
#fi
