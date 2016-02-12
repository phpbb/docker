FROM java:8-jdk
MAINTAINER Tristan Darricau <docker@nicofuma.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN addgroup --system atlassian --uid 1100
RUN adduser --system --no-create-home --disabled-login --ingroup atlassian --uid 1100 atlassian

# Let's start with some basic stuff.
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables

# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ | sh

ADD wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
VOLUME /var/lib/docker

# Make sure that the "atlassian" user from atlassian's image is part of the "docker"
# group. Needed to access the docker daemon's unix socket.
RUN usermod -a -G docker atlassian

# place the bamboo slave startup script into the container
RUN mkdir /bamboo
ADD https://bamboo.phpbb.com/agentServer/agentInstaller/atlassian-bamboo-agent-installer-5.8.1.jar /bamboo/atlassian-bamboo-agent-installer.jar
ADD bamboo-agent-startup.sh /bamboo/
ADD run-agent.sh /bamboo/
RUN chmod 755 /bamboo/run-agent.sh /bamboo/bamboo-agent-startup.sh /bamboo/atlassian-bamboo-agent-installer.jar
RUN chown -R atlassian:atlassian /bamboo/

CMD ["/bamboo/bamboo-agent-startup.sh"]

