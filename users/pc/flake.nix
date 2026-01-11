{
  description = "Flake for PC machine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    stylix.url = "github:danth/stylix";
    home.url = "path:./../../home";
  };

  outputs = {
    self,
    nix-flatpak,
    home,
    ...
  } @ inputs: {
    module = {...}: {
      imports = [
        inputs.home-manager.nixosModules.default
        nix-flatpak.nixosModules.nix-flatpak
        inputs.stylix.nixosModules.stylix
        home.f
      ];
    };
  };
}
