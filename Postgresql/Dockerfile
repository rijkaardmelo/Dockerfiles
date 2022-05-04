# syntax=docker/dockerfile:1
FROM debian:buster

ENV VERSION_POSTGRESQL=9.3

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y

RUN apt install -y gnupg wget vim nano openssh-server

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN echo "deb http://apt.postgresql.org/pub/repos/apt buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update 

RUN apt-get install -y postgresql-${VERSION_POSTGRESQL} postgresql-client-${VERSION_POSTGRESQL} postgresql-contrib-${VERSION_POSTGRESQL}

COPY config.sh .

COPY database-config.sh .

COPY entrypoint.sh .

RUN chmod 755 config.sh database-config.sh entrypoint.sh

USER postgres

RUN /database-config.sh

USER root

RUN /config.sh

EXPOSE 5432

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

ENTRYPOINT ["/entrypoint.sh"]