FROM busybox
MAINTAINER Tristan Darricau <docker@nicofuma.fr>

RUN adduser -S -D -H -u 1100 atlassian atlassian

RUN mkdir -p /bamboo/home && chown atlassian:atlassian /bamboo/home
VOLUME /bamboo/home

CMD ["echo", "State volume for the bamboo agent"]

