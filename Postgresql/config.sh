#!/bin/bash

useradd -m administrador

echo "administrador:administrador" | chpasswd

passwd --expire administrador

echo "root:root" | chpasswd

passwd --expire root    

sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config

rm /database-config.sh

rm /config.sh