#!/bin/bash

/etc/init.d/postgresql start

while :; do
    echo "PostgreSQL rodando ..."
    sleep 5
done