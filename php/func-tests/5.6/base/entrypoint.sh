#!/usr/bin/env bash

addgroup phpbb --gid $TEST_GID
adduser --disabled-password --ingroup phpbb --gecos "" --uid $TEST_UID phpbb

echo "Starting php-fpm..."
php-fpm --allow-to-run-as-root >/dev/null 2>&1 &
sleep 1

echo "Starting nginx..."
nginx -g 'daemon on;' >/dev/null 2>&1 &
sleep 1

echo "Running command..."
runuser -m phpbb -s /bin/bash -c "$*"
