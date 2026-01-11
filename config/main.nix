{pkgs, ...}: {
  imports = [
    ./packages/main.nix
    ./system/main.nix
    ./nvidia.nix
    ./docker.nix
    ./nvim.nix
    ./stylix.nix
    ./flatpak.nix
    ./keyboard.nix
    ./programs.nix
    ./xdg_mime.nix
    ./bluetooth.nix
  ];
}
