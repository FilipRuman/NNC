{
  description = "Flake for PC machine";

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
        machines.pc.enable = true;
      };

      nixConf = {
        docker.enable = true;
        essentials.enable = true;
        keyboardFlashing.enable = true;
        steam.enable = true;
        stylix.enable = true;
        terminalEnhancements.enable = true;
        vm.enable = true;
        pkgs = {
          gui.enable = true;
          ctf.enable = false;
          blender.enable = true;
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
            "com.brave.Browser"
            "com.discordapp.Discord"
            "org.gimp.GIMP"
          ];
        };

        system = {
          audio.enable = true;
          bootloader.grub.enable = true;
          wm = {
            hypr.enable = true;
            plasma.enable = true;
          };
          bluetooth.enable = true;
          gpu.nvidia.enable = true;
        };
      };
    };
  };
}
