{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.pkgs.langs.js.enable = lib.mkEnableOption "enables the js lang";
  };
  config = lib.mkIf config.nixConf.pkgs.langs.js.enable {
    environment.systemPackages = with pkgs; [
      yarn
      nodePackages_latest.nodejs
    ];
  };
}
