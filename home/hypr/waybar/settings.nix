{
  programs.waybar.settings = [
    {
      layer = "top";
      exclusive = true;
      passthrough = false;
      position = "top";
      spacing = 3;
      fixed-center = true;
      ipc = true;
      margin-top = 6;
      margin-left = 8;
      margin-right = 8;

      modules-left = ["hyprland/window" "battery"];
      modules-center = ["custom/spotify" "hyprland/workspaces"];
      modules-right = ["custom/updater" "memory" "disk" "network" "pulseaudio" "backlight" "clock" "tray"];

      "custom/notification" = {
        tooltip = false;
        format = "{icon}";
        format-icons = {
          notification = " <span foreground='red'><sup></sup></span>";
          none = " ";
          dnd-notification = "<span foreground='red'><sup></sup></span>";
          dnd-none = " ";
          inhibited-notification = "<span foreground='red'><sup></sup></span>";
          inhibited-none = " ";
          dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
          dnd-inhibited-none = " ";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click-right = "sleep 0.1 && swaync-client -d -sw";
        escape = true;
      };

      "hyprland/window" = {
        format = "{}";
        max-length = 35;
        separate-outputs = true;
      };

      "hyprland/workspaces" = {
        format = "{icon}";
        show-special = false;
        on-click = "activate";
        all-outputs = true;
        sort-by-number = true;
        format-icons = {
          "1" = "  ";
          "2" = "  ";
          "3" = "  ";
          "4" = "  ";
          "5" = "  ";
          "6" = "  ";
          "7" = "  ";
          "8" = " 󰓇 ";
          "9" = " 󰙯 ";
          "10" = "  ";
          "active" = "  ";
          "urgent" = " ";
        };

        persistent-workspaces = {
          "*" = [1 2 3 4 5];
        };
        on-scroll-up = "hyprctl dispatch workspace e+1";
        on-scroll-down = "hyprctl dispatch workspace e-1";
      };

      network = {
        format = "{ifname}";
        format-wifi = "󰤨 {essid}";
        format-ethernet = "󰈁 Wired";
        format-disconnected = "";
        tooltip-format = " {ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes} ";
        format-linked = "󰈁 {ifname} (No IP)";
        tooltip-format-wifi = " {essid} ({signalStrength}%)   -  {bandwidthDownBytes}  {bandwidthUpBytes}";
        tooltip-format-ethernet = " {ifname} 󰈁 ";
        tooltip-format-disconnected = " 󰈂 Disconnected ";
        max-length = 36;
      };

      memory = {
        interval = 10;
        format = " {used:0.01f}G";
        format-alt = " {percentage}%";
        format-alt-click = "click";
        tooltip = true;
        tooltip-format = " {used:0.1f}GB/{total:0.1f}G ";
        on-click-right = "alacritty --title btop sh -c 'btop'";
      };

      battery = {
        interval = 60;
        align = 0;
        rotate = 0;
        full-at = 100;
        design-capacity = false;
        states = {
          good = 95;
          warning = 30;
          critical = 10;
        };
        format = "{icon}  {capacity}%";
        format-charging = " {capacity}%";
        format-plugged = " {capacity}%";
        format-full = "{icon}  Full";
        format-alt = "{icon} {time}";
        format-icons = ["" "" "" "" ""];
        format-time = "{H}h {M}min";
        tooltip = true;
        tooltip-format = " {timeTo} {power}w ";
      };

      pulseaudio = {
        format = "{icon} {volume}%";
        format-bluetooth = "{icon}  {volume} %";
        format-muted = " Muted";
        format-icons = {
          headphone = " ";
          hands-free = " ";
          headset = " ";
          phone = "";
          portable = "";
          car = "";
          default = ["" "" "󰕾" " "];
          ignored-sinks = ["Easy Effects Sink"];
        };
        scroll-step = 5.0;
        on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        on-click-right = "pavucontrol -t 3";
        on-scroll-up = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
        on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        smooth-scrolling-threshold = 1;
      };

      "pulseaudio#microphone" = {
        format = "{format_source}";
        format-source = " {volume}%";
        format-source-muted = "  Muted";
        on-click = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        on-click-right = "pavucontrol -t 4";
        on-scroll-up = "pamixer --default-source -i 5";
        on-scroll-down = "pamixer --default-source -d 5";
        scroll-step = 5;
      };

      disk = {
        format = "󰋊 {percentage_used}%";
      };

      clock = {
        format = "󰥔 {:%a, %H:%M:%S}";
        format-alt = " {:%Y, %d %B}";
        tooltip-format = " <tt><small>{calendar}</small></tt> ";
        interval = 1;
        calendar = {
          mod = "year";
          mode-mon-col = 3;
          weeks-pos = "right";
          on-scroll = 1;
          format = {
            months = "<span color='#ffead3'><b>{}</b></span>";
            days = "<span color='#ecc6d9'><b>{}</b></span>";
            weeks = "<span color='#99ffdd'><b>W{}</b></span>";
            weekdays = "<span color='#ffcc66'><b>{}</b></span>";
            today = "<span color='#ff6699'><b><u>{}</u></b></span>";
          };
        };
      };
      actions = {
        on-click-right = "mode";
        on-click-forward = "tz_up";
        on-click-backward = "tz_down";
        on-scroll-up = "shift_up";
        on-scroll-down = "shift_down";
      };

      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          activated = " ";
          deactivated = " ";
        };
      };

      tray = {
        icon-size = 20;
        spacing = 9;
      };
    }
  ];
}
