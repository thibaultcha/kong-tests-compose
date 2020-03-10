#!/bin/bash
set -e

PG_PASSWORD=postgres psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE user kong;
    CREATE DATABASE kong;
    CREATE DATABASE kong_tests;
    GRANT ALL PRIVILEGES ON DATABASE kong TO kong;
    GRANT ALL PRIVILEGES ON DATABASE kong_tests TO kong;
    \c kong;
    ALTER SCHEMA public OWNER TO kong;
    \c kong_tests;
    ALTER SCHEMA public OWNER TO kong;
EOSQL
