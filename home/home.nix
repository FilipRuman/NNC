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
    # ./stylix/main.nix
  ];
  home.username = "f";
  home.homeDirectory = "/home/f";
  home.stateVersion = "24.11";

  home.packages = [
    pkgs.nerd-fonts
    pkgs.neovim
    pkgs.git
  ];

  home.sessionVariables = {
    EDITOR = "ne";
    BROWSER = "flatpak run app.zen_browser.zen";
    TERMINAL = "ghostty";
  };

  programs.home-manager.enable = true;
}
