{
  pkgs,
  lib,
  config,
  ...
}: {
  options.nixConf.gui.enable = lib.mkEnableOption "";
  config = lib.mkIf config.nixConf.gui.enable {
    environment.systemPackages = with pkgs; [
      signal-desktop-bin
      gimp2
      gparted
      firefox
    ];
  };
}
