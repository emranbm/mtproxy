#!/bin/bash
set -euo pipefail

readonly CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
readonly MAIN_PORT=6969
readonly STATS_PORT=8888
readonly NUM_WORKERS=2
cd "$CWD"
curl -s https://core.telegram.org/getProxySecret -o proxy-secret
curl -s https://core.telegram.org/getProxyConfig -o proxy-multi.conf
./mtproto-proxy -u root -p $MAIN_PORT -H $STATS_PORT -S $SECRET --aes-pwd proxy-secret proxy-multi.conf -M $NUM_WORKERS
