{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "pl";
      variant = "";
      options = "grp:win_space_toggle";
    };
  };
}
