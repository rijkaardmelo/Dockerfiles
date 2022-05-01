FROM debian:buster

RUN apt update 

RUN apt install -y vim nano bind9 bind9utils bind9-doc openssh-server

COPY bind.sh /sbin/bind.sh

COPY named.conf.log /etc/bind/named.conf.log

RUN chmod 755 /sbin/bind.sh

EXPOSE 53

ENTRYPOINT ["/sbin/bind.sh"]