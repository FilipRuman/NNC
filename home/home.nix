{
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
  options = {
    machines.pc.enable = lib.mkEnableOption "";
    machines.laptop.enable = lib.mkEnableOption "";
  };
  config = {
    home = {
      username = "f";
      homeDirectory = "/home/f";
      stateVersion = "24.11";

      packages = [
      ];

      sessionVariables = {
        EDITOR = "nvim";
        BROWSER = "flatpak run app.zen_browser.zen";
        TERMINAL = "ghostty";
      };
    };

    programs.home-manager.enable = true;
  };
}
