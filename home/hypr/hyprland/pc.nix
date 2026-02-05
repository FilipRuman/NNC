{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.machines.pc.enable {
    wayland.windowManager.hyprland.settings = {
      exec-once = ["/home/f/docker/wakatime/wakapi"];
      input = {
        sensitivity = -.7;
        accel_profile = "flat";
      };
      monitor = [
        "DP-1, 1920x1080@144, 0x0, 1"
        "DP-4, 1920x1080@144, 0x0, 1"
      ];
    };
  };
}
