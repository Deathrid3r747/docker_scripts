#! /bin/bash

echo "Update Ombi"
/home/server/docker_scripts/ombi.sh

echo "Update Organizr"
/home/server/docker_scripts/organizr.sh

echo "Update Radarr"
/home/server/docker_scripts/radarr.sh

echo "Update Sonarr"
/home/server/docker_scripts/sonarr.sh

echo "Update Unifi"
/home/server/docker_scripts/unifi.sh

#echo "Update Unifi-Video"
#/home/server/docker_scripts/unifi-video.sh
