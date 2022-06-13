#!/usr/bin/env zsh

username="${1}"

if [[ -z "${username}" ]]
then
    echo "empty username"
    exit -1
fi

[ ! -d "keys" ] && mkdir keys


set -x

docker compose run --rm openvpn easyrsa build-client-full ${username} nopass \
    && docker compose run --rm openvpn ovpn_getclient ${username} > keys/${username}.ovpn
