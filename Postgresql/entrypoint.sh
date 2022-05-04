#!/bin/bash

# Iniciando o serviço do postgresql
/etc/init.d/postgresql start

# Iniciando o serviço do ssh
/etc/init.d/ssh start

# Exibindo os logs do serviço do postgresql 
tail -f /var/log/postgresql/postgresql-${VERSION_POSTGRESQL}-main.log
