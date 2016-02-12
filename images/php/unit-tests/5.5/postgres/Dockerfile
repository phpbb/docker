FROM php:5.5
MAINTAINER Tristan Darricau <docker@nicofuma.fr>

RUN addgroup --system atlassian --uid 1100
RUN adduser --system --no-create-home --disabled-login --ingroup atlassian --uid 1100 atlassian

RUN apt-get update \
	&& apt-get install -y libpq-dev \ 
	&& docker-php-ext-install pdo_pgsql pgsql \
	&& rm -r /var/lib/apt/lists/*
