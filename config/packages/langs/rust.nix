{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.pkgs.langs.rust.enable = lib.mkEnableOption "enables rust lang packages";
  };
  config = lib.mkIf config.nixConf.pkgs.langs.rust.enable {
    environment.systemPackages = with pkgs; [
      rust-analyzer
      rustfmt
      cargo
      rustc
    ];
  };
}
