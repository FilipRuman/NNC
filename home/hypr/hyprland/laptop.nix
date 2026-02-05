{
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
        "eDP-1, 1920x1080@240, 0x0, 1"
      ];
    };
  };
}
