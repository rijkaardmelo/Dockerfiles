#!/bin/bash

# Iniciando o serviço do postgresql
/etc/init.d/postgresql start

# Craindo um superusuario pelo psql   
psql --command "CREATE USER administrador WITH SUPERUSER PASSWORD 'administrador';" 

# Criando o banco db_transparencia
createdb -O administrador db_transparencia

# Criando o banco db_sgi
createdb -O administrador db_sgi

# liberando os ips para o acesso remoto
echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/${VERSION_POSTGRESQL}/main/pg_hba.conf

# Endereço permitidos as executar ações no banco de dados 
echo "listen_addresses='*'" >> /etc/postgresql/${VERSION_POSTGRESQL}/main/postgresql.conf