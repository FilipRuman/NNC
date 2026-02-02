{lib, ...}: {
  imports = [
    ./hypr/main.nix
    ./apps/dunst.nix
    ./apps/rofi.nix
    ./apps/ghostty.nix
    ./apps/yazi.nix
    ./apps/fish.nix
    ./apps/spellcheck/spellcheck.nix
    ./apps/libreWolf.nix
    ./stylix.nix
    ./fonts.nix
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
