{
  pkgs,
  lib,
  config,
  ...
}: {
  options.nixConf.ctf.enable = lib.mkEnableOption "";

  config = lib.mkIf config.nixConf.ctf.enable {
    environment.systemPackages = with pkgs; [
      openssl_3
      john
      ghidra
    ];
  };
}
