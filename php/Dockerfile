FROM php:7.2-fpm
ARG TIMEZONE

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer --version

# install debian pkgs
RUN apt-get -qq update && apt-get -yq install git unzip && apt-get clean

# configure php.ini
RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini && \
    sed --in-place '/disable_functions/d' /usr/local/etc/php/php.ini && \
    sed --in-place 's/;date.timezone =/date.timezone = "UTC"/g' /usr/local/etc/php/php.ini && \
    sed --in-place 's/memory_limit = 128M/memory_limit = -1/g' /usr/local/etc/php/php.ini

# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone \
    && printf '[PHP]\ndate.timezone = "%s"\n', ${TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini \
    && "date"

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql bcmath

# install xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.idekey=\"PHPSTORM\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# # install apcu
# required by app
RUN pecl install apcu-5.1.12 && pecl install apcu_bc-1.0.4 \
    && docker-php-ext-enable apcu --ini-name 20-docker-php-ext-apcu.ini \
    && docker-php-ext-enable apc --ini-name 21-docker-php-ext-apc.ini

RUN echo 'apc.enable_cli=on' >> /usr/local/etc/php/conf.d/20-docker-php-ext-apcu.ini

WORKDIR /var/www/symfony
