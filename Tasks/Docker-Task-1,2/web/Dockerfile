# bash /home/Documents/webserversetup.sh


FROM php:7.2.1-apache

VOLUME ["/var/www/html"]

RUN apt-get update && apt-get -y install sudo
# RUN docker-php-ext-install mysqlnd
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install mysqli


ADD ./createMoM.php /home/Documents/tempfiles/createMoM.php
ADD ./login.php /home/Documents/tempfiles/login.php
ADD ./loginpage.php /home/Documents/tempfiles/loginpage.php
ADD ./moms.local.php /home/Documents/tempfiles/moms.local.php
ADD ./viewMoMfiltered.php /home/Documents/tempfiles/viewMoMfiltered.php
ADD ./dashboard.php /home/Documents/tempfiles/dashboard.php
ADD ./index.php /home/Documents/tempfiles/index.php
ADD ./logout.php /home/Documents/tempfiles/logout.php
ADD ./createacc.php /home/Documents/tempfiles/createacc.php
# ADD ./allusers.php /home/Documents/tempfiles/allusers.php




ADD ./webserversetup.sh /home/Documents/webserversetup.sh
RUN chmod +x /home/Documents/webserversetup.sh
