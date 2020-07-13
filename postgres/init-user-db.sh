#!/bin/bash
set -e

PG_PASSWORD=postgres psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE user kong;
    CREATE user kong_ro;

    CREATE DATABASE kong;
    CREATE DATABASE kong_tests;
    GRANT ALL PRIVILEGES ON DATABASE kong TO kong;
    GRANT ALL PRIVILEGES ON DATABASE kong_tests TO kong;

    GRANT CONNECT ON DATABASE kong TO kong_ro;
    GRANT CONNECT ON DATABASE kong_tests TO kong_ro;

    \c kong;
    ALTER SCHEMA public OWNER TO kong;
    ALTER DEFAULT PRIVILEGES FOR ROLE kong IN SCHEMA public GRANT SELECT ON TABLES TO kong_ro;

    \c kong_tests;
    ALTER SCHEMA public OWNER TO kong;
    ALTER DEFAULT PRIVILEGES FOR ROLE kong IN SCHEMA public GRANT SELECT ON TABLES TO kong_ro;
EOSQL
