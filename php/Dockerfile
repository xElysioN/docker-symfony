FROM php:5.6.26-fpm

MAINTAINER Maxime Cornet <elysioneh@gmail.com>

RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev g++ git unzip libmcrypt-dev libxml2-dev

# date.timezone & short_open_tag
ADD symfony.ini /usr/local/etc/php/conf.d/

# Extensions
RUN docker-php-ext-install intl pdo pdo_mysql mysqli mcrypt xml 

# Xdebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Symfony Installer 
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

CMD ["php-fpm", "-F"]

WORKDIR /var/www/symfony

EXPOSE 9000