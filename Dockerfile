FROM docker.io/caddy:2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddyserver/replace-response \
    --with github.com/caddy-dns/cloudflare

FROM docker.io/caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
