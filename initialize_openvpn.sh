#!/usr/bin/env zsh

set -x

[ ! -d "data" ] && mkdir data

docker compose run --rm openvpn ovpn_genconfig -u udp://inelos.xyz \
    && docker compose run --rm openvpn ovpn_initpki \
    && docker compose up -d
