{
  flake.nixosModules.nim = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      nim-unwrapped-2_0
    ];
  };
}
