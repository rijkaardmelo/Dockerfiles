#!/bin/bash

/etc/init.d/postgresql start
    
psql --command "CREATE USER administrador WITH SUPERUSER PASSWORD '123456';" 

createdb -O administrador test

echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/${VERSION_POSTGRESQL}/main/pg_hba.conf

echo "listen_addresses='*'" >> /etc/postgresql/${VERSION_POSTGRESQL}/main/postgresql.conf