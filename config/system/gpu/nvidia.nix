{
  lib,
  config,
  ...
}: {
  options.nixConf.system.gpu.nvidia.enable = lib.mkEnableOption "";
  config = lib.mkIf config.nixConf.system.gpu.nvidia.enable {
    # Enable OpenGL
    hardware.graphics = {
      enable = true;
    };

    #For nixos-unstable, they renamed it
    services.xserver.enable = true;
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      open = true;
    };
  };
}
