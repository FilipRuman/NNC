{
  flake.homeModules.general = {
    programs.yazi = {
      enable = true;
      enableFishIntegration = true;
      settings = {show-hidden = true;};
      keymap = {
        input.prepend_keymap = [
          {
            run = "rename";
            on = ["<F2>"];
          }
        ];
      };
    };
  };
}
