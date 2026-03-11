{
  flake.homeModules.general = {
    programs = {
      fish = {
        enable = true;
        shellAliases = {
          bsudo = "sudo -sE";
          pages = "z ~/git/pages/src/content/docs/";
          readHost = "set -g host (cat /etc/nixos/host.txt)";
          addToDict = "nim r /etc/nixos/NNC/utils/addToDict.nim";
          q = "qalc -c -i";
          helium = "nix run github:AlvaroParker/helium-nix";
          zen = "nix run github:youwen5/zen-browser-flake";
          onUpdate = "sudo /etc/nixos/onUpdate.sh";
          rebuild = "readHost ; cd /etc/nixos/NNC/ ; sudo nix run .#write-flake ; sudo nixos-rebuild switch --upgrade --flake .#$host";
          updateNix = "cd /etc/nixos/NNC/; git pull ; rebuild ; sudo nix flake update ; flatpak update -y ; onUpdate ; nix profile upgrade ' * '; cleanup";
          config = "ne /etc/nixos/NNC/modules";
          configSystem = "sudo -E -s nvim /etc/nixos/flake.nix";
          bashrc = "sudo -E -s nvim ~/.bashrc";
          configFish = "sudo -E -s nvim ~/.config/fish/config.fish";
          updateAllSubmodules = "git submodule update --init --recursive";
          configGhostty = "~/.config/ghostty/config";
          ne = "neovide";
          rem_vim = "nix run --refresh github:FilipRuman/NNC?dir=nvf/selfcontained";
          sudoNvim = "sudo -E -s nvim";
          cleanup = "sudo nix-collect-garbage --delete-older-than 14d";
          cleanupAll = "sudo nix-collect-garbage -d";
          godot = "steam-run ~/Documents/godot/godot.x86_64";
          tauriRun = "sudo npm run tauri dev";
          configKanata = "nvim ~/.config/kanata/config.kbd";
          espSetup = "nix --experimental-features 'nix-command flakes' develop github:mirrexagon/nixpkgs-esp-dev#esp-idf-full ; fish";
          espRun = "sudo -s -E idf.py --port /dev/ttyUSB0 flash monitor";
          notes = "ne ~/Nextcloud/Notes/";
        };
        interactiveShellInit = ''
          starship init fish | source
          starship preset bracketed-segments -o ~/.config/starship.toml
          starship preset nerd-font-symbols -o ~/.config/starship.toml

          zoxide init fish | source
          clear
        '';
        functions = {
          y = {
            body = ''
              set tmp (mktemp -t "yazi-cwd.XXXXXX")
              yazi $argv --cwd-file="$tmp"
              if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
                builtin cd -- "$cwd"
              end
              rm -f -- "$tmp"
            '';
          };
        };
        shellAbbrs = {
          vm = "~/vms/run.sh";
          nixCargo = "nix-shell --run 'cargo run'";
        };
      };

      starship.enable = true;
      zoxide.enable = true;
    };
  };
}
