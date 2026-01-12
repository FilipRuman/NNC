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
    ./langs/c.nix
    ./langs/cs.nix
    ./langs/js.nix
    ./langs/zig.nix
    ./langs/rust.nix
  ];
}
