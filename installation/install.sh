#!/bin/bash
cd /etc/nixos || exit
# leave only hardware-configuration
shopt -s extglob dotglob
sudo rm -rf -- !(hardware-configuration.nix) # risky one but OH WELL, this is a clean machine anyway! :D
# On update file
touch onUpdate.sh
sudo chmod +x onUpdate.sh
sudo wget -O /etc/nixos/configuration.nix https://raw.githubusercontent.com/FilipRuman/NNC/refs/heads/main/installation/configuration.nix
sudo wget -O /etc/nixos/flake.nix https://raw.githubusercontent.com/FilipRuman/NNC/refs/heads/main/installation/userSpecificFlakes/$INSTALL_USER/flake.nix

sudo git clone https://github.com/FilipRuman/NNC.git
sudo nixos-rebuild switch --upgrade --flake /etc/nixos/
sudo nixos-rebuild switch --upgrade --flake /etc/nixos/
nix profile upgrade ' * '
