sudo rm -rf /etc/nixos # risky one but OH WELL, this is a clean machine anyway! :D
mkdir /etc/nixos/
cd /etc/nixos || exit
sudo echo "$host" >./host.txt
# On update file
touch onUpdate.sh
sudo chmod +x onUpdate.sh
sudo git clone https://github.com/FilipRuman/NNC.git
cd ./NNC/ || exit
sudo nixos-rebuild switch --upgrade --flake ".#$host"
