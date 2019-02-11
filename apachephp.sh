! /bin/bash

docker run --name app -d -p 8888:80 \
  -v /home/server/docker_config/apachephp/www/app:/var/www/app/ \
  romeoz/docker-apache-php

#docker run --name app -d -p 8888:80 \
# romeoz/docker-apache-php
