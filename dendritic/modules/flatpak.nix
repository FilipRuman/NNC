{
  flake.nixosModules.essentials = {
    pkgs,
    lib,
    config,
    ...
  }: {
    options = {
      flatpak.packages = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        example = ["org.gimp.GIMP"];
        description = "Flatpak application IDs to install system-wide.";
      };
    };
    services.flatpak = {
      enable = true;
      packages = config.nixConf.flatpak.packages;
    };

    systemd.services.flatpak-repo = {
      wantedBy = ["multi-user.target"];
      path = [pkgs.flatpak];
      script = ''
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
    };
  };
}
