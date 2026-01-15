{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.pkgs.langs.cs.enable = lib.mkEnableOption "enables the c# lang";
  };
  config = lib.mkIf config.nixConf.pkgs.langs.cs.enable {
    environment.systemPackages = with pkgs; [
      mono
      dotnetCorePackages.sdk_10_0-bin
    ];
  };
}
