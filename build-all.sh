#!/usr/bin/env bash

# Build all the new images

jobs=$1
jobs=${jobs:=4}

# parallel -j $jobs -a container-list ./build.sh
parallel -j 1 -a container-list ./build.sh
