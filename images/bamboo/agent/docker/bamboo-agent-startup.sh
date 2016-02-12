#!/bin/bash

# start the docker daemon
#LOG=file /usr/local/bin/wrapdocker &
#docker daemon -s overlay &>/var/log/docker.log
/usr/local/bin/wrapdocker docker daemon \
		--host=unix:///var/run/docker.sock \
		--host=tcp://0.0.0.0:2375 \
		--storage-driver=vfs &

# start the bamboo agent
runuser -m atlassian -s /bin/bash -c "/bamboo/run-agent.sh /bamboo/home/"

