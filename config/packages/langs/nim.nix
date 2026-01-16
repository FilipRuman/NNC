{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.pkgs.langs.nim.enable = lib.mkEnableOption "enables the nim lang";
  };
  config = lib.mkIf config.nixConf.pkgs.langs.nim.enable {
    environment.systemPackages = with pkgs; [
      nim-unwrapped-2_0
    ];
  };
}
