# DOCKER
FROM hitalos/php:latest
LABEL maintainer="nickaguilarh <nickaguilarh@gmail.com>"

# Download and install
ADD install.sh /usr/sbin/install.sh
RUN ["chmod", "+x", "/usr/sbin/install.sh"]
RUN /usr/sbin/install.sh

# Install pre-required extensions libraries
RUN apk add --update libxml2-dev

# Download and install NodeJS
ADD install-node.sh /usr/sbin/install-node.sh
RUN /usr/sbin/install-node.sh

# Install extensions
RUN docker-php-ext-install soap bcmath pcntl

WORKDIR /var/www
CMD php ./artisan serve --port=80 --host=0.0.0.0
EXPOSE 80
HEALTHCHECK --interval=1m CMD curl -f http://localhost/ || exit 1
