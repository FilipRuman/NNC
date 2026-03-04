# NNC

NewNixConfig

## Running My Nvf Config on Other Machines

`nix run --refresh github:FilipRuman/NNC?dir=nvf/selfcontained`

## Installation

Installation command, I'm not responsible form any harm done by this command.
You need to set the INSTALL_USER to: `pc/laptop/server` depending on what user
script you want to install\
`*_*`

1. set what host you want to use

```bash
bash ; export host=<desktop/laptop/server>
```

2. install eaverything:

```bash
nix-shell -p wget git --run 'wget -O /tmp/NNCinstall.sh https://raw.githubusercontent.com/FilipRuman/NNC/refs/heads/main/installation/install.sh; sudo chmod +x /tmp/NNCinstall.sh; sudo bash /tmp/NNCinstall.sh'
```
