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

      kdePackages.isoimagewriter # Optional: Program to write hybrid ISO files onto USB disks
      kdePackages.partitionmanager # Optional: Manage the disk devices, partitions and file systems on your computer
      wayland-utils # Wayland utilities
      wl-clipboard # Command-line copy/paste utilities for Wayland
    ];

    services = {
      displayManager.sddm.enable = true;

      displayManager.sddm.wayland.enable = true;
    };
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
