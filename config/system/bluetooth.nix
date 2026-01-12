{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.system.bluetooth.enable = lib.mkEnableOption "enables bluetooth support";
  };
  config = lib.mkIf config.nixConf.system.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      settings = {
        General = {
          AutoEnable = true;
        };
      };
    };
    services.blueman.enable = true;
  };
}
