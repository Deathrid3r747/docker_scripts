! /bin/bash

docker run --name app1 -d -p 8887:80 -p 8886:443 \
  -v /home/server/docker_config/apachephp2/www/app:/var/www/app/ \
  romeoz/docker-apache-php

#docker run --name app -d -p 8888:80 \
# romeoz/docker-apache-php
