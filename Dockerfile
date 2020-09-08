FROM php:7.4.10-fpm-alpine3.12

LABEL Maintainer="Samuel Ryan <sam@samryan.co.uk>"

RUN apk --no-cache add fcgi busybox nginx supervisor

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/fastcgi.conf /etc/nginx/fastcgi.conf
COPY config/fpm-pool.conf /usr/local/etc/php-fpm.d/www.conf
COPY config/php.ini /usr/local/etc/php/custom.ini
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN chown -R nobody.nobody /srv /run /var/lib/nginx /var/log/nginx

USER nobody
WORKDIR /srv

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

HEALTHCHECK --interval=5s --timeout=3s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://127.0.0.1:8080/.container/status || exit 1
