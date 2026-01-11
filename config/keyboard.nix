{pkgs, ...}: {
  # Needed for via to work

  services.udev = {
    packages = with pkgs; [
      qmk-udev-rules # the only relevant
      via
    ]; # packages
  }; # udev
  
  hardware.keyboard.qmk.enable = true;

}
