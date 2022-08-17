#!/bin/bash

apt () {
	sudo apt update # after running this we know shit is updated
	sudo apt install -y \
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
		python3-venv \
		gparted \
		minicom
}

snaps () {
    sudo snap install discord
	sudo snap install postman
	sudo snap install slack 
	sudo snap install spotify
	sudo snap install cura-slicer
	sudo snap install gimp
	sudo snap install bitwarden
	sudo snap install zoom-client
	sudo snap install vlc
}

docker () {
	sudo bash ./scripts/linux_docker_setup.sh 
}

vscode () {
	sudo bash ./scripts/vscode_install.sh
}

brave () {
	sudo bash ./scripts/brave_install.sh
}

obsidian () {
	wget https://github.com/obsidianmd/obsidian-releases/releases/download/v0.15.9/obsidian_0.15.9_amd64.deb
	sudo dpkg -i ./obsidian_0.15.9_amd64.deb
	rm obsidian_0.15.9_amd64.deb
}

zsh () {
	cd $HOME
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
	echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
	exec zsh
}

neovim () {
	sudo bash ./scripts/neovim_install.sh
}

dotfiles () {
	# add cp ./.zshrc ~/
	# add cp ./.vimrc ~/
	# add cp ./.config/nvim ~/.config
}

echo "Setting up linux"

apt
snaps
docker

# Add neovim config here 

# Git config steps
git config --global core.editor "nvim"

# Go Install

# Rust install
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

