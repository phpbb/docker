#!/usr/bin/env bash

push_image() {
    echo -e "\e[0;32mPushing $1\e[0m"

    if [[ ! $DOCKER_PUSH_DRYRUN == 1 ]]
    then
        log=$(docker push "$1")
        res=$?
    else
        res=0
    fi

    return $res
}

# Usage: One argument with the image name (with its tag)
# example: "phpbb/php-ft-5.4-postgres:1"

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

arr=(${image//:/ })
image=${arr[0]}
tag=${arr[1]}

if [[ -z $tag ]]
then
    push_image "$image"
    res=$?
else
    arg='"name": "'$tag'"'
    new=$(curl https://registry.hub.docker.com//v1/repositories/"$image"/tags 2>/dev/null | grep "$arg")

    # Has the required tag already been pushed?
    if [[ -z $new || $DOCKER_PUSH_FORCE == 1 ]]
    then
        push_image "$image:$tag"
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

