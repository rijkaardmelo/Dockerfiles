FROM debian:bullseye

# Atualizando a image debian
RUN apt update && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y

RUN apt install -y vim nano openssh-server

RUN apt -y install squid

COPY entrypoint.sh .

RUN chmod 755 entrypoint.sh

EXPOSE 3128 22

ENTRYPOINT ["/entrypoint.sh"]