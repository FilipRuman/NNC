{
  lib,
  config,
  ...
}: {
  options.nixConf.system.bluetooth.enable = lib.mkEnableOption "";
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
