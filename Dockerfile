FROM docker.io/library/caddy:2.7.4-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddyserver/replace-response \
    --with github.com/caddy-dns/cloudflare

FROM docker.io/library/caddy:2.7.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
