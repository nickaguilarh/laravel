#!/bin/sh

find / -name "php.ini"

apk --update upgrade \
  && apk add autoconf automake make gcc g++ libtool pkgconfig libmcrypt-dev re2c git zlib-dev xdg-utils libpng-dev freetype-dev libjpeg-turbo-dev openssh-client libxslt-dev ca-certificates gmp-dev \
  && apk add imagemagick imagemagick-dev

pecl install imagick
docker-php-ext-enable imagick

# Set timezone
# RUN echo America/Maceio > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata