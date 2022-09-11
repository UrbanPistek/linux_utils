#!/bin/bash

DISTRO="jammy"

sudo apt install apt-transport-https
sudo wget https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub
sudo apt-key add openvpn-repo-pkg-key.pub
sudo wget -O /etc/apt/sources.list.d/openvpn3.list https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-$DISTRO.list

sudo apt update
sudo apt install -y openvpn3
rm -rf openvpn-repo-pkg-key.pub
