{pkgs, ...}: {
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
        package = pkgs.nerd_fonts.override {fonts = ["FiraCode"];};
        name = "FiraCode Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };

    targets = {
      btop.enable = true;
      ghostty.enable = true;
      qt.enable = true;
      starship.enable = true;
      fish.enable = true;
      rofi.enable = true;
      yazi.enable = true;
    };
  };
}
