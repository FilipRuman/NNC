{
  flake.nixosModules.fontsImport = {pkgs, ...}: let
    myLocalFonts = pkgs.runCommand "my-local-fonts" {} ''
      mkdir -p $out/share/fonts
      cp /etc/nixos/NNC/fonts/fontFiles/*.{ttf,otf} $out/share/fonts/ || true
    '';
  in {
    fonts.packages = [
      myLocalFonts
    ];
  };
}
