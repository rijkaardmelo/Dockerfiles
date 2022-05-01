FROM debian:buster

RUN apt update && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y

RUN apt install -y vim nano bind9 bind9utils bind9-doc openssh-server

COPY entrypoint.sh .

COPY named.conf.log /etc/bind

RUN chmod 755 entrypoint.sh

EXPOSE 53

ENTRYPOINT ["/entrypoint.sh"]