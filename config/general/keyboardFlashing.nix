{
  pkgs,
  lib,
  config,
  ...
}: {
  options.nixConf.keyboardFlashing.enable = lib.mkEnableOption "";
  config = lib.mkIf config.nixConf.keyboardFlashing.enable {
    services.udev = {
      packages = with pkgs; [
        qmk-udev-rules
        via
      ];
    };
    hardware.keyboard.qmk.enable = true;
    environment.systemPackages = with pkgs; [
      qmk
    ];
  };
}
