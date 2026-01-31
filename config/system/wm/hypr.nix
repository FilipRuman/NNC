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
    programs.hyprland = {
      enable = true;
      withUWSM = false; # recommended for most users
      xwayland.enable = true; # Xwayland can be disabled.
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
      configPackages = [pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland];
      config = {
        common = {
          default = ["gtk"];
        };
        hyprland = {
          default = ["gtk" "hyprland"];
          "org.freedesktop.impl.portal.FileChooser" = ["gtk"];
        };
      };
    };
  };
}
