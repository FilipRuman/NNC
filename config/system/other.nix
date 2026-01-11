{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # Enable CUPS to print documents.
  services.printing.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  security.sudo.wheelNeedsPassword = false;
  services.gnome.gnome-keyring.enable = true;
}
