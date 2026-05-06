{
  flake.nixosModules.gui = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      signal-desktop
      gparted
      firefox
      feishin
      ghostty
      orca-slicer
    ];
  };
}
