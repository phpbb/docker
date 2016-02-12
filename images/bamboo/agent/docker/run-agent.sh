#!/bin/sh

echo "HOME: $1"
java -Dbamboo.home="$1" -jar /bamboo/atlassian-bamboo-agent-installer.jar $BAMBOO_SERVER/agentServer/

