{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings = {show_hidden = true;};
    keymap = {
      input.prepend_keymap = [
        {
          run = "rename";
          on = ["<F2>"];
        }
      ];
    };
  };
}
