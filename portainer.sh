#!/usr/bin/env bash

docker pull portainer/portainer

if docker ps | grep -q "portainer/portainer"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop portainer
  docker rm portainer
  docker create \
	--name=portainer \
	--restart=always \
	--privileged \
	-p 9000:9000 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	portainer/portainer
  docker start portainer
fi

