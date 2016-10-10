docker-symfony
==============

A little docker stack for running Symfony into Docker containers with docker-compose tool.

## Installation

Clone this repository:

```bash
$ git clone git@github.com:xElysioN/docker-symfony.git
```

Put your Symfony application into `symfony` folder. 

Make sure you adjust parameters.yml for database : 

    - database_port: 3306
    - database_host: db
    - database_user: root
    - database_password: root

And then 

```bash
$ docker-compose up -d
```

## Commands
Soon

## Mysql
- Version 5.7
- Port : 3309

## Apache
- Version 2.4
- Port : 80
- Mods : 
	- mod_rewrite
	- mod_proxy
    - mod_proxy_fcgi
- Virtual host
	- symfony.dev
- Logs
    - logs/apache/

## PHP
- Version 5.6.26-fpm
- Mods : 
	- intl
    - xdebug

## phpMyAdmin
- http://symfony.dev:8080
