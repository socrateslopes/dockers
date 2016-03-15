FROM debian:jessie

RUN apt-get update && apt-get upgrade -y && apt-get install wget -y && \
    echo 'deb http://packages.dotdeb.org jessie all' > /etc/apt/sources.list.d/dotdeb.list && \
    wget https://www.dotdeb.org/dotdeb.gpg && apt-key add dotdeb.gpg && \
    apt-get update && \
    apt-get install nginx php7.0 php7.0-common php7.0-json php7.0-mysql php7.0-curl php7.0-gd php7.0-mysql php7.0-pgsql php7.0-sqlite3 php7.0-fpm -y --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/php

EXPOSE 80
VOLUME /var/www

COPY site.conf /etc/nginx/sites-available/default
COPY index.php /var/www/html/index.php

RUN sed -i -e 's/;clear_env/clear_env/' /etc/php/7.0/fpm/pool.d/www.conf && \
    sed -i -e 's/memory_limit.*/memory_limit=512M/g' /etc/php/7.0/fpm/php.ini && \
    sed -i -e 's/upload_max_filesize.*/upload_max_filesize=128M/g' /etc/php/7.0/fpm/php.ini && \
    sed -i -e 's/post_max_size.*/post_max_size=128M/g' /etc/php/7.0/fpm/php.ini && \
    sed -i -e 's/display_errors.*/display_erros=On/g' /etc/php/7.0/fpm/php.ini

COPY run.sh /opt/run.sh
CMD ["/opt/run.sh"]

RUN wget https://getcomposer.org/composer.phar && mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer
