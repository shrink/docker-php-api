# :whale: Docker PHP API

Docker Image for PHP API applications.

**Alpine** [`3.15`][alpine] + **nginx** [`1.20`][nginx] +
**PHP** [`8.1`][php]

```dockerfile
FROM ghcr.io/shrink/docker-php-api:8
```

- **All** requests are routed to `public/index.php`
- `xml` and `json` responses are gzipped
- nginx runs on port `8080`
- PHP-FPM status is exposed via `/.container/status` and `/.container/ping`
- Available for [PHP 7 &darr;](#php-versions)

See an example usage in
[Laravel Strict `shrink/laravel-strict`][shrink/laravel-strict].

## Immutability by Digest Pinning

Docker tags are **mutable** and could change the image represented at any time:
in this project the version tag represents the PHP version included in the
image, it **does not** represent an immutable version of the image itself. PHP
version tags should be considered a discoverability aide, not an immutable image
reference.

Most production use-cases are best served by
[Digest Pinning][docker-digest-pinning] which uses the **immutable** image
digest to guarantee reproducibility, e.g:

```dockerfile
FROM ghcr.io/shrink/docker-php-api@sha256:7ea108539c53d2e601b17c23d9f3b0aacd627c3873eb1ef52187dd71a41ba061
```

## PHP Versions

All [Supported Versions of PHP][php/supported-versions] are tagged with the
major and minor version (e.g: `7` and `7.4`).

```dockerfile
FROM ghcr.io/shrink/docker-php-api:7
```

[`images.json`][images-manifest] is the manifest describing the images to be
built by the CI. The [GitHub Container Registry][ghcr/shrink/docker-php-api]
contains a full list of all built images with their tags and digests.

## Credits

Optimized PHP-FPM configuration based on
[TrafeX/docker-php-nginx][trafex/docker-php-nginx].

[trafex/docker-php-nginx]: https://github.com/TrafeX/docker-php-nginx
[alpine]: https://alpinelinux.org/posts/Alpine-3.15.0-released.html
[nginx]: http://nginx.org/en/CHANGES-1.20
[php]: https://www.php.net/ChangeLog-8.php#PHP_8_1
[shrink/laravel-strict]: https://github.com/shrink/laravel-strict
[docker-digest-pinning]: https://docs.docker.com/engine/reference/commandline/pull/#pull-an-image-by-digest-immutable-identifier
[ghcr/shrink/docker-php-api]: https://github.com/users/shrink/packages/container/package/docker-php-api
[php/supported-versions]: https://www.php.net/supported-versions.php
[images-manifest]: /image.json
