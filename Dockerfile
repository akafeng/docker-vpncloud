FROM debian:buster-slim AS builder

LABEL maintainer="akafeng <i@sjy.im>"

ARG VPNCLOUD_VERSION="2.2.0"
ARG VPNCLOUD_URL="https://github.com/dswd/vpncloud/releases/download/v${VPNCLOUD_VERSION}/vpncloud_${VPNCLOUD_VERSION}_static_amd64"

RUN set -eux \
    && apt-get update -qyy \
    && apt-get install -qyy --no-install-recommends --no-install-suggests \
        ca-certificates \
        wget \
    && rm -rf /var/lib/apt/lists/* /var/log/* \
    \
    && wget -O /usr/local/bin/vpncloud ${VPNCLOUD_URL} \
    && chmod +x /usr/local/bin/vpncloud \
    && vpncloud --help

######

FROM debian:buster-slim

LABEL maintainer="akafeng <i@sjy.im>"

ENV RUN_MODE="normal"
ENV LISTEN_PORT="3210"

COPY --from=builder /usr/local/bin/ /usr/local/bin/

RUN set -eux \
    && apt-get update -qyy \
    && apt-get install -qyy --no-install-recommends --no-install-suggests \
        iproute2 \
    && rm -rf /var/lib/apt/lists/* /var/log/* \
    \
    && mkdir /etc/vpncloud/ \
    && mkdir /var/log/vpncloud/

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
