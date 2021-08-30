


FROM php:7.2.1-apache



RUN apt-get update && apt-get -y install sudo
RUN apt-get -y install vim



ADD ./index.html /var/www/html/index.html
RUN chmod -R 755 /var/www

