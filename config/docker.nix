{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nixConf.docker.enable = lib.mkEnableOption "enables docker support";
  };
  config = lib.mkIf config.nixConf.docker.enable {
    virtualisation.docker = {
      enable = true;
      enableNvidia = true;
    };

    hardware.nvidia-container-toolkit.enable =
      lib.mkIf config.nixConf.system.gpu.nvidia.enable true;

    environment.systemPackages = with pkgs; [
      nvidia-container-toolkit
    ];

    # Regular Docker
    virtualisation.docker.daemon.settings.features.cdi = true;
  };
}
