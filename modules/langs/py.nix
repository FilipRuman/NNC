{
  flake.nixosModules.py = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      python3
    ];
  };
}
