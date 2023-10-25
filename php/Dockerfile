FROM php:7.4.0-fpm-alpine

ENV COMPOSER_CACHE_DIR /tmp

COPY --from=composer:2.0 /usr/bin/composer /usr/local/bin/composer

# Install mandatory
RUN apk add --no-cache nginx supervisor fcgi

# Install required library for extensions
RUN apk add --no-cache \
    libpng \
    libpng-dev \
    libjpeg-turbo \
    libjpeg-turbo-dev \
    freetype \
    freetype-dev \
    libzip \
    libzip-dev \
    zlib \
    zlib-dev \
    libxslt-dev \
    libxml2 \
    libxml2-dev \
    curl-dev \
    openssl-dev \
    libsodium-dev \
    oniguruma-dev \
    icu-libs \
    icu-dev \
    g++ \
    gettext-dev \
    bzip2-dev \
    libmemcached-dev \
    dcron \
    libmcrypt-dev \
    gcc \
    g++ \
    make \
    autoconf \
    libc-dev \
    pkgconfig

RUN docker-php-ext-configure gd --with-freetype --with-jpeg

# Install PHP extensions
RUN docker-php-ext-install \
    mysqli pdo pdo_mysql \
    intl \
    zip \
    mbstring \
    curl \
    gd \
    xml \
    soap \
    sockets \
    sodium \
    opcache \
    bcmath

RUN pecl install mcrypt-1.0.4 && docker-php-ext-enable mcrypt

# Create the cache nginx
RUN mkdir -p /var/cache/nginx/fastcgi
RUN chown -R nginx:nginx /var/cache/nginx

# Copy files to container
COPY ./source /usr/share/nginx/html
COPY ./conf/php.ini /usr/local/etc/php/php.ini
COPY ./conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf 

# # Copy cron file to the cron.d directory
# COPY ./conf/cron /etc/cron.d/cron
# RUN chmod 0644 /etc/cron.d/cron
# RUN crontab /etc/cron.d/cron
# RUN touch /var/log/cron.log

# Start Supervisord to manage programs
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf", "-n"]