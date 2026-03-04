{
  flake.nixosModules.bluetooth = {
    hardware.bluetooth = {
      enable = true;
      settings = {
        General = {
          AutoEnable = true;
        };
      };
    };
    services.blueman.enable = true;
  };
}
