{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.fish = {
    enable = true;
    shellAliases = {
      q = "qalc -c -i";
      rebuild = "cd /etc/nixos/; sudo git add * ; sudo nixos-rebuild switch --upgrade --flake /etc/nixos/";
      updateNix = "rebuild; flatpak update; nix profile upgrade ' * '; cleanup";
      config = "sudo -E -s nvim /etc/nixos/configuration.nix";
      bashrc = "sudo -E -s nvim ~/.bashrc";
      configFish = "sudo -E -s nvim ~/.config/fish/config.fish";
      updateAllSubmodules = "git submodule update --init --recursive";
      configGhostty = "~/.config/ghostty/config";
      ne = "neovide";
      sudoNvim = "sudo -E -s nvim";
      cleanup = "sudo nix-collect-garbage --delete-older-than 3d";
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
    extraConfig = ''
      zoxide init fish | source
    '';
  };

  programs.starship.enable = true;
  programs.zoxide.enable = true;
}
