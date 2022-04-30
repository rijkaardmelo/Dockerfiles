#!/bin/bash

/etc/init.d/bind9 start

while :; do
    echo "DNS rodando ..."
    sleep 5
done