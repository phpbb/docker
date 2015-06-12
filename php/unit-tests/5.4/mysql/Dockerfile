FROM php:5.4
MAINTAINER Tristan Darricau <docker@nicofuma.fr>

RUN addgroup --system atlassian --uid 1100
RUN adduser --system --no-create-home --disabled-login --ingroup atlassian --uid 1100 atlassian

RUN docker-php-ext-install mysqli pdo_mysql mysql
