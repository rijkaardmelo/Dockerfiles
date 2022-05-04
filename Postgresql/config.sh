#!/bin/bash

# Criando usuário administrador
useradd -m administrador

# Adicionando senha a usuario administrador
# (usuario:senha)
echo "administrador:administrador" | chpasswd

# Alterar senha no primeiro acesso do usuário administrador
passwd --expire administrador

# Adicionando senha a usuario administrador
# (usuario:senha)
echo "root:root" | chpasswd

# Alterar senha no primeiro acesso do usuário root
passwd --expire root    

# Liberando porta para o acesso do ssh
# Substituindo texto #Port 22 > Port 22 no arquivo /etc/ssh/sshd_config
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config

# Apagando o aquivo database-config.sh
rm /database-config.sh

# Apagando o arquivo config.sh
rm /config.sh