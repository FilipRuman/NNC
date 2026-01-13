{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.system.wm.plasma.enable = lib.mkEnableOption "enables the hyprland";
  };

  config = lib.mkIf config.nixConf.system.wm.plasma.enable {
    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
    #Exclude
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      konsole
      oxygen
      elisa
    ];
  };
}
