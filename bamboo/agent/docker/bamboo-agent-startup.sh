#!/bin/bash

# start the docker daemon
LOG=file /usr/local/bin/wrapdocker &

# start the bamboo agent
runuser -m atlassian -s /bin/bash -c "/bamboo/run-agent.sh /bamboo/home/"

