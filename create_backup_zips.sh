#!/bin/bash

zip -rv "/opt/docker_mnt_Media_Containers_mosquitto-$(date +"%Y-%m-%d").zip" /mnt/Media/Containers/mosquitto
zip -rv "/opt/docker_mnt_Media_Containers_organizr-$(date +"%Y-%m-%d").zip" /mnt/Media/Containers/organizr
#zip -rv "/opt/docker_mnt_Media_Containers_Radarr-$(date +"%Y-%m-%d").zip" /mnt/Media/Containers/Radarr
zip -rv "/opt/docker_mnt_Media_Containers_Sonarr-$(date +"%Y-%m-%d").zip" /mnt/Media/Containers/Sonarr
zip -rv "/opt/docker_mnt_Media_Containers_Plexpy-$(date +"%Y-%m-%d").zip" /mnt/Media/Containers/Plexpy
zip -rv "/opt/docker_mnt_Media_Containers_Phlex-$(date +"%Y-%m-%d").zip" /mnt/Media/Containers/Phlex
zip -rv "/opt/docker_mnt_Media_Containers_Ombi-$(date +"%Y-%m-%d").zip" /mnt/Media/Containers/Ombi
zip -rv "/opt/docker_mnt_Media_Containers_Sabnzbd-$(date +"%Y-%m-%d").zip" /mnt/Media/Containers/Sabnzbd
zip -rv "/opt/docker_mnt_Media_Containers_Muximux-$(date +"%Y-%m-%d").zip" /mnt/Media/Containers/Muximux
zip -rv "/opt/docker_mnt_Media_Containers_resilio-$(date +"%Y-%m-%d").zip" /mnt/Media/Containers/resilio
zip -rv "/opt/docker_mnt_Media_Containers_grafana-$(date +"%Y-%m-%d").zip" /mnt/Media/Containers/grafana
#zip -rv "/opt/docker_mnt_Media_Containers_unifi-$(date +"%Y-%m-%d").zip" /mnt/Media/Containers/unifi

./gdrive-linux-x64 upload --parent 1I60dlG42EQ3QiMzwl7U9xEuk_fZEefn7 "/opt/docker_mnt_Media_Containers_mosquitto-$(date +"%Y-%m-%d").zip"
./gdrive-linux-x64 upload --parent 1I60dlG42EQ3QiMzwl7U9xEuk_fZEefn7 "/opt/docker_mnt_Media_Containers_organizr-$(date +"%Y-%m-%d").zip"
#./gdrive-linux-x64 upload --parent 1I60dlG42EQ3QiMzwl7U9xEuk_fZEefn7 "/opt/docker_mnt_Media_Containers_Radarr-$(date +"%Y-%m-%d").zip"
./gdrive-linux-x64 upload --parent 1I60dlG42EQ3QiMzwl7U9xEuk_fZEefn7 "/opt/docker_mnt_Media_Containers_Sonarr-$(date +"%Y-%m-%d").zip"
./gdrive-linux-x64 upload --parent 1I60dlG42EQ3QiMzwl7U9xEuk_fZEefn7 "/opt/docker_mnt_Media_Containers_Plexpy-$(date +"%Y-%m-%d").zip"
./gdrive-linux-x64 upload --parent 1I60dlG42EQ3QiMzwl7U9xEuk_fZEefn7 "/opt/docker_mnt_Media_Containers_Phlex-$(date +"%Y-%m-%d").zip"
./gdrive-linux-x64 upload --parent 1I60dlG42EQ3QiMzwl7U9xEuk_fZEefn7 "/opt/docker_mnt_Media_Containers_Ombi-$(date +"%Y-%m-%d").zip"
./gdrive-linux-x64 upload --parent 1I60dlG42EQ3QiMzwl7U9xEuk_fZEefn7 "/opt/docker_mnt_Media_Containers_Sabnzbd-$(date +"%Y-%m-%d").zip"
./gdrive-linux-x64 upload --parent 1I60dlG42EQ3QiMzwl7U9xEuk_fZEefn7 "/opt/docker_mnt_Media_Containers_Muximux-$(date +"%Y-%m-%d").zip"
./gdrive-linux-x64 upload --parent 1I60dlG42EQ3QiMzwl7U9xEuk_fZEefn7 "/opt/docker_mnt_Media_Containers_resilio-$(date +"%Y-%m-%d").zip"
./gdrive-linux-x64 upload --parent 1I60dlG42EQ3QiMzwl7U9xEuk_fZEefn7 "/opt/docker_mnt_Media_Containers_grafana-$(date +"%Y-%m-%d").zip"
#./gdrive-linux-x64 upload --parent 1I60dlG42EQ3QiMzwl7U9xEuk_fZEefn7 "/opt/docker_mnt_Media_Containers_unifi-$(date +"%Y-%m-%d").zip"

rm -f "/opt/docker_mnt_Media_Containers_mosquitto-$(date +"%Y-%m-%d").zip"
rm -f "/opt/docker_mnt_Media_Containers_organizr-$(date +"%Y-%m-%d").zip"
#rm -f "/opt/docker_mnt_Media_Containers_Radarr-$(date +"%Y-%m-%d").zip"
rm -f "/opt/docker_mnt_Media_Containers_Sonarr-$(date +"%Y-%m-%d").zip"
rm -f "/opt/docker_mnt_Media_Containers_Plexpy-$(date +"%Y-%m-%d").zip"
rm -f "/opt/docker_mnt_Media_Containers_Phlex-$(date +"%Y-%m-%d").zip"
rm -f "/opt/docker_mnt_Media_Containers_Ombi-$(date +"%Y-%m-%d").zip"
rm -f "/opt/docker_mnt_Media_Containers_Sabnzbd-$(date +"%Y-%m-%d").zip"
rm -f "/opt/docker_mnt_Media_Containers_Muximux-$(date +"%Y-%m-%d").zip"
rm -f "/opt/docker_mnt_Media_Containers_resilio-$(date +"%Y-%m-%d").zip"
rm -f "/opt/docker_mnt_Media_Containers_grafana-$(date +"%Y-%m-%d").zip"
#rm -f "/opt/docker_mnt_Media_Containers_unifi-$(date +"%Y-%m-%d").zip"
