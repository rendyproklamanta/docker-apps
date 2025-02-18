# Start with the openappsec agent image
FROM randyproxz/php8.1-fpm:openappsec

## Create dirs
RUN mkdir -p /var/log/supervisor && chmod 755 /var/log/supervisor
RUN mkdir -p /var/log/nginx && chmod 755 /var/log/nginx
RUN mkdir -p /var/log/php && chmod 755 /var/log/php
RUN mkdir -p /var/cache/nginx/fastcgi && chmod 755 /var/cache/nginx/fastcgi

## Copy your files to container
COPY ./conf/php/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/php/default.conf /etc/nginx/conf.d/default.conf
COPY ./conf/php/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# COPY ./conf/php/php.ini /etc/php7/conf.d/php.ini
COPY ./conf/php/php.ini /etc/php81/conf.d/php.ini

## Load modules
RUN sed -i '1s|^|load_module /usr/lib/nginx/modules/libngx_module.so;\n|' /etc/nginx/nginx.conf