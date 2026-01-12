{
  description = "Flake for PC machine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    stylix.url = "github:danth/stylix";
    home.url = "path:./../../home";
    home-manager.url = "github:nix-community/home-manager";
    nvf-config.url = "path:./../../nvf";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nix-flatpak,
    home,
    stylix,
    nvf-config,
    ...
  } @ inputs: {
    module = {...}: {
      imports = [
        inputs.home-manager.nixosModules.default
        inputs.nvf.nixosModules.default
        nix-flatpak.nixosModules.nix-flatpak
        stylix.nixosModules.stylix
        home.f
        ./../../config/main.nix
        ({pkgs, ...}: {
          environment.systemPackages = [
            nvf-config.packages.x86_64-linux.default
          ];
        })
      ];

      nixConf = {
        docker.enable = true;
        essentials.enable = true;
        keyboardFlashing.enable = true;
        nvim.enable = true;
        steam.enable = true;
        stylix.enable = true;
        terminalEnhancements.enable = true;
        vm.enable = true;

        pkgs = {
          gui.enable = true;
          ctf.enable = false;
          langs = {
            c.enable = true;
            cs.enable = true;
            rust.enable = true;
            js.enable = false; # Tfu *
          };
        };

        flatpak = {
          enable = true;
          packages = [
            "io.ente.auth"
            "app.zen_browser.zen"
            "com.brave.Browser"
            "com.discordapp.Discord"
            "org.gimp.GIMP"
          ];
        };

        system = {
          audio.enable = true;
          bootloader.grub.enable = true;
          wm.hypr.enable = true;
          bluetooth.enable = true;
        };
      };
    };
  };
}
