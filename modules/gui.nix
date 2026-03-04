{
  flake.nixosModules.gui = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      signal-desktop
      gimp2
      gparted
      firefox
      feishin
    ];
  };
}
