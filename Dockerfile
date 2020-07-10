# Pull docker image php:7.2-apache or you can pull image scratch
FROM php:7.2-apache

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y tcl
#RUN apt-get -y install apache2
ADD phpcode/ /var/www/html/project
ENTRYPOINT apachectl -D FOREGROUND
