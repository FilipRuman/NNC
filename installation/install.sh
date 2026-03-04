cd /etc/nixos || exit
# # leave only hardware-configuration
# shopt -s extglob dotglob
# sudo rm -rf -- !(hardware-configuration.nix) # risky one but OH WELL, this is a clean machine anyway! :D
# # On update file
# touch onUpdate.sh
# sudo chmod +x onUpdate.sh
# sudo git clone https://github.com/FilipRuman/NNC.git

cat <<EOF
$host
EOF
