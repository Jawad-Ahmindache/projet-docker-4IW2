#!/bin/sh

mkdir -p "$PGDATA"
chmod 700 "$PGDATA"
chown -R postgres:postgres "$PGDATA"

mkdir -p /var/run/postgresql
chmod 775 /var/run/postgresql
chown -R postgres:postgres /var/run/postgresql

if [ -z "$(ls -A "$PGDATA")" ]; then
    su-exec postgres initdb --username="${POSTGRES_USER:-postgres}"
    sed -ri "s/^#(listen_addresses\s*=\s*)\S+/\1'*'/" "$PGDATA/postgresql.conf"

    POSTGRES_PASSWORD="${POSTGRES_PASSWORD:-postgres}"
    pass="PASSWORD '$POSTGRES_PASSWORD'"

    createSql="CREATE DATABASE ${POSTGRES_DB:-$POSTGRES_USER};"
    echo $createSql | su-exec postgres postgres --single -jE

    op=$(if [ "${POSTGRES_USER:-}" != 'postgres' ]; then echo "CREATE"; else echo "ALTER"; fi)
    userSql="$op USER ${POSTGRES_USER:-postgres} WITH SUPERUSER $pass;"
    echo $userSql | su-exec postgres postgres --single -jE

    su-exec postgres pg_ctl -D "$PGDATA" -o "-c listen_addresses=''" -w start

    for f in /docker-entrypoint-initdb.d/*; do
        case "$f" in
            *.sh)  echo "$0: running $f"; . "$f" ;;
            *.sql) echo "$0: running $f"; psql --username "${POSTGRES_USER:-postgres}" --dbname "${POSTGRES_DB:-$POSTGRES_USER}" < "$f" && echo ;;
            *)     echo "$0: ignoring $f" ;;
        esac
        echo
    done

    su-exec postgres pg_ctl -D "$PGDATA" -m fast -w stop

    { echo; echo "host all all 0.0.0.0/0 trust"; } >> "$PGDATA/pg_hba.conf"
fi

exec su-exec postgres "$@"
