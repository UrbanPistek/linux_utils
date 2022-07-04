#!/bin/bash

apt () {
	apt update # after running this we know shit is updated
	apt install -y \
		vim \
		neovim \
		curl \
		nodejs \
		zsh \
		git \
		snapd \
		wget \
		npm \
		python3-pip \
		python3-venv
}

snaps () {
    snap install discord
    snap install postman
    snap install slack 
	snap install spotify
}

docker () {
	sudo bash ./scripts/linux_docker_setup.sh 
}

echo "Setting up linux"

apt
snaps
docker
