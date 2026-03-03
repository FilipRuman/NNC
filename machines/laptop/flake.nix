{
  description = "Flake for laptop machine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    stylix.url = "github:danth/stylix";
    home.url = "path:./../../home";
    home-manager.url = "github:nix-community/home-manager";
    nvf.url = "path:./../../nvf";
    steam.url = "path:./../../steam";
  };

  outputs = inputs: {
    module = {...}: {
      imports = [
        inputs.home-manager.nixosModules.default
        inputs.nix-flatpak.nixosModules.nix-flatpak
        inputs.stylix.nixosModules.stylix
        inputs.home.f
        inputs.nvf.module
        inputs.steam.module
        ./../../config/main.nix
      ];

      home-manager.users.f = {
        machines.laptop.enable = true;
      };
      boot.kernelParams = ["i915.enable_guc=3"];
      nixConf = {
        docker.enable = false;
        essentials.enable = true;
        keyboardFlashing.enable = true;
        stylix.enable = true;
        terminalEnhancements.enable = true;
        vm.enable = false;
        gui.enable = true;
        ctf.enable = false;
        langs = {
          nim.enable = true;
          c.enable = true;
          cs.enable = true;
          rust.enable = true;
          js.enable = false;
        };

        flatpak = {
          enable = true;
          packages = [
            "io.ente.auth"
            "com.discordapp.Discord"
          ];
        };
        system = {
          sddm.enable = true;
          gpu.nvidia.enable = true;
          wm = {
            plasma.enable = false;
            hypr.enable = true;
          };

          audio.enable = true;
          bootloader.grub.enable = false;
          bootloader.systemd.enable = true;
          bluetooth.enable = true;
          plymouth.enable = true;
        };
      };
    };
  };
}
