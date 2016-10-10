FROM httpd:2.4

MAINTAINER Maxime Cornet <elysioneh@gmail.com>

# Gestion des vhosts
RUN mkdir /usr/local/apache2/conf/extra/vhosts
ADD ./vhosts/symfony_dev.conf /usr/local/apache2/conf/extra/vhosts/
RUN echo 'Include conf/extra/vhosts/*.conf' >> /usr/local/apache2/conf/httpd.conf

# Modules : proxy_module proxy_fcgi_module & rewrite_module
ADD ./modules.conf /usr/local/apache2/conf/
RUN echo "Include conf/modules.conf" >> /usr/local/apache2/conf/httpd.conf

CMD ["httpd-foreground"]

EXPOSE 80
EXPOSE 443

