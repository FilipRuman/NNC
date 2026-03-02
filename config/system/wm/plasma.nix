{
  pkgs,
  lib,
  config,
  ...
}: {
  options.nixConf.system.wm.plasma.enable = lib.mkEnableOption "";
  config = lib.mkIf config.nixConf.system.wm.plasma.enable {
    services.desktopManager.plasma6.enable = true;
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      konsole
      oxygen
      elisa
    ];
  };
}
