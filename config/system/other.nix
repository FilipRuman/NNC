{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_zen; # Should be stabler and better for gaming
  security.sudo.wheelNeedsPassword = false;
  services.gnome.gnome-keyring.enable = true;
  environment.systemPackages = with pkgs; [
    dbus
  ];
}
