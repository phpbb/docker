Bamboo Agent
============

 - `phpbb/bamboo-agent-docker` launch a bamboo agent with the docker support (through docker in docker)
 - `phpbb/bamboo-agent-state` is used in combination with the agent image to store its state

To launch the agent with its state container:
```
docker run --name bamboo-agent-state phpbb/bamboo-agent-state
docker run --privileged -h bamboo-agent -e HOME=/bamboo/home/ -e BAMBOO_SERVER=https://bamboo.phpbb.com/ -d --name bamboo-agent --volume-from bamboo-agent-state phpbb/bamboo-agent-docker
```
