{
  config,
  pkgs,
  ...
}: let
  myLocalFonts = pkgs.runCommand "my-local-fonts" {} ''
    mkdir -p $out/share/fonts
    cp /etc/nixos/NNC/fonts/*.{ttf,otf} $out/share/fonts/ || true
  '';
in {
  fonts.fonts = with pkgs; [
    myLocalFonts
  ];
}
