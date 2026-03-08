{
  flake.homeModules.general = {
    programs.hyprpanel = {
      enable = true;
      settings = {
        theme.bar = {
          transparent = true;
          margin_sides = "0.5em";
          floating = true;
        };
        menus.power.lowBatteryNotification = true;
        bar.layouts = {
          "0" = {
            left = ["dashboard" "workspaces" "windowtitle"];
            middle = [];

            right = [
              "volume"
              "network"
              "bluetooth"
              "battery"
              "systray"
              "clock"
              "notifications"
            ];
          };
        };
      };
    };
  };
}
