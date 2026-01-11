{pkgs, ...}: {
  # runCommand "bash";
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        AutoEnable = true;
      };
    };
  };
  services.blueman.enable = true;
}
