{
  pkgs,
  lib,
  config,
  ...
}: {
  options.nixConf.langs.nim.enable = lib.mkEnableOption "enables the nim lang";
  config = lib.mkIf config.nixConf.langs.nim.enable {
    environment.systemPackages = with pkgs; [
      nim-unwrapped-2_0
    ];
  };
}
