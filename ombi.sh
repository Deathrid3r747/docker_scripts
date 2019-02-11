#!/usr/bin/env bash
docker pull linuxserver/ombi
source /home/server/docker_scripts/config.conf

if docker ps | grep -q "linuxserver/ombi"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop $OMBI_NAME
  docker rm $OMBI_NAME
  docker create \
	--name $OMBI_NAME \
	--restart=always \
	--net $OMBI_NET \
	--ip $OMBI_IP \
	-e TZ=Africa\Johannesburg \
	-e PUID=0 \
	-e PGID=0 \
	-v /etc/localtime:/etc/localtime:ro \
	-p $OMBI_PORT:3579 \
	-v $OMBI_CONFIG:/config \
	--privileged \
	linuxserver/ombi
  docker start $OMBI_NAME
fi
