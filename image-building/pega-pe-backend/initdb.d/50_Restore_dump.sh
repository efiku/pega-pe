#!/bin/sh

if [ -f "$PEGA_DUMP" ];then
    psql --command="ALTER USER $POSTGRES_USER SET SEARCH_PATH to \"\$user\",rules,data,public;" --echo-all --echo-queries
    pg_restore -v --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -O "$PEGA_DUMP"
    echo "Restore complete."

else
    echo "$PEGA_DUMP file not found. Please make sure this file is present, and run again"
    rm -rf "$PGDATA"/*
    exit 1
fi