{pkgs, ...}: {
  hardware.nvidia-container-toolkit.enable = true; # for hardware encoding on jellyfin
  virtualisation.docker.enable = true;
}
