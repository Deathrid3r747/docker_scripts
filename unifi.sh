#!/usr/bin/env bash

docker pull deathrid3r747/unifi

if docker ps | grep -q "deathrid3r747/unifi"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop unifi
  docker rm unifi
  docker create \
	--name=unifi \
        --restart=always \
	-v /opt/docker/unifi:/config \
	-e PGID=0 \
	-e PUID=0 \
	-p 8080:8080 \
	-p 8081:8081 \
	-p 8443:8443 \
	-p 8843:8843 \
	-p 8880:8880 \
	--privileged \
	deathrid3r747/unifi
  docker start unifi
fi

