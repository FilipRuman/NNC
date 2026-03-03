{
  inputs,
  self,
  lib,
  ...
}: {
  flake-file.inputs.home-manager = {
    url = lib.mkDefault "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];
  flake = {
    nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = with self.nixosModules; [
        cs
        zig
        nim
        rust
        c
        js

        desktop
        hyprland
        audio
        bluetooth
        plymouth
        polkit
        sddm
        #plasma
        nvf
        gui
        #ctf
        docker
        essentials
        flatpak
        zen
        steam
        fontsImport
        keyboardFlashing
        recording
        stylix
        terminalEnchancements
        vm

        fUser
        nvidia
        networking
        systemGeneral
        systemdBoot
        #grub
      ];
    };
    programs.flatpak.packages = [
      "io.ente.auth"
      "com.brave.Browser"
      "com.discordapp.Discord"
      "org.gimp.GIMP"
    ];

    homeConfigurations.f = {self, ...}:
      inputs.home-manager.lib.homeManagerConfiguration {
        modules = with self.homeModules; [generic desktop];
        home.username = "f";
        home.homeDirectory = "/home/f";
        backupFileExtension = "home-managebak";
      };

    nixosModules.desktop = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        unityhub
        blender
      ];

      boot.initrd.kernelModules = ["amdgpu"];
      boot.kernelParams = ["nvidia-drm.modeset=1"];
    };
  };
}
