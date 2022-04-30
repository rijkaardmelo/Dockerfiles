#!/bin/bash

/etc/init.d/bind9 start

tail -f /var/log/bind9/bind9.log