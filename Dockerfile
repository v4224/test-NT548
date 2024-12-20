FROM php:8.2-apache

RUN docker-php-ext-install mysqli pdo pdo_mysql

COPY ./front-end /var/www/html
COPY ./back-end /var/www/html/back-end

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80