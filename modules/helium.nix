{ inputs, ... }:
{
  flake-file.inputs.helium = {
    url = "github:AlvaroParker/helium-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.homeModules.general =
    {
      pkgs,
      ...
    }:
    {
      home.packages = [
        inputs.helium.packages.${pkgs.system}.default
      ];
    };
}
