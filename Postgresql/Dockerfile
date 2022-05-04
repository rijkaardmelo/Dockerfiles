# syntax=docker/dockerfile:1

# Baixando base de uma image debian 
FROM debian:buster

# Criando uma variavel de ambiente
ENV VERSION_POSTGRESQL=9.3

ARG DEBIAN_FRONTEND=noninteractive

# Atualizando a image debian
RUN apt update && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y

# Instalando uns pacotes para instalação do postgresql
# instalando os editores vim e nano
# Instalando o serviço ssh
# Agente do zabbix
RUN apt install -y gnupg wget vim nano openssh-server

# Baixando a chave de verificação do postgresql 
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Inserindo o pacote de instalação do postgresql no repositorio do debian 
RUN echo "deb http://apt.postgresql.org/pub/repos/apt buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# Atualizando o repositorio
RUN apt-get update 

# Instalando o postgresql
RUN apt-get install -y postgresql-${VERSION_POSTGRESQL} postgresql-client-${VERSION_POSTGRESQL} postgresql-contrib-${VERSION_POSTGRESQL}

# Copiando o arquivo config.sh para raiz do container
COPY config.sh .

# Copiando o arquivo database-config.sh para raiz do container
COPY database-config.sh .

# Copiando o arquivo entrypoint.sh para raiz do container
COPY entrypoint.sh .

# chmod 755 (chmod a+rwx,g-w,o-w) define permissões para que, o "usuário dono root" possa ler, possa escrever/gravar e possa executar. 
# (G) O grupo pode ler, não pode escrever e pode executar. 
# (O) todo mundo não pode ler, não podem escrever/gravar e podem executar.
RUN chmod 755 config.sh database-config.sh entrypoint.sh

# Acessando o usuário postgres
USER postgres

# Executando os comandos de configurações do banco atraves do arquivo database-config.sh
RUN /database-config.sh

# Acessando o usuário root
USER root

# Executando os comandos de configurações do container atraves do arquivo config.sh
RUN /config.sh

# Liberando porta de acesso ao container, 5432 (postgresql) e 22 (ssh)
EXPOSE 5432 22

# Definindo os volumes no qual o docker vai reter as informações
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Executando os comandos que vai inicializar junto com o container, atraves do arquivo entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]