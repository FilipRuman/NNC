{
  description = "Flake for laptop machine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    stylix.url = "github:danth/stylix";
    home.url = "path:./../../home";
    home-manager.url = "github:nix-community/home-manager";
    nvf.url = "path:./../../nvf";
  };

  outputs = inputs: {
    module = {...}: {
      imports = [
        inputs.home-manager.nixosModules.default
        inputs.nix-flatpak.nixosModules.nix-flatpak
        inputs.stylix.nixosModules.stylix
        inputs.home.f
        inputs.nvf.module
        ./../../config/main.nix
      ];

      home-manager.users.f = {
        machines.laptop.enable = true;
      };

      nixConf = {
        docker.enable = false;
        essentials.enable = true;
        keyboardFlashing.enable = true;
        steam.enable = true;
        stylix.enable = true;
        terminalEnhancements.enable = true;
        vm.enable = false;
        pkgs = {
          gui.enable = true;
          ctf.enable = false;
          blender.enable = false;
          langs = {
            nim.enable = true;
            c.enable = true;
            cs.enable = true;
            rust.enable = true;
            js.enable = false;
          };
        };

        flatpak = {
          enable = true;
          packages = [
            "io.ente.auth"
            "com.discordapp.Discord"
          ];
        };
        system = {
          gpu.nvidia.enable = true;
          wm = {
            plasma.enable = false;
            hypr.enable = true;
          };

          audio.enable = true;
          bootloader.grub.enable = true;
          bootloader.systemd.enable = false;
          bluetooth.enable = true;
        };
      };
    };
  };
}
