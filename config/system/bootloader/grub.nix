{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.system.bootloader.grub.enable = lib.mkEnableOption "enables the grub bootloader";
  };
  config = lib.mkIf config.nixConf.system.bootloader.grub.enable {
    boot = {
      # Bootloader
      loader = {
        efi.canTouchEfiVariables = true;
        grub = {
          enable = true;
          device = "nodev";
          efiSupport = true;
          useOSProber = true;
        };
      };
    };
  };
}
