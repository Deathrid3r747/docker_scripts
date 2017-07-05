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

# Using files to install containers

- clone this repo to your local maching `git clone https://github.com/Deathrid3r747/docker_scripts`
- cd to the directory `cd docker_scripts`
- make file executable `chmod +x *.sh`
- Using your favourite editor, edit each of the files and make sure all the volumes (Starting with `-v`) point to the correct paths for your setup
- Save and execute the files
- You will get a message similar to `Error response from daemon: No such container: `, this is normal and is the part of the script that removes old containers when upgrading

# Using files to update containers

- Assumes you installed the containers using these scripts
- Execute the script for the container you wish to upgrade
- If a newer image is available, it will be downloaded, the running container will be killed, and the new version created and stared
- All the configuration will be kept when updating (Assuming volumes are mapped correctly)
- *TODO: Run updates using cron*
