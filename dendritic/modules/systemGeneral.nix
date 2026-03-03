{
  flake.nixosModules.systemGeneral = {pkgs, ...}: {
    # Idk where else to put it
    nixpkgs.config.allowUnfree = true;
    boot.kernelPackages = pkgs.linuxPackages_zen; # Should be stabler and better for gaming
    security.sudo.wheelNeedsPassword = false;
    services.gnome.gnome-keyring.enable = true;
    environment.systemPackages = with pkgs; [
      dbus
    ];
    services.dbus.enable = true;
    xdg.portal = {
      enable = true;

      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };

    nix.settings.experimental-features = ["nix-command" "flakes"];
    imports = [
    ];
    system.stateVersion = "25.11";
  };
}
