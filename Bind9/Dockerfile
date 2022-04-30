FROM debian:buster

RUN apt update && apt install -y vim nano bind9 bind9utils bind9-doc

RUN /etc/init.d/bind9 start

EXPOSE 53

VOLUME  ["/etc/bind"]

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]