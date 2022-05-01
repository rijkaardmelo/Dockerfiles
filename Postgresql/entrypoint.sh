#!/bin/bash

useradd -m administrador

echo "administrador:administrador" | chpasswd

passwd --expire administrador

echo "root:root" | chpasswd

passwd --expire root

service postgresql start

service ssh start

tail -f /var/log/postgresql/postgresql-9.3-main.log
