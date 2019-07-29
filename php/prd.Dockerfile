FROM php:7.2-fpm

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer --version

# install debian pkgs
RUN apt-get -qq update && apt-get -yq install git unzip && apt-get clean

# configure php.ini
COPY php/prd.php.ini /usr/local/etc/php/conf.d/prd.php.ini
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql bcmath

# # install apcu
# required by app
RUN pecl install apcu-5.1.12 && pecl install apcu_bc-1.0.4 \
    && docker-php-ext-enable apcu --ini-name 20-docker-php-ext-apcu.ini \
    && docker-php-ext-enable apc --ini-name 21-docker-php-ext-apc.ini

RUN echo 'apc.enable_cli=on' >> /usr/local/etc/php/conf.d/20-docker-php-ext-apcu.ini

# tweak php-fpm config
RUN \
    sed -i -e "s/^pm.max_children = .+/pm.max_children = 10/g" /usr/local/etc/php-fpm.d/www.conf && \
    sed -i -e "s/^pm.start_servers = .+/pm.start_servers = 3/g" /usr/local/etc/php-fpm.d/www.conf && \
    sed -i -e "s/^pm.min_spare_servers = .+/pm.min_spare_servers = 2/g" /usr/local/etc/php-fpm.d/www.conf && \
    sed -i -e "s/^pm.max_spare_servers = .+/pm.max_spare_servers = 4/g" /usr/local/etc/php-fpm.d/www.conf


WORKDIR /var/www/symfony
