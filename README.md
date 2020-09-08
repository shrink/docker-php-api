# :whale: Docker PHP API

Docker Image for PHP API applications.

**Alpine** [`3.12`][alpine-3.12] + **nginx** [`1.18.0`][nginx-1.18.0] +
**PHP** [`7.4.10`][php-7.4.10]

```dockerfile
FROM ghcr.io/shrink/docker-php-api:7.4
```

* **All** requests are routed to `public/index.php`
* `xml` and `json` responses are gzipped
* nginx runs on port `8080`
* PHP-FPM status is exposed via `/.container/status` and `/.container/ping`
* "Optimized" PHP-FPM configuration based on
  [TrafeX/docker-php-nginx][TrafeX/docker-php-nginx]

[TrafeX/docker-php-nginx]: https://github.com/TrafeX/docker-php-nginx
[alpine-3.12]: https://alpinelinux.org/posts/Alpine-3.12.0-released.html
[nginx-1.18.0]: http://nginx.org/en/CHANGES-1.18
[php-7.4.10]: https://www.php.net/ChangeLog-7.php#7.4.10
