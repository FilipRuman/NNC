{
  pkgs,
  lib,
  config,
  ...
}: let
  custom = pkgs.sddm-astronaut.override {
    embeddedTheme = "black_hole";
  };
in {
  options.nixConf.system.sddm.enable = lib.mkEnableOption "";

  config = lib.mkIf config.nixConf.system.sddm.enable {
    environment.systemPackages = [
      custom
    ];

    services.displayManager.sddm = {
      theme = "sddm-astronaut-theme";
      extraPackages = [custom];
      wayland = {
        enable = true;
        compositor = "kwin";
      };
      enable = true;
    };
  };
}
