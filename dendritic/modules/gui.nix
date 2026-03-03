{
  flake.nixosModules.gui = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      signal-desktop-bin
      gimp2
      gparted
      firefox
      feishin
    ];
  };
}
