FROM alpine:latest

RUN apk --no-cache add apache2-utils php7 php7-session php7-pdo php7-pdo_pgsql php7-pdo_mysql php7-pdo_sqlite

WORKDIR /var/www/html

ADD https://www.adminer.org/latest.php index.php

CMD ["php", "-S", "0.0.0.0:8080"]
