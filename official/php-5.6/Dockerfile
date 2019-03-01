FROM php:5.6-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) bcmath iconv mcrypt mysql mysqli pdo_mysql zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL 'https://github.com/alanxz/rabbitmq-c/releases/download/v0.5.2/rabbitmq-c-0.5.2.tar.gz' -o rabbitmq-c.tar.gz \
    && mkdir -p rabbitmq-c \
    && tar -xf rabbitmq-c.tar.gz -C rabbitmq-c --strip-components=1 \
    && rm rabbitmq-c.tar.gz \
    && ( \
        cd rabbitmq-c \
        && ./configure \
        && make \
        && make install \
    ) \
    && rm -r rabbitmq-c \
    && curl -fsSL 'http://pecl.php.net/get/amqp-1.4.0.tgz' -o amqp.tar.gz \
    && mkdir -p amqp \
    && tar -xf amqp.tar.gz -C amqp --strip-components=1 \
    && rm amqp.tar.gz \
    && ( \
        cd amqp \
        && phpize \
        && ./configure \
        && make \
        && make install \
    ) \
    && rm -r amqp \
    && docker-php-ext-enable amqp
