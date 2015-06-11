#!/bin/bash

docker push phpbb/bamboo-agent-docker
docker push phpbb/bamboo-agent-state

docker push phpbb/php-ut-5.4-mysql
docker push phpbb/php-ut-5.5-mysql
docker push phpbb/php-ut-5.6-mysql

docker push phpbb/php-ut-5.4-postgres
docker push phpbb/php-ut-5.5-postgres
docker push phpbb/php-ut-5.6-postgres

docker push phpbb/build
