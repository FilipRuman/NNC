{
  flake.nixosModules.keyboardFlashing = {pkgs, ...}: {
    services.udev = {
      packages = with pkgs; [
        qmk-udev-rules
        via
      ];
    };
    hardware.keyboard.qmk.enable = true;
    environment.systemPackages = with pkgs; [
      qmk
    ];
  };
}
