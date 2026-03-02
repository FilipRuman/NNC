{...}: {
  imports = [
    ./bluetooth.nix
    ./user.nix
    ./audio.nix
    ./other.nix
    ./networking.nix
    ./bootloader/grub.nix
    ./sddm.nix
    ./bootloader/systemd.nix
    ./polkit.nix
    ./wm/hypr.nix
    ./wm/plasma.nix
    ./gpu/nvidia.nix
    ./plymouth.nix
    ./polkit.nix
  ];
}
