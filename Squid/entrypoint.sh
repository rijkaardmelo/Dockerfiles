#!/bin/bash

# Iniciando o serviço do postgresql
/etc/init.d/squid enable
# /etc/init.d/squid start

# Iniciando o serviço do ssh
/etc/init.d/ssh enable
/etc/init.d/ssh start

# Exibindo os logs do serviço do postgresql 
tail -f /var/log/squid/cache.log