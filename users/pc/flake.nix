{
  description = "Flake for PC machine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    stylix.url = "github:danth/stylix";
    home.url = "path:./../../home";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = {
    self,
    nix-flatpak,
    home,
    stylix,
    ...
  } @ inputs: {
    module = {...}: {
      imports = [
        inputs.home-manager.nixosModules.default
        nix-flatpak.nixosModules.nix-flatpak
        stylix.nixosModules.stylix
        home.f
        ./../../config/main.nix
      ];
    };
  };
}
