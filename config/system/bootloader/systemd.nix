{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.system.bootloader.systemd.enable = lib.mkEnableOption "enables the grub bootloader";
  };
  config = lib.mkIf config.nixConf.system.bootloader.systemd.enable {
    boot.loader.systemd-boot.enable = true;
  };
}
