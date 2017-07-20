# docker_scripts

A bunch of scripts for easily installing and updating docker containers

- Unifi Controller
- Sonarr
- Radarr
- Couchpotato
- Sabzb

# Prerequisites
- Docker must be installed and running
- Git must be installed

# Clone scripts

- clone this repo to your local maching `git clone https://github.com/Deathrid3r747/docker_scripts`
- cd to the directory `cd docker_scripts`
- make file executable `chmod +x *.sh`
- Using your favourite editor, edit the script files

# Editing scripts
## Plex

- Please see https://github.com/plexinc/pms-docker  to configure the plex script

# Installing containers

- Save and execute the files
- You will get a message similar to `Error response from daemon: No such container: `, this is normal and is the part of the script that removes old containers when upgrading

# Updating containers
- Execute the script for the container you wish to upgrade
- If a newer image is available, it will be downloaded and the container will be recreated using the new image.
- All the configuration will be kept when updating (Assuming volumes are mapped correctly)
- *TODO: Run updates using cron*
