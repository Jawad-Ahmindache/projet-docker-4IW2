FROM alpine:edge as main

WORKDIR /app

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
    # Iconv Fix
    php83-pecl-apcu \
    && ln -sf /usr/bin/php83 /usr/bin/php

RUN apk add bash wget git
RUN git config --global user.email "symfony@example.com" && git config --global user.name "Name"
RUN wget https://get.symfony.com/cli/installer -O - | bash \
    && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony
COPY ./.docker/symfony/init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 8000
CMD ["/init.sh"]