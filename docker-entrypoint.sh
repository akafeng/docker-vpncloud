#!/bin/sh
set -e

if [ "${RUN_MODE}" = "ws_proxy" ]; then
    vpncloud ws-proxy -l ${LISTEN_PORT}
fi

vpncloud \
--listen ${LISTEN_PORT} \
--config /etc/vpncloud/config.yaml \
--log-file /var/log/vpncloud/vpncloud.log \
--stats-file /var/log/vpncloud/vpncloud.stats \
"$@"
