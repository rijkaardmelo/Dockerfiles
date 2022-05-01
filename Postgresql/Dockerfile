FROM debian:buster

RUN apt update && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y

RUN apt install -y gnupg wget openssh-server

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN echo "deb http://apt.postgresql.org/pub/repos/apt buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update 

RUN apt-get install -y postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3

COPY entrypoint.sh .

RUN chmod 755 entrypoint.sh

EXPOSE 5432

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

ENTRYPOINT ["/entrypoint.sh"]