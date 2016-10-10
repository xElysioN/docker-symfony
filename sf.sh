#!/bin/bash

# Commandes Disponibles
#   - cache
#   - cache:dev
#   - cache:prod
#   - composer:update
#   - composer:install
#   - composer:require string
#   - php:ssh
#   - mysql:ssh
#   - apache:ssh
#   - symfony:new
#   - symfony:console command

# Doit correspondre au container_name du docker_composer.yml
PHP_container=sf_php
DB_container=sf_db
APACHE_container=sf_apache


if [ -z "$1" ]; then
    COMMANDS="
    Commande|Description\n
    cache|Vide le cache de dev et prod\n
    cache:dev|Vide le cache de dev\n
    cache:prod|Vide le cache de prod\n
    composer:update|Lance la commande composer:update\n
    composer:install|Lance la commande composer:install\n
    composer:require string|Lance la commande composer:require votrebunle\n
    php:ssh|Vous connecte sur le container php en ssh\n
    apache:ssh|Vous connecte sur le container apache en ssh\n
    db:ssh|Vous connecte sur le container db en ssh\n
    symfony:console string|Lance la commande de console de symfony avec vos paramètres\n
    "

    echo -e $COMMANDS | column -t -s "|"
fi

# Symfony
if [[ $1 == "cache" ]]; then
    docker exec -it $PHP_container php app/console cache:clear
    docker exec -it $PHP_container php app/console cache:clear -e=prod
fi

if [[ $1 == "cache:dev" ]]; then
    docker exec -it $PHP_container php app/console cache:clear
fi

if [[ $1 == "cache:prod" ]]; then
    docker exec -it $PHP_container php app/console cache:clear -e=prod
fi

if [[ $1 == "symfony:console" ]]; then
    docker exec -it $PHP_container php app/console "${@:2}"
fi

# Composer
if [[ $1 == "composer:update" ]]; then
    docker exec -it $PHP_container composer update
fi

if [[ $1 == "composer:install" ]]; then
    docker exec -it $PHP_container composer install
fi

if [[ $1 == "composer:require" ]]; then
    docker exec -it $PHP_container composer require "${@:2}"
fi

# SSH 
if [[ $1 == "php:ssh" ]]; then
    docker exec -it $PHP_container bash
fi

if [[ $1 == "apache:ssh" ]]; then
    docker exec -it $APACHE_container bash
fi

if [[ $1 == "db:ssh" ]]; then
    docker exec -it $DB_container bash
fi
