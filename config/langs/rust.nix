{
  pkgs,
  lib,
  config,
  ...
}: {
  options.nixConf.langs.rust.enable = lib.mkEnableOption "enables rust lang packages";
  config = lib.mkIf config.nixConf.langs.rust.enable {
    environment.systemPackages = with pkgs; [
      rust-analyzer
      rustfmt
      cargo
      rustc
    ];
  };
}
