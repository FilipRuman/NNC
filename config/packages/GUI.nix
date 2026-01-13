{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.pkgs.gui.enable = lib.mkEnableOption "enables basic GUI packages";
  };
  config = lib.mkIf config.nixConf.pkgs.gui.enable {
    environment.systemPackages = with pkgs; [
      signal-desktop-bin
      (flameshot.override {enableWlrSupport = true;})

      nextcloud-client

      gparted
      firefox

      neovide
    ];
  };
}
