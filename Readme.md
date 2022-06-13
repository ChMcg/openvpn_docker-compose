# Template for easy docker-compose OpenVPN deploy

## Main goal

Automation of OpenVPN server deploy and users creation.

## Install

### Docker and docker-compose install

Note: tested only on ubuntu-based OS.

```shell
sudo apt update \
    && sudo apt install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
    && sudo mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
        | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
        | sudo tee /etc/apt/sources.list.d/docker.list \
        > /dev/null \
    && sudo apt update \
    && sudo apt install \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-compose-plugin
```

(from [docker reference](https://docs.docker.com/engine/install/ubuntu/))

### Deploying vpn server

First of all, initialize OpenVPN service. 
Start script with public host url of server and follow instructions.

```shell
./initialize_openvpn.sh [host_url]
```

After that, server will start listening on port 1194

### Adding new users

To add vpn user run script `register_user.sh` with username as argument.

```shell
./register_user.sh [username]
```

As result, in directory `./keys` will appear certificate in format `[username].ovpn`.
