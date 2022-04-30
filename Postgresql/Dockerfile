# Imagem de instalação 
FROM debian:buster

RUN useradd -u 123456 administrador

# Adicionando o postgresql no repositório
RUN apt update && apt upgrade -y

# Instalando algumas ferramentas de instalação do postgresql
RUN apt install -y gnupg wget

# Adicionando a chave de verificação do repositório
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Adicionando o postgresql no repositório
RUN echo "deb http://apt.postgresql.org/pub/repos/apt buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# Install ``python-software-properties``, ``software-properties-common`` and PostgreSQL 9.3
#  There are some warnings (in red) that show up during the build. You can hide
#  them by prefixing each apt-get statement with DEBIAN_FRONTEND=noninteractive

# Adicionando o postgresql no repositório
RUN apt-get update 

# Instalandos os pacotes do postgresql
RUN apt-get install -y postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3

# Limpando restigios de instalações
# RUN apt autoclean -y

# RUN useradd administrador

# Run the rest of the commands as the ``postgres`` user created by the ``postgres-9.3`` package when it was ``apt-get installed``
USER postgres

# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.

# Inicializando o serviço do postgresql por seguraça
# Criando um superusuario, "admin", com a senha "123456"
# Criando um banco de dados 
RUN /etc/init.d/postgresql start && \
    psql --command "CREATE USER admin WITH SUPERUSER PASSWORD 'docker';"  && \
    createdb -O admin docker

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

# Liberando a porta do serviço do postgresql, 5432
EXPOSE 5432

# Criando um volume de backup das configurações, logs e do banco de dados
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Set the default command to run when starting the container
# CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]