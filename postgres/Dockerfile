FROM postgres:9.4

RUN mkdir -p /docker-entrypoint-initdb.d

COPY init-user-db.sh /docker-entrypoint-initdb.d
