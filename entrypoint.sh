#!/bin/sh
php-fpm -g /tmp/php-fpm.pid -F &

until [ -f /tmp/php-fpm.pid ]; do usleep 50000; done

nginx -g 'daemon off;' &

wait -n
