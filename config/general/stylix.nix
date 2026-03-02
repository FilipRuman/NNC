{
  pkgs,
  lib,
  config,
  ...
}: let
  fonts = import ../fonts/consts.nix {inherit pkgs;};
in {
  options.nixConf.stylix.enable = lib.mkEnableOption "";

  config = lib.mkIf config.nixConf.stylix.enable {
    stylix = {
      enable = true;
      # base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
      # base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night.yaml";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark-terminal.yaml";

      cursor.size = 16;
      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
      };
      autoEnable = true;
      targets = {
        grub.enable = false;
        plymouth.enable = false;
      };
      fonts = {
        sizes = {
          applications = 12;
          terminal = 15;
          desktop = 10;
          popups = 10;
        };
        monospace = {
          package = fonts.codePkg;
          name = fonts.codeName;
        };
        sansSerif = {
          package = fonts.sansSerifPkg;
          name = fonts.sansSerifName;
        };

        emoji = {
          package = fonts.emojiPkg;
          name = fonts.emojiName;
        };
      };
    };
  };
}
