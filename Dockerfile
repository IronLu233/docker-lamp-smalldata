FROM linode/lamp
LABEL maintainer="lrironsora@gmail.com"

RUN mv /var/www/example.com /var/www/ninechapter.com
ADD config/autocomplete/ /var/www/ninechapter.com/public_html/
WORKDIR /etc/apache2/
ADD config/ninechapter.conf sites-available/
RUN rm -rf sites-enabled/*
RUN a2ensite ninechapter.conf
CMD service mysql start && \
    service apache2 start && \
    /bin/bash

RUN apt-get update && \
    apt-get install wget figlet -y

EXPOSE 80

WORKDIR /root/
ADD config/mysql.sql .
RUN service mysql start && mysql -uroot -pAdmin2015 <mysql.sql && rm /root/mysql.sql
RUN sed "s/bind-address/# bind-addess/" -i /etc/mysql/my.cnf
RUN echo "echo ninechapter | figlet" >> .bashrc
