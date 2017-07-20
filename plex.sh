#!/usr/bin/env bash

docker pull plexinc/pms-docker

if docker ps | grep -q "plexinc/pms-docker"; then
  echo "Already running latest image"
else
  echo "New image pulled"
  echo "Upgrading container"
  docker stop plex
  docker rm plex
 	docker run \
	 -d \
	 --name plex \
	 --privileged \
	 --restart=always \
	 -p 32400:32400/tcp \
	 -p 3005:3005/tcp \
	 -p 8324:8324/tcp \
	 -p 32469:32469/tcp \
	 -p 1900:1900/udp \
	 -p 32410:32410/udp \
	 -p 32412:32412/udp \
	 -p 32413:32413/udp \
	 -p 32414:32414/udp \
	 -e TZ="<timezone>" \
	 -e PLEX_CLAIM="<claimToken>" \
	 -h <HOSTNAME> \
	 -v <path/to/plex/database>:/config \
	 -v <path/to/transcode/temp>:/transcode \
	 -v <path/to/media>:/data \
	 plexinc/pms-docker
  docker start plex
fi

