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

sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config

rm /config.sh
