{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    module = {pkgs, ...}: {
      environment.systemPackages = [
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
  };
}
