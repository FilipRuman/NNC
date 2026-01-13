{...}: {
  imports = [
    ./bluetooth.nix
    ./x11.nix
    ./user.nix
    ./audio.nix
    ./other.nix
    ./networking.nix
    ./bootloader/grub.nix
    ./polkit.nix
    ./wm/hypr.nix
    ./wm/plasma.nix
    ./gpu/nvidia.nix
  ];
}
