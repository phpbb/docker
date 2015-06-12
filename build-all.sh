#!/bin/bash

docker build -t phpbb/bamboo-agent-docker bamboo/agent/docker
docker build -t phpbb/bamboo-agent-state bamboo/agent/state

docker build -t phpbb/php-ut-5.4-mysql:1 php/unit-tests/5.4/mysql/
docker build -t phpbb/php-ut-5.5-mysql:1 php/unit-tests/5.5/mysql/
docker build -t phpbb/php-ut-5.6-mysql:1 php/unit-tests/5.6/mysql/

docker build -t phpbb/php-ut-5.4-postgres:1 php/unit-tests/5.4/postgres/
docker build -t phpbb/php-ut-5.5-postgres:1 php/unit-tests/5.5/postgres/
docker build -t phpbb/php-ut-5.6-postgres:1 php/unit-tests/5.6/postgres/

docker build -t phpbb/build:1 php/build/
