{
  pkgs,
  lib,
  config,
  ...
}: {
  options.nixConf.langs.zig.enable = lib.mkEnableOption "enables the zig lang";
  config = lib.mkIf config.nixConf.langs.zig.enable {
    environment.systemPackages = with pkgs; [
      zig
    ];
  };
}
