# Derived Dockerfile Example using `opm`
# https://github.com/openresty/docker-openresty
#
# Installs openresty-opm and then uses opm to install knyar/nginx-lua-prometheus.
#

FROM openresty/openresty:bullseye

LABEL name="openresty-prometheus" \
    version="v1.2" \
    url="https://github.com/srajasimman/openresty-prometheus" \
    maintainer="Rajasimman S <srajasimman@gmail.com>" \
    description="openresty-prometheus" \
    license="MIT" \
    org.opencontainers.image.authors="Rajasimman S <srajasimman@gmail.com>" \
    org.opencontainers.image.source="https://github.com/srajasimman/openresty-prometheus" \
    org.opencontainers.image.licenses="MIT"

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        openresty-opm \
    && opm get knyar/nginx-lua-prometheus \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

COPY ./prometheus.conf /etc/nginx/conf.d/prometheus.conf

# Start Nginx server
CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
