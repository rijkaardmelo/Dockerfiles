#Imagem de instalação 
FROM debian:buster

#Atualizando o repositorio do debian
RUN apt update 

#Instalandos os editores de textos
#Instalando os serviços do bind
RUN apt install -y vim nano bind9 bind9utils bind9-doc

#Inicializando o serviço do bind9
RUN /etc/init.d/bind9 start

#Exporta porta de acesso 53
EXPOSE 53

#Criando um volume para está pasta de configuração do bind9
VOLUME  ["/etc/bind"]

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]