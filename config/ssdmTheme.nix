{pkgs, ...}: let
  custom = pkgs.sddm-astronaut.override {
    embeddedTheme = "black_hole";
  };
in {
  environment.systemPackages = [
    custom
  ];

  services.displayManager.sddm = {
    theme = "sddm-astronaut-theme";
    extraPackages = [custom];
  };
}
