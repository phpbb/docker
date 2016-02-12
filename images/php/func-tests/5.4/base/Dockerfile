FROM php:5.4-fpm
MAINTAINER Tristan Darricau <docker@nicofuma.fr>

RUN mkdir -p /var/www/html/cache /var/www/html/store /var/www/html/files /var/www/html/images/avatars/upload/
RUN chown www-data:www-data /var/www/html/cache /var/www/html/store /var/www/html/files /var/www/html/images/avatars/upload/

VOLUME /var/www/html/cache
VOLUME /var/www/html/store
VOLUME /var/www/html/files
VOLUME /var/www/html/images/avatars/upload/

COPY php-fpm.conf /usr/local/etc/

# Install nginx
RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list

ENV NGINX_VERSION 1.9.2-1~jessie

RUN apt-get update && \
    apt-get install -y ca-certificates nginx=${NGINX_VERSION} && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["/entrypoint.sh"]
