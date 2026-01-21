{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.machines.laptop.enable {
    wayland.windowManager.hyprland.settings = {
      input = {
        sensitivity = 0;
        accel_profile = "flat";
      };
      monitor = [
        "DP-1, 1920x1080@144, 0x0, 1"
        "DP-4, 1920x1080@144, 0x0, 1"
      ];
    };
  };
}
