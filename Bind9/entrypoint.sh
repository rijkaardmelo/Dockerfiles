#!/bin/bash

service bind9 start

service ssh start

tail -f /var/log/bind/bind.log