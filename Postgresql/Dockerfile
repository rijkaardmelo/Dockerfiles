FROM debian:buster

RUN apt update && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y

RUN apt install -y gnupg wget vim nano openssh-server

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN echo "deb http://apt.postgresql.org/pub/repos/apt buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update 

RUN apt-get install -y postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3

# Run the rest of the commands as the ``postgres`` user created by the ``postgres-9.3`` package when it was ``apt-get installed``
USER postgres

# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER administrador WITH SUPERUSER PASSWORD '.!P@92cy18';" &&\
    createdb -O administrador db_transparencia

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

USER root

COPY entrypoint.sh .

RUN chmod 755 entrypoint.sh

EXPOSE 5432

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

ENTRYPOINT ["/entrypoint.sh"]