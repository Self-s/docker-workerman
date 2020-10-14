FROM php
MAINTAINER "Jared Lee" <741162948@qq.com>

# workerman是基于PHP命令行运行的 所以不需要php-fpm
# workerman是常驻内存的 所以也不需要opcache扩展

# 只要在php官方镜像基础上开启那些workerman需要的模块就可以了
# 开启需要的模块可以用php官方镜像里提供的命令docker-php-ext-install
# redis和event扩展 自带命令不能安装 用pecl安装

RUN apt-get update

# 安装必要的扩展 扩展posix已经默认开启 还需要pcntl sockets
RUN docker-php-ext-install pcntl sockets

# 安装event event扩展需要依赖libevent-dev
RUN apt-get install libevent-dev -y \
     && sh -c '/bin/echo -e "no\nyes\n/usr\nno\nyes\nno\nyes\nno" | pecl install event' \
     && docker-php-ext-enable event

# 安装redis扩展 不需要可以不安装
RUN pecl install redis \
     && docker-php-ext-enable redis

# 安装pdo_mysql redis扩展 不需要可以不安装
RUN docker-php-ext-install pdo_mysql

# 启用正式环境的php.ini配置文件
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# 安装composer
RUN apt-get install git unzip -y \
     && php -r "copy('https://mirrors.aliyun.com/composer/composer.phar', 'composer.phar');"  \
     && mv composer.phar /usr/local/bin/composer \
     && chmod +x /usr/local/bin/composer \
     && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

# 清理文件
RUN docker-php-source delete \
     && apt-get clean \
     && rm -rf /tmp/* /var/cache/* /var/www/html/*

RUN  groupadd -g 1000 workerman \
     && useradd -c workerman -g workerman -u 1000 workerman -m

# 启动参数
ENV MY_USER=workerman
ENV MY_GROUP=workerman

# 启动脚本
COPY ./data/docker-entrypoint.d /docker-entrypoint.d
COPY ./data/docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

