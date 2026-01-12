{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.essentials.enable = lib.mkEnableOption "enables essential packages";
  };
  config = lib.mkIf config.nixConf.essentials.enable {
    environment.systemPackages = with pkgs; [
      dbus
      steam-run
      btop
    ];

    programs.git.enable = true;
  };
}
