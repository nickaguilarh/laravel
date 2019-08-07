# DOCKER
FROM hitalos/php:latest
LABEL maintainer="nickaguilarh <nickaguilarh@gmail.com>"

# Download and install NodeJS
ADD install-node.sh /usr/sbin/install-node.sh
RUN ["chmod", "+x", "/usr/sbin/install-node.sh"]
RUN /usr/sbin/install-node.sh

# Install pre-required extensions libraries
RUN apk add --update libxml2-dev

# Install extensions
RUN docker-php-ext-install soap bcmath pcntl imagick

WORKDIR /var/www
CMD php ./artisan serve --port=80 --host=0.0.0.0
EXPOSE 80
HEALTHCHECK --interval=1m CMD curl -f http://localhost/ || exit 1
