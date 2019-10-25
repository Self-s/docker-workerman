FROM php
MAINTAINER 741162948@qq.com
RUN apt-get update
RUN apt-get install libevent-dev -y
RUN docker-php-ext-install pcntl pdo_mysql sockets 
RUN pecl install redis 
RUN docker-php-ext-enable redis
RUN sh -c '/bin/echo -e "no\nyes\n/usr\nno\nyes\nno\nyes\nno" | pecl install event'
RUN docker-php-ext-enable event
RUN docker-php-source delete
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
