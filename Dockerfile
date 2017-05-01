FROM ubuntu:16.04
MAINTAINER Ben Roberts <ben@headsnet.com>

ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen en_GB.UTF-8
ENV LANG       en_GB.UTF-8
ENV LC_ALL     en_GB.UTF-8

RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get install -y curl

RUN apt-get update && apt-get install -y \
        php-fpm \
        php-pear \
        php-apcu \
        php-curl \
        php-gd \
        php-imap \
        php-intl \
        php-json \
        php-memcached \
        php-mbstring \
        php-mysql \
        php-sqlite3 \
        php-tidy

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
