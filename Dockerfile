FROM php:5.6.36-apache-jessie
RUN set -x \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils \
    && apt-get upgrade -y \
    && apt-get install -y libxslt-dev \
    && apt-get install -y libxml2-dev \
    && apt-get install -y libmcrypt-dev \
    && apt-get install -y libbz2-dev \
    && apt-get install -y libcurl4-gnutls-dev \
    && apt-get install -y libpng-dev \
    && apt-get install -y zlib1g-dev \
    && apt-get install -y libicu-dev \
    && apt-get install -y libsasl2-dev \
    && docker-php-ext-install bcmath calendar ctype json mbstring mysql mysqli mcrypt pdo_mysql xml soap zip \
    && echo "date.timezone = America/Sao_Paulo" > /usr/local/etc/php/conf.d/timezone.ini \
# Enable apache mods.
# RUN a2enmod php
RUN a2enmod rewrite

# Update the default apache site with the config we created.
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf
RUN php -m