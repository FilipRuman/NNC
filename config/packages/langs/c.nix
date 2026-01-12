{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.pkgs.langs.c.enable = lib.mkEnableOption "enables the c lang";
  };
  config = lib.mkIf config.nixConf.pkgs.langs.c.enable {
    environment.systemPackages = with pkgs; [
      ninja
      glibc.dev
      man-pages
      clang
      gnumake
      clang-tools
      cmake
      gcc
    ];
  };
}
