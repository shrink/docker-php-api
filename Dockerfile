FROM php:7.4.10-fpm-alpine3.12

LABEL Maintainer="Samuel Ryan <sam@samryan.co.uk>"

RUN apk --no-cache add fcgi busybox nginx tini

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/fastcgi.conf /etc/nginx/fastcgi.conf
COPY config/fpm-pool.conf /usr/local/etc/php-fpm.d/www.conf
COPY config/php.ini /usr/local/etc/php/custom.ini

RUN chown -R nobody.nobody /srv /run /var/lib/nginx /var/log/nginx

USER nobody
WORKDIR /srv

EXPOSE 8080

COPY ./entrypoint.sh /

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]

HEALTHCHECK --interval=2s --timeout=1s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://127.0.0.1:8080/.container/status || exit 1
