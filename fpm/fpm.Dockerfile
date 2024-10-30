FROM php:8.3-fpm
ADD https://ja.wordpress.org/latest-ja.zip .
RUN apt-get update && \
    apt-get install -y unzip && \
    rm -rf /var/lib/apt/lists/*  && \
    docker-php-ext-install pdo_mysql mysqli && \
    unzip latest-ja.zip && \
    mv wordpress/* /var/www/html/ && \
    rm -r wordpress latest-ja.zip
