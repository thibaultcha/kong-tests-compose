#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE user kong;
    CREATE DATABASE kong;
    CREATE DATABASE kong_tests;
    GRANT ALL PRIVILEGES ON DATABASE kong TO kong;
    GRANT ALL PRIVILEGES ON DATABASE kong_tests TO kong;
EOSQL
