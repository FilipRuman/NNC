{
  flake.nixosModules.hyprland = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      wofi
      hyprlock
      hypridle
      dunst
      hyprpanel
      swaybg
      waypaper
      xdg-desktop-portal
      waybar

      kdePackages.isoimagewriter # Optional: Program to write hybrid ISO files onto USB disks
      kdePackages.partitionmanager # Optional: Manage the disk devices, partitions and file systems on your computer
      wayland-utils # Wayland utilities
      wl-clipboard # Command-line copy/paste utilities for Wayland
    ];

    programs.hyprland = {
      enable = true;
      withUWSM = false; # recommended for most users
      xwayland.enable = true; #
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
