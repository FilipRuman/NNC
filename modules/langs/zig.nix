{
  flake.nixosModules.zig = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      zig
    ];
  };
}
