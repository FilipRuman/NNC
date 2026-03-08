{
  flake.homeModules.general = {
    programs.hyprpanel = {
      enable = true;
      settings = {
        menus = {
          clock.time.military = false;
          clock.time.hideSeconds = true;
          power.lowBatteryNotification = true;
        };
        bar = {
          battery.hideLabelWhenFull = true;
          clock.showTime = true;
          clock.format = "%m %d  %H:%M";
          layouts = {
            "0" = {
              left = ["dashboard" "workspaces" "windowtitle"];
              middle = [];

              right = [
                "volume"
                "network"
                "bluetooth"
                # "systray"
                "clock"
                "notifications"
                "battery"
              ];
            };
          };
        };
        theme.bar = {
          transparent = true;
          margin_sides = "0.5em";
          floating = true;
        };
      };
    };
  };
}
