FROM php:7.2-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) bcmath iconv mysqli pdo_mysql zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL 'http://pecl.php.net/get/mcrypt-1.0.1.tgz' -o mcrypt.tgz \
    && mkdir -p mcrypt \
    && tar -xf mcrypt.tgz -C mcrypt --strip-components=1 \
    && rm mcrypt.tgz \
    && ( \
        cd mcrypt \
        && phpize \
        && ./configure \
        && make \
        && make install \
    ) \
    && rm -r mcrypt \
    && docker-php-ext-enable mcrypt
