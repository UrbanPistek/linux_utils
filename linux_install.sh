#!/bin/bash

apt () {
	sudo apt update # after running this we know shit is updated

	# for nodejs
	curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -

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
		minicom \
		freecad
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

zephyr_rtos () {
	sudo apt update
	sudo apt upgrade
	sudo apt install -y --no-install-recommends git cmake ninja-build gperf \
		ccache dfu-util device-tree-compiler wget \
		python3-dev python3-pip python3-setuptools python3-tk python3-wheel xz-utils file \
		make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1


	# setup zephyr repo in venv
	python3 -m venv ~/zephyrproject/.venv
	source ~/zephyrproject/.venv/bin/activate
	pip install west
	west init ~/zephyrproject
	cd ~/zephyrproject
	west update
	west zephyr-export
	pip install -r ~/zephyrproject/zephyr/scripts/requirements.txt

	# add zephyr sdk
	cd ~
	wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.14.2/zephyr-sdk-0.14.2_linux-x86_64.tar.gz
	wget -O - https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.14.2/sha256.sum | shasum --check --ignore-missing
	tar xvf zephyr-sdk-0.14.2_linux-x86_64.tar.gz
	rm zephyr-sdk-0.14.2_linux-x86_64.tar.gz
	cd zephyr-sdk-0.14.2
	./setup.sh

	sudo cp ~/zephyr-sdk-0.14.2/sysroots/x86_64-pokysdk-linux/usr/share/openocd/contrib/60-openocd.rules /etc/udev/rules.d
	sudo udevadm control --reload
}

go () {
	curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
	sha256sum go1.16.7.linux-amd64.tar.gz
	sudo tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz
	rm go1.16.7.linux-amd64.tar.gz 
	echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
}

kicad () {
    sudo add-apt-repository --yes ppa:kicad/kicad-6.0-releases
	sudo apt update
	sudo apt install --install-recommends kicad
}

echo "Setting up linux"

apt
snaps
docker

# Add neovim config here 

# Git config steps
git config --global core.editor "nvim"

# Rust install
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

# Check versions
echo 'Installed: \n'

go version
node --version
pip --version
python3 --version
rustc --version
nvim --version
docker --version
docker-compose --version
