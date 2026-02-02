{
  description = "Flake for PC machine";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    stylix.url = "github:danth/stylix";
    home.url = "path:./../../home";
    home-manager.url = "github:nix-community/home-manager";
    nvf.url = "path:./../../nvf";
    zen.url = "path:./../../zen";
    home.inputs.nixpkgs.follows = "nixpkgs";
    # grub-theme.url = "path:./../../grub_theme";
  };

  outputs = inputs: {
    module = {...}: {
      boot.initrd.kernelModules = ["amdgpu"];
      boot.kernelParams = ["nvidia-drm.modeset=1"];
      imports = [
        inputs.home-manager.nixosModules.default
        inputs.nix-flatpak.nixosModules.nix-flatpak
        inputs.stylix.nixosModules.stylix
        inputs.home.f
        inputs.nvf.module
        inputs.zen.module
        # inputs.grub-theme.module
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
          bootloader.systemd.enable = true;
          wm = {
            hypr.enable = true;
            plasma.enable = false;
          };
          bluetooth.enable = true;
          gpu.nvidia.enable = true;
          plymouth.enable = true;
        };
      };
    };
  };
}
