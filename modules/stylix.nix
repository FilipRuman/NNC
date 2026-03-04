{inputs, ...}: {
  flake-file.inputs.stylix.url = "github:danth/stylix";

  flake.nixosModules.stylix = {pkgs, ...}: let
    fonts = import ./fonts/_consts.nix {inherit pkgs;};
  in {
    imports = [inputs.stylix.nixosModules.stylix];
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

  flake.homeModules.generic = {
    stylix.targets = {
      dunst.enable = false;
      hyprlock.enable = false;
      nvf.enable = false;
    };
  };
}
