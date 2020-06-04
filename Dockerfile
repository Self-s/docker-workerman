#workerman是基于PHP命令行运行的 所以不需要php-fpm
#workerman是常驻内存的 所以也不需要opcache扩展

#只要在php官方镜像基础上开启那些workerman需要的模块就可以了
#开启需要的模块可以用php官方镜像里提供的命令docker-php-ext-install
#redis和event扩张 自带命令不能安装 用pecl安装

FROM php
MAINTAINER 741162948@qq.com

RUN apt-get update

#安装必要的扩展 扩展posix已经默认开启 还需要pcntl sockets
RUN docker-php-ext-install pcntl sockets

#安装event event扩展依赖libevent-dev
RUN apt-get install libevent-dev -y
RUN sh -c '/bin/echo -e "no\nyes\n/usr\nno\nyes\nno\nyes\nno" | pecl install event'
RUN docker-php-ext-enable event

#安装pdo_mysql扩展 不需要可以不安装
RUN docker-php-ext-install pdo_mysql

#安装redis扩展 不需要可以不安装
RUN pecl install redis
RUN docker-php-ext-enable redis

RUN docker-php-source delete

#启用正式环境的php.ini配置文件
RUN mv "$PHP_INI_DIR/php.ini-production" "/php.ini"

#用workerman用户来运行容器
RUN groupadd -g 1000 workerman
RUN useradd -g workerman -u 1000 workerman

USER workerman