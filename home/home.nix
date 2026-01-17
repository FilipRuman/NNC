{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./dunst.nix
    ./hypr/main.nix
    ./apps/ghostty.nix
    ./apps/yazi.nix
    ./apps/fish.nix
    ./apps/spellcheck.nix
    ./apps/libreWolf.nix
    ./stylix.nix
  ];
  home.username = "f";
  home.homeDirectory = "/home/f";
  home.stateVersion = "24.11";

  home.packages = [
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "flatpak run app.zen_browser.zen";
    TERMINAL = "ghostty";
  };

  programs.home-manager.enable = true;
}
