{
  pkgs,
  lib,
  config,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./GUI.nix
    ./ctf.nix
    ./langs/main.nix
    ./blender.nix
  ];
}
