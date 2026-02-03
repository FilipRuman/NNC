{
  wayland.windowManager.hyprland.enable = true;
  services.hyprpolkitagent.enable = true;
  wayland.windowManager.hyprland.settings = {
    cursor = {
      no_hardware_cursors = true;
      no_warps = false;
    };
    "$mod" = "Super";

    "$terminal" = "ghostty";
    "$menu" = "rofi";

    input = {
      kb_layout = "pl";
    };

    exec-once = [
      "flatpak run app.zen_browser.zen"
      #"flatpak run com.discordapp.Discord"
      "kwalletmanager5"
      "Hypridle"
      "waybar"
      "wl-paste --type text --watch cliphist store"
      "waypaper --random"
      "nextcloud"
      #"signal-desktop"
      # "thunderbird"
      "flatpak update"
      "updateNix"
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
    env = [
      "QT_QPA_PLATFORMTHEME,qt6ct"
    ];
    general = {
      gaps_in = 3;
      gaps_out = 3;

      border_size = 2;

      # "col.active_border" = "rgba(ff9e64ff) rgba(9ece6aff) 45deg";
      # "col.inactive_border" = "rgba(3c3836ff)";

      resize_on_border = true;

      allow_tearing = false;
      layout = "master";
    };
    # Audio playback
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

      shadow = {
        enabled = true;
      };

      blur = {
        enabled = true;
      };
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
    # "$mod, Z, exec, flatpak run app.zen_browser.zen"
    bind =
      [
        "$mod, Space, togglefloating,"
        "$mod SHIFT Control_L, Q, exit,"
        "$mod SHIFT, C, killactive,"
        "Super Control_L, E, exec,shutdown now"
        "$mod SHIFT Control_L, R, exec, reboot"

        "$mod, G, exec, ghostty"
        "$mod, M, exec, krusader"
        "$mod, H, exec, $menu -show drun"
        "$mod, X, exec, hyprlock"
        "$mod, T, exec, /etc/nixos/NNC/utils/record/start.bash"
        "$mod SHIFT, T, exec, /etc/nixos/NNC/utils/record/end.bash"
        "$mod, O, exec, flameshot gui"

        "Super , R, fullscreen,"
        "$mod, A, movetoworkspacesilent, 9"

        ", Print, exec, grimblast copy area"

        # Move focus
        "Super , Tab, cyclenext,"
        "Super , Tab, bringactivetotop,"

        "$mod, s , workspace, 1"
        "$mod SHIFT, s, movetoworkspace, 1"

        "$mod, d , workspace, 2"
        "$mod SHIFT, d, movetoworkspace, 2"

        "$mod, f , workspace, 3"
        "$mod SHIFT, f, movetoworkspace, 3"

        "$mod,  j , workspace, 4"
        "$mod SHIFT, j , movetoworkspace, 4"

        "$mod, k , workspace, 5"
        "$mod SHIFT, k , movetoworkspace, 5"

        "$mod, l , workspace, 9"
        "$mod SHIFT, l , movetoworkspace, 9"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (
            i: let
              ws = i + 1;
            in [
            ]
          )
          9)
      );
  };
}
