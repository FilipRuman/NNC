{
  lib,
  config,
  pkgs,
  ...
}: {
  options.nixConf.docker.enable = lib.mkEnableOption "";
  config = lib.mkIf config.nixConf.docker.enable {
    hardware.nvidia-container-toolkit.enable =
      lib.mkIf config.nixConf.system.gpu.nvidia.enable true;
    environment.systemPackages = with pkgs; [
      nvidia-container-toolkit
    ];
    virtualisation.docker = {
      enable = true;
      enableNvidia = true;
      daemon.settings.features.cdi = true;
      enableOnBoot = false; # enable by hand later with the command from hyprland
    };
  };
}
