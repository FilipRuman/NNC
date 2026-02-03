{...}: {
  imports = [
    ./recording.nix
    ./ssdmTheme.nix
    ./packages/main.nix
    ./system/main.nix
    ./docker.nix
    ./essentials.nix
    ./flatpak.nix
    ./keyboardFlashing.nix
    ./steam.nix
    ./stylix.nix
    ./terminalEnhancements.nix
    ./vm.nix
    ./xdg_mime.nix
    ./fonts.nix
  ];
}
