{
  # idk. where else to put it
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./GUI.nix
    ./ctf.nix
    ./recording.nix
    ./docker.nix
    ./essentials.nix
    ./flatpak.nix
    ./keyboardFlashing.nix
    ./steam.nix
    ./stylix.nix
    ./terminalEnhancements.nix
    ./vm.nix
  ];
}
