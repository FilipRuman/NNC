{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.pkgs.ctf.enable = lib.mkEnableOption "enables packages for capture the flag events";
  };
  config = lib.mkIf config.nixConf.pkgs.ctf.enable {
    environment.systemPackages = with pkgs; [
      openssl_3
      ghidra
    ];
  };
}
