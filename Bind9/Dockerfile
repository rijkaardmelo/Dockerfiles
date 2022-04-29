FROM debian:buster

RUN apt update && apt install -y vim nano bind9

RUN /etc/init.d/named start

EXPOSE 53

VOLUME  ["/etc/bind"]