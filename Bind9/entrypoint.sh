#!/bin/bash

useradd -m administrador

echo "administrador:administrador" | chpasswd

passwd --expire administrador

echo "root:root" | chpasswd

passwd --expire root

chmod 755 /etc/bind/named.conf.log

mkdir /var/log/bind/

cat > /var/log/bind/bind.log

chown bind:bind /var/log/bind/

service bind9 start

service ssh start

tail -f /var/log/bind/bind.log