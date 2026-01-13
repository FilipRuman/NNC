{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.flatpak.enable = lib.mkEnableOption "enables flatpak support";
    nixConf.flatpak.packages = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      example = ["org.gimp.GIMP"];
      description = "Flatpak application IDs to install system-wide.";
    };
  };
  config = lib.mkIf config.nixConf.flatpak.enable {
    services.flatpak = {
      enable = true;
      packages = config.nixConf.flatpak.packages;
    };
    xdg.portal = {
      enable = true;

      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };
    services.dbus.enable = true;

    systemd.services.flatpak-repo = {
      wantedBy = ["multi-user.target"];
      path = [pkgs.flatpak];
      script = ''
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
    };
  };
}
