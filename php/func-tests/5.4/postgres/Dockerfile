FROM phpbb/php-ft-5.4-base:1
MAINTAINER Tristan Darricau <docker@nicofuma.fr>

RUN apt-get update \
	&& apt-get install -y libpq-dev \
	&& docker-php-ext-install pdo_pgsql pgsql \
	&& rm -r /var/lib/apt/lists/*
