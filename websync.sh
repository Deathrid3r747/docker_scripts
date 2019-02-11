#!/bin/bash

sudo docker run --name websync -d -p 3001:3000 -v /mnt/Media:/mnt/Media -w /src furier/websync node server.js
