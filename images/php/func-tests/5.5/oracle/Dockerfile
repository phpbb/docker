FROM phpbb/php-ft-5.5-base:latest
MAINTAINER Tristan Darricau <docker@nicofuma.fr>

RUN apt-get update \
	&& apt-get install -y zip libaio1 \
	&& rm -r /var/lib/apt/lists/*

# Oracle instantclient
ADD instantclient-basic-linux.x64-12.1.0.2.0.zip /tmp/
ADD instantclient-sdk-linux.x64-12.1.0.2.0.zip /tmp/
ADD instantclient-sqlplus-linux.x64-12.1.0.2.0.zip /tmp/

RUN unzip /tmp/instantclient-basic-linux.x64-12.1.0.2.0.zip -d /usr/local/ && rm /tmp/instantclient-basic-linux.x64-12.1.0.2.0.zip
RUN unzip /tmp/instantclient-sdk-linux.x64-12.1.0.2.0.zip -d /usr/local/ && rm /tmp/instantclient-sdk-linux.x64-12.1.0.2.0.zip
RUN unzip /tmp/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip -d /usr/local/ && rm /tmp/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip
RUN ln -s /usr/local/instantclient_12_1 /usr/local/instantclient
RUN ln -s /usr/local/instantclient /usr/local/instantclient/12.1
RUN ln -s /usr/local/instantclient/libclntsh.so.12.1 /usr/local/instantclient/libclntsh.so
RUN ln -s /usr/local/instantclient/sqlplus /usr/bin/sqlplus

RUN docker-php-ext-configure oci8 --with-oci8=instantclient,/usr/local/instantclient \
	&& docker-php-ext-install oci8 \
	&& docker-php-ext-configure pdo_oci --with-pdo-oci=instantclient,/usr/local/instantclient,12.1 \
	&& docker-php-ext-install pdo_oci
