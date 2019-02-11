#!/usr/bin/env bash

cd UniFi-Video-Controller
git pull
docker build . -t unifi-video

source /home/server/docker_scripts/config.conf
#docker pull pducharme/unifi-video-controller:3.9.8

#if docker ps | grep -q "pducharme/unifi-video-controller"; then
#  echo "Already running latest image"
#else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop unifi-video
  docker rm unifi-video
  docker create \
	--name unifi-video \
	--restart=always \
	-p 10001:10001 \
        -p 1935:1935 \
        -p 6666:6666 \
        -p 7080:7080 \
        -p 7442:7442 \
        -p 7443:7443 \
        -p 7444:7444 \
        -p 7445:7445 \
        -p 7446:7446 \
        -p 7447:7447 \
	-v /home/server/docker_config/unifi-video:/var/lib/unifi-video \
        -v /mnt/Media/unifi-video:/var/lib/unifi-video/videos \
	-e TZ=Africa/Johannesburg \
	-e PUID=0 \
	-e PGID=0 \
	--privileged \
	unifi-video
  docker start unifi-video
#fi
