#!/usr/bin/env bash
docker pull linuxserver/ombi

if docker ps | grep -q "linuxserver/ombi"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop ombi
  docker rm ombi
  docker create \
	--name ombi \
	--restart=always \
	-e TZ=Africa\Johannesburg \
	-e PUID=0 \
	-e PGID=0 \
	-v /etc/localtime:/etc/localtime:ro \
	-p 3579:3579 \
	-v /home/Containers/Ombi:/config \
	--privileged \
	linuxserver/ombi
  docker start ombi
fi