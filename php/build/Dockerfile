FROM php:5.4
MAINTAINER Tristan Darricau <docker@nicofuma.fr>

RUN apt-get update \
	&& apt-get install -y \
             git \
             zlib1g-dev \
	&& docker-php-ext-install zip \
	&& rm -r /var/lib/apt/lists/*
