#!/usr/bin/env bash

host_url="${1}"

if [[ -z "${host_url}" ]]
then
    echo "empty host_url"
    exit -1
fi

[ ! -d "data" ] && mkdir data


set -x

docker compose run --rm openvpn ovpn_genconfig -u udp://${host_url} \
    && docker compose run --rm openvpn ovpn_initpki \
    && docker compose up -d
