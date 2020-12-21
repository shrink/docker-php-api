# :whale: Docker PHP API

Docker Image for PHP API applications.

**Alpine** [`3.12`][alpine-3.12] + **nginx** [`1.18.0`][nginx-1.18.0] +
**PHP** [`8.0.0`][php-8.0.0]

```dockerfile
FROM ghcr.io/shrink/docker-php-api:8
```

* **All** requests are routed to `public/index.php`
* `xml` and `json` responses are gzipped
* nginx runs on port `8080`
* PHP-FPM status is exposed via `/.container/status` and `/.container/ping`
* "Optimized" PHP-FPM configuration based on
  [TrafeX/docker-php-nginx][TrafeX/docker-php-nginx]
* Available for [PHP 7 &darr;](#php-7)

## Immutability by Digest Pinning

Docker tags are **mutable** and could change the underlying image represented
at any time: in this project the version tag represents the PHP version
included in the image, it **does not** represent an immutable version of the
image itself. PHP version tags should be considered a discoverability aide,
not an immutable image reference -- the underlying image could change at any
time.

Most production use-cases will be better served by
[Digest Pinning][docker-digest-pinning] which uses the **immutable** image digest
to guarantee the same image every time.

```dockerfile
FROM ghcr.io/shrink/docker-php-api@sha256:637a6ff82d27001b8137e807f6da49d2a8c6d1e234e757945454069ebdec0720
```

A full list of images and their digests is available in the
[GitHub Container Package Registry][ghcr/shrink/docker-php-api].

## PHP 7

Supported versions of PHP 7 are included. A full list of available versions can
be found via the
[GitHub Container Package Registry][ghcr/shrink/docker-php-api].

```dockerfile
FROM ghcr.io/shrink/docker-php-api:7
```

[TrafeX/docker-php-nginx]: https://github.com/TrafeX/docker-php-nginx
[alpine-3.12]: https://alpinelinux.org/posts/Alpine-3.12.0-released.html
[nginx-1.18.0]: http://nginx.org/en/CHANGES-1.18
[php-8.0.0]: https://www.php.net/ChangeLog-8.php#8.0.0
[docker-digest-pinning]: https://docs.docker.com/engine/reference/commandline/pull/#pull-an-image-by-digest-immutable-identifier
[ghcr/shrink/docker-php-api]: https://github.com/users/shrink/packages/container/package/docker-php-api
