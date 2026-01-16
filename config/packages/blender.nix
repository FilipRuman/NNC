{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    nixConf.pkgs.blender.enable = lib.mkEnableOption "enables packages for blender";
  };
  config = lib.mkIf config.nixConf.pkgs.ctf.enable {
    environment.systemPackages = [
      pkgs.blender
    ];
  };
}
