{...}: {
  imports = [
    ./x11.nix
    ./user.nix
    ./audio.nix
    ./other.nix
    ./plasma.nix
    ./networking.nix
    ./bootloader/grub.nix
    ./polkit.nix
    ./wm/hypr.nix
    ./gpu/nvidia.nix
  ];
}
