#!/usr/bin/env bash

# Updates php images
docker pull php:5.4
docker pull php:5.5
docker pull php:5.6
docker pull php:7.0
docker pull php:5.4-fpm
docker pull php:5.5-fpm
docker pull php:5.6-fpm
docker pull php:7.0-fpm

# Build all the new images

jobs=$1
jobs=${jobs:=4}

#parallel -j $jobs -a container-list ./build.sh
parallel -j 1 -a container-list ./build.sh
