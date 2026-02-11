{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.pkgs.unity.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.nixConf.pkgs.unity.enable {
    environment.systemPackages = with pkgs; [
      unityhub
    ];
  };
}
