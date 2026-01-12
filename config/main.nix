{pkgs, ...}: {
  imports = [
    ./packages/main.nix
    ./system/main.nix
    ./docker.nix
    ./essentials.nix
    ./flatpak.nix
    ./keyboardFlashing.nix
    ./nvim.nix
    ./steam.nix
    ./stylix.nix
    ./terminalEnhancements.nix
    ./vm.nix
    ./xdg_mime.nix
  ];
}
