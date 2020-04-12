FROM php:7-fpm-alpine3.9

RUN apk add bash mysql-client \
    && docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www

RUN rm -rf  /var/www/htmL \
    && ln -s public html

COPY . /var/www

RUN chmod -R 775 storage && chown -R www-data:www-data storage/


RUN curl -s https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

EXPOSE 8000
ENTRYPOINT ["php-fpm"]
