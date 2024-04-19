FROM php:7.1

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && docker-php-ext-install zip pdo_mysql

COPY php.ini /usr/local/etc/php/

WORKDIR /app

CMD ["php", "-S", "0.0.0.0:80", "-t", "/app"]