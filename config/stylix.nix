{
  pkgs,
  lib,
  config,
  ...
}: let
  fonts = import ./../fonts.nix {inherit pkgs;};
in {
  options = {
    nixConf.stylix.enable = lib.mkEnableOption "enables stylix";
  };
  config = lib.mkIf config.nixConf.sylix.enable {
    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
      fonts = {
        sizes = {
          applications = 12;
          terminal = 15;
          desktop = 10;
          popups = 10;
        };
        monospace = {
          package = fonts.codePckg;
          name = fonts.codeName;
        };
        sansSerif = {
          package = fonts.sansSerifPckg;
          name = fonts.sansSerifName;
        };

        emoji = {
          package = fonts.emojiPckg;
          name = fonts.emojiName;
        };
      };
    };
  };
}
