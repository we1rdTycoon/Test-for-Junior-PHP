FROM php
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
WORKDIR /usr/src/app
COPY . .
EXPOSE 8000
CMD [ "php", "-S","0.0.0.0:8000"]