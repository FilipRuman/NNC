{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.pkgs.langs.zig.enable = lib.mkEnableOption "enables the zig lang";
  };
  config = lib.mkIf config.nixConf.pkgs.langs.zig.enable {
    environment.systemPackages = with pkgs; [
      zig
    ];
  };
}
