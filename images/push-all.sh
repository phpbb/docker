#!/usr/bin/env bash

# Push all the images

jobs=$1
jobs=${jobs:=4}

parallel -j $jobs -a container-list ./push.sh
