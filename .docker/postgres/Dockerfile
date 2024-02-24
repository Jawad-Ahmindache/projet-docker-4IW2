FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add --no-cache postgresql postgresql-contrib

RUN mkdir -p /docker-entrypoint-initdb.d

COPY ./init.sql /docker-entrypoint-initdb.d/

WORKDIR /var/lib/postgresql/data

CMD ["postgres"]
