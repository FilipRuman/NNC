{
  pkgs,
  lib,
  config,
  ...
}: {
  options.nixConf.langs.js.enable = lib.mkEnableOption "enables the js lang";
  config = lib.mkIf config.nixConf.langs.js.enable {
    environment.systemPackages = with pkgs; [
      yarn
      nodePackages_latest.nodejs
    ];
  };
}
