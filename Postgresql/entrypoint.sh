#!/bin/bash

/etc/init.d/postgresql start

/etc/init.d/ssh start

tail -f /var/log/postgresql/postgresql-${VERSION_POSTGRESQL}-main.log
