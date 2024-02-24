FROM alpine:edge as main

RUN apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/main add \
    icu-libs \
    && apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/community add \
    libavif \
    gnu-libiconv \
    tini \
    php83 \
    php83-dev \
    php83-common \
    php83-gd \
    php83-xmlreader \
    php83-bcmath \
    php83-ctype \
    php83-curl \
    php83-exif \
    php83-iconv \
    php83-intl \
    php83-mbstring \
    php83-opcache \
    php83-openssl \
    php83-pcntl \
    php83-phar \
    php83-session \
    php83-xml \
    php83-xsl \
    php83-zip \
    php83-zlib \
    php83-dom \
    php83-fpm \
    php83-sodium \
    php83-tokenizer \
    php83-pecl-apcu \
    php83-pdo \
    php83-pdo_pgsql \
    && ln -sf /usr/bin/php83 /usr/bin/php

WORKDIR /var/www/html

ADD https://www.adminer.org/latest.php index.php

CMD ["php", "-S", "0.0.0.0:8080"]
