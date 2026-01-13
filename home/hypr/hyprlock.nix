{
  programs.hyprlock.enable = true;
  programs.hyprlock.settings = {
    general = {
      disable_loading_bar = true;
      hide_cursor = true;
    };

    background = [
      {
        path = "/home/f/Nextcloud/Walpapers/wallhaven-oggvw9.jpg";
        blur_passes = 2;
        blur_size = 2;
      }
    ];

    input-field = [
      {
        size = "220, 50";
        position = "0, -80";
        monitor = "";
        dots_center = true;
        fade_on_empty = false;
        font_color = "rgb(202, 211, 245)";
        inner_color = "rgba(202, 211, 245,0)";
        outer_color = "#a4abf2";
        placeholder_text = ''<span foreground="##cad3f5">Password...</span>'';
        outline_thickness = 2;
        shadow_passes = 2;
      }
    ];
  };
}
