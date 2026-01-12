{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.system.wm.hypr.enable = lib.mkEnableOption "enables the hyprland";
  };
  config = lib.mkIf config.nixConf.system.wm.hypr.enable {
    environment.systemPackages = with pkgs; [
      rofi
      rofi-calc
      hyprlock
      hypridle
      dunst
      swaybg
      waypaper
      xdg-desktop-portal
      waybar
    ];
  };
}
