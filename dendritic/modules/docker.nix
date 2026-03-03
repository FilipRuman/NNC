{
  flake.nixosModules.docker = {pkgs, ...}: {
    hardware.nvidia-container-toolkit.enable = true;
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
