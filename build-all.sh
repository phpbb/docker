#!/usr/bin/env bash

# Build all the new images

jobs=$1
jobs=${jobs:=4}

parallel -j $jobs -a container-list ./build.sh
