#!/usr/bin/env bash

build_image() {
    echo -e "\e[0;32mBuilding $1 with $2\e[0m"

    if [[ ! $DOCKER_BUILD_DRYRUN == 1 ]]
    then
        log=$(docker build -t "$1" "$2")
        res=$?
    else
        res=0
    fi

    return $res
}

# Build an image if it doesn't already exists

# Usage: One argument with the image name (with its tag) followed by a space and the build file
# example: "phpbb/php-ft-5.4-postgres:1 php/unit-tests/5.4/postgres/"

if [[ -z $1 ]]
then
    exit
fi

if [[ $1 == \;* ]]
then
    echo -e "\e[0;34mIgnore $1\e[0m"
    exit
fi

arr=($1)
image=${arr[0]}
buildfile=${arr[1]}

arr=(${image//:/ })
image=${arr[0]}
tag=${arr[1]}

# Has the required tag already been built?
if [[ -z $tag ]]
then
    build_image "$image" "$buildfile"
    res=$?
else
    new=$(docker images|grep "$image"'[[:space:]]*'"$tag")

    # Has the required tag already been pushed?
    if [[ -z $new || $DOCKER_BUILD_FORCE == 1 ]]
    then
        build_image "$image:$tag" "$buildfile"
        build_image "$image:latest" "$buildfile"
        res=$?
    else
        echo -e "\e[0;33mSkip $image:$tag\e[0m"
        res=0
    fi
fi

if [[ ! $res == 0 ]]
then
    echo -e $log
fi
exit $res

