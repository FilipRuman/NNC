{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.docker.enable = lib.mkEnableOption "enables docker support";
  };
  config = lib.mkIf config.nixConf.docker.enable {
    virtualisation.docker.enable = true;

    hardware.nvidia-container-toolkit.enable =
      lib.mkIf config.nixConf.system.gpu.nvidia.enable true;
  };
}
