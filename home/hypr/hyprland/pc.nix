{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.machines.pc.enable {
    programs.hyprlock.enable = true;
    programs.hyprlock.settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        no_fade_in = false;
        grace = 0;
      };

      background = [
        {
          path = "/home/f/Walpapers/wallhaven-vpz2kp.jpg";
          blur_passes = 0;
          blur_size = 0;

          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "600, 80";
          outline_thickness = 3;
          dots_size = 0.4; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.4; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(255, 255, 255, 0.1)";
          font_color = "rgb(200, 200, 200)";
          fade_on_empty = false;
          font_family = "SF Pro Display Bold";
          placeholder_text = ''<i><span foreground="##ffffff99"> Enter Pass </span></i>'';
          hide_input = false;
          position = "0, -510";
          halign = "center";
          valign = "center";
        }
      ];

      # Time-Hour
      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<span>$(date +"%I")</span>"'';
          color = ''rgba(255, 255, 255, 1)'';
          font_size = 250;
          font_family = "StretchPro";
          position = "-80, 230";
          halign = "center";
          valign = "center";
        }

        # Time-Minute
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<span>$(date +"%M")</span>"'';
          color = "rgba(147, 196, 255, 1)";
          font_size = 250;
          font_family = "StretchPro";
          position = "0, -20";
          halign = "center";
          valign = "center";
        }

        # Day-Month-Date
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%d %B, %a.")"'';
          color = ''rgba(255, 255, 255, 100)'';
          font_size = 45;
          font_family = ''Suisse Int'l Mono'';
          position = ''20, -180'';
          halign = ''center'';
          valign = ''center'';
        }

        # USER
        {
          monitor = "";
          text = "    $USER";
          color = "rgba(216, 222, 233, 0.80)";
          outline_thickness = 2;
          dots_size = 0.3; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.3; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          font_size = 50;
          font_family = "SF Pro Display Bold";
          position = "0, -400";
          halign = "center";
          valign = "center";
        }
      ];
    };

    programs.hyprlock.settings = {
      general = {
        fractional_scaling = 1;
      };
    };

    wayland.windowManager.hyprland.settings = {
      exec-once = ["/home/f/docker/wakatime/wakapi" "sudo docker ps"];
      input = {
        sensitivity = -.7;
        accel_profile = "flat";
      };
      monitor = [
        "DP-1, 1920x1080@144, 0x0, 1"
        "DP-4, 3840x2160@165, 0x0, 1.5, bitdepth, 10, cm, hdr"
      ];
    };
  };
}
