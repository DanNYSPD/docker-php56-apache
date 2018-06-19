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
    && docker-php-ext-install bcmath bz2 calendar ctype curl gd json mbstring mysql mysqli mcrypt pdo_mysql xml soap zip \
    # && docker-php-ext-enable bcmath bz2 calendar ctype gd mysql mysqli mcrypt pdo_mysql xml soap zip \
    && echo "date.timezone = America/Sao_Paulo" > /usr/local/etc/php/conf.d/timezone.ini \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# RUN a2enmod php
RUN a2enmod rewrite

ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

WORKDIR /var/www/
RUN chmod 777 /var/www/ -Rf && ls -lah && php -m