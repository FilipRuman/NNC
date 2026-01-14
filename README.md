# NNC

NewNixConfig

## Running My Nvf Config on Other Machines

`nix run --refresh github:FilipRuman/NNC?dir=nvf/selfcontained`

## Installation

Installation command, I'm not responsible form any harm done by this command.
You need to set the INSTALL_USER to: `pc/laptop/server` depending on what user
script you want to install\
`*_*`

```bash
nix-shell -p wget git --run 'export INSTALL_USER=pc; wget -O /tmp/NNCinstall.sh https://raw.githubusercontent.com/FilipRuman/NNC/refs/heads/main/installation/install.sh; sudo chmod +x /tmp/NNCinstall.sh; sudo -E bash /tmp/NNCinstall.sh'
```
