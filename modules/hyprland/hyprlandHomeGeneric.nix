{
  flake.homeModules.general = {
    wayland.windowManager.hyprland.enable = true;
    services.hyprpolkitagent.enable = true;
    wayland.windowManager.hyprland.settings = {
      cursor = {
        no_hardware_cursors = true;
        no_warps = false;
      };
      input.kb_layout = "pl";
      xwayland.force_zero_scaling = true;
      exec-once = [
        "Hypridle"
        "waybar"
        "waypaper --random"
      ];

      bindm = [
        "Super, mouse:272, movewindow"
        "Super, mouse:273, resizewindow"
      ];
      # stylix modifies the qt theme by the qtct by default
      env = [
        "QT_QPA_PLATFORMTHEME,qt6ct"
      ];
      general = {
        gaps_in = 3;
        gaps_out = 3;
        border_size = 2;
        resize_on_border = true;
        allow_tearing = false;
        layout = "master";
      };
      # Handle some multimedia key inputs
      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      bindl = [
        ", XF86AudioNext,  exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay,  exec, playerctl play-pause"
        ", XF86AudioPrev,  exec, playerctl previous"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
      decoration = {
        rounding = 2;
        active_opacity = 1.0;
        inactive_opacity = 0.9;
        shadow.enabled = true;
        blur.enabled = true;
      };

      animations = {
        enabled = true;
        bezier = "ease,0.4,0.02,0.21,1";
        animation = [
          "windows, 1, 3.5, ease, slide"
          "windowsOut, 1, 3.5, ease, slide"
          "border, 1, 6, default"
          "fade, 1, 3, ease"
          "workspaces, 1, 0.5, ease"
        ];
      };
      bind = [
        "Super, Space, togglefloating,"
        "Super SHIFT Control_L, Q, exit,"
        "Super SHIFT, C, killactive,"
        "Super Control_L, E, exec,shutdown now"
        "Super Control_L, S, exec,systemctl suspend"
        "Super SHIFT Control_L, R, exec, reboot"

        "Super, G, exec, ghostty"
        "Super, H, exec, rofi -show drun"
        "Super, X, exec, hyprlock"
        "Super, T, exec, /etc/nixos/NNC/utils/record/start.bash"
        "Super SHIFT, T, exec, /etc/nixos/NNC/utils/record/end.bash"
        "Super, O, exec, grimblast -n copy area"
        "Super Control_L, O, exec, grimblast -n edit area"
        ", Print, exec, grimblast copy area"

        "Super , R, fullscreen,"

        "Super, A , workspace, 0"
        "Super SHIFT, A, movetoworkspace, 0"

        "Super, s , workspace, 1"
        "Super SHIFT, s, movetoworkspace, 1"

        "Super, d , workspace, 2"
        "Super SHIFT, d, movetoworkspace, 2"

        "Super, f , workspace, 3"
        "Super SHIFT, f, movetoworkspace, 3"

        "Super,  j , workspace, 4"
        "Super SHIFT, j , movetoworkspace, 4"

        "Super, k , workspace, 5"
        "Super SHIFT, k , movetoworkspace, 5"

        "Super, l , workspace, 9"
        "Super SHIFT, l , movetoworkspace, 9"
      ];
    };
  };
}
