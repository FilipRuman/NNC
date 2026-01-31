{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: {
    module = {pkgs, ...}: {
      imports = [inputs.nvf.nixosModules.default];
      programs.nvf = {
        enable = true;
        settings = ./config/main.nix;
      };
      environment.systemPackages = with pkgs; [
        # imagemagick
        # ueberzugpp
      ];
    };
  };
}
