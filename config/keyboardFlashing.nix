{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.keyboardFlashing.enable = lib.mkEnableOption "enables keyboard flashing";
  };
  config = lib.mkIf config.nixConf.keyboardFlashing.enable {
    # Needed for via to work
    services.udev = {
      packages = with pkgs; [
        qmk-udev-rules # the only relevant
        via
      ]; # packages
    }; # udev

    hardware.keyboard.qmk.enable = true;

    # maybe qmk package requiered??
  };
}
